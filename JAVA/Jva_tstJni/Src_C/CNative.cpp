#include "CNative.h"

#include <windows.h>
#include <iostream.h>
#include <conio.h>

#pragma argsused

JNIEXPORT jint JNICALL Java_tstjni_CNative_SumInteger(JNIEnv *env, jclass cls, jint a, jint b)
   {
   wrtMsg("Somme de "); cout <<a <<" et de " <<b ;
   jint sum = a+b ;
   return sum ;
   }

JNIEXPORT jstring JNICALL Java_tstjni_CNative_SumString(JNIEnv *env, jclass cls, jstring jStrA, jstring jStrB)
   {

 	// Allocation des cha�nes UTF (convertion unicode -> UTF8)
	const char *cStrA = env->GetStringUTFChars(jStrA, NULL) ;            // Dans env
	const char *cStrB = env->GetStringUTFChars(jStrB, NULL) ;            // Dans env
   char       *cStrR = new char[strlen(cStrA) + strlen(cStrB) + 1] ;    // Local

   // Concat�nation des ch�nes
   strcpy(cStrR, cStrA) ;
   strcat(cStrR, cStrB) ;

   // Allocation de la cha�ne r�sultat (convertion UTF8 -> unicode)
   wrtMsg("Concat�nation de ") ; cout <<"<" <<cStrA <<">"<<" et de " <<"<" <<cStrB <<">" ;
   jstring jStrR = env->NewStringUTF(cStrR) ;

	// Lib�ration de l'allocation des cha�nes UTF8
	env->ReleaseStringUTFChars(jStrA, cStrA) ;
	env->ReleaseStringUTFChars(jStrB, cStrB) ;
   delete (cStrR) ;

   // Retour de la jString
   return jStrR ;
   }

JNIEXPORT void JNICALL Java_tstjni_CNative_WriteMyInt(JNIEnv *env, jobject obj)
   {

   // Acc�s � la classe appelante
   jclass   cls = env->GetObjectClass(obj) ;

   // Recherche de l'ID du membre de la classe par son nom et la signatur de son type
   jfieldID fldId = env->GetFieldID(cls, "myInt", "I") ;

   // Acc�s � la valeur du membre de classe
   jint isInt = env->GetIntField(obj, fldId) ;

   // Affichage de la valeur du membre
   wrtMsg("Valeur du membre myInt de la classe tstjni.CNative: "); cout <<isInt ;

   }

JNIEXPORT void JNICALL Java_tstjni_CNative_CallMyFunction(JNIEnv *env, jobject obj, jint nbCall)
   {
   char idt[100] ;
   char str[100] ;

   // Cr�ation de la chaine d'indentation
   strcpy(idt, "\0") ;
   for (int i=0; i<nbCall; i++)
      strcat(idt,"\t") ;

   // Pointeur sur la classe appelante
	jclass cls = env->GetObjectClass(obj) ;

	// ID de la m�thode java
	jmethodID mid = env->GetMethodID(cls, "myCallBack", "(I)V");

   // Appel � la m�thode java
	if (mid != 0)
      {
      strcpy(str, idt) ;
      wrtMsg(strcat(str, "Appel de la m�thode tstjni.CNative.myCallBack(): ")) ;
      cout <<nbCall ;
	   env->CallVoidMethod(obj, mid, nbCall);
      strcpy(str, idt) ;
	   wrtMsg(strcat(str, "Retour de la methode tstjni.CNative.myCallBack(): ")) ;
      cout <<nbCall ;
      }
   else
      wrtMsg("Erreur lors de l'appel de tstjni.CNative.myCallBack()") ;

   }

void wrtMsg(char* str)
   {
   cout <<endl <<"Native -> " <<str ;
   }

// Point d'entr�e de la dll
BOOL WINAPI DllMain(HINSTANCE hinstDLL, DWORD fwdreason, LPVOID lpvReserved)
   {
   return 1;
   }
