package tstjni;

/*
 * Title        : Test de fonctions natives
 * Description  : Déclaration des fonctions natives
 * Copyright    :
 * Company      :
 * @author      :
 * @version 1.0 :
 */

public class CNative
  {

  // Membre entier
  private int myInt ;

  // Fonction membre
  private void myCallBack(int nbCall)
    {

    // création de la chaine d'indentation
    String str = "" ;
    for (int i=0; i<nbCall; i++)
      str=str + "\t" ;

    CTstJni.wrtMsg(str + "Entrée dans la fonction de callBack: ") ;
    System.out.print(nbCall) ;

    if (nbCall<3)
      CallMyFunction(nbCall + 1) ;
    else
      CTstJni.wrtMsg(str + "\t" + "Fin de la chaine d'appel.") ;

    CTstJni.wrtMsg(str + "Sortie de la fonction de callBack: ") ;
    System.out.print(nbCall) ;
    }

  // Construction de l'instance
  CNative() { myInt = 123 ; }

  // Chargement de la librérie
  static  { System.loadLibrary("CNative") ;   }

  // Méthodes natives
  public static native int    SumInteger(int a, int b) ;              // Passage d'argument de type simple
  public static native String SumString (String strA, String strB) ;  // Passage d'un argument jstring
  public        native void   WriteMyInt() ;                          // Accès au membre entier
  public        native void   CallMyFunction(int nbCall) ;            // Appel à une fonction membre depuis une fonction native


  //public static native void TestApi() ;

  }