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

 	// Allocation des chaînes UTF (convertion unicode -> UTF8)
	const char *cStrA = env->GetStringUTFChars(jStrA, NULL) ;            // Dans env
	const char *cStrB = env->GetStringUTFChars(jStrB, NULL) ;            // Dans env
   char       *cStrR = new char[strlen(cStrA) + strlen(cStrB) + 1] ;    // Local

   // Concaténation des chînes
   strcpy(cStrR, cStrA) ;
   strcat(cStrR, cStrB) ;

   // Allocation de la chaîne résultat (convertion UTF8 -> unicode)
   wrtMsg("Concaténation de ") ; cout <<"<" <<cStrA <<">"<<" et de " <<"<" <<cStrB <<">" ;
   jstring jStrR = env->NewStringUTF(cStrR) ;

	// Libération de l'allocation des chaînes UTF8
	env->ReleaseStringUTFChars(jStrA, cStrA) ;
	env->ReleaseStringUTFChars(jStrB, cStrB) ;
   delete (cStrR) ;

   // Retour de la jString
   return jStrR ;
   }

JNIEXPORT void JNICALL Java_tstjni_CNative_WriteMyInt(JNIEnv *env, jobject obj)
   {

   // Accès à la classe appelante
   jclass   cls = env->GetObjectClass(obj) ;

   // Recherche de l'ID du membre de la classe par son nom et la signatur de son type
   jfieldID fldId = env->GetFieldID(cls, "myInt", "I") ;

   // Accès à la valeur du membre de classe
   jint isInt = env->GetIntField(obj, fldId) ;

   // Affichage de la valeur du membre
   wrtMsg("Valeur du membre myInt de la classe tstjni.CNative: "); cout <<isInt ;

   }

JNIEXPORT void JNICALL Java_tstjni_CNative_CallMyFunction(JNIEnv *env, jobject obj, jint nbCall)
   {
   char idt[100] ;
   char str[100] ;

   // Création de la chaine d'indentation
   strcpy(idt, "\0") ;
   for (int i=0; i<nbCall; i++)
      strcat(idt,"\t") ;

   // Pointeur sur la classe appelante
	jclass cls = env->GetObjectClass(obj) ;

	// ID de la méthode java
	jmethodID mid = env->GetMethodID(cls, "myCallBack", "(I)V");

   // Appel à la méthode java
	if (mid != 0)
      {
      strcpy(str, idt) ;
      wrtMsg(strcat(str, "Appel de la méthode tstjni.CNative.myCallBack(): ")) ;
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

// Point d'entrée de la dll
BOOL WINAPI DllMain(HINSTANCE hinstDLL, DWORD fwdreason, LPVOID lpvReserved)
   {
   return 1;
   }
