package tstjni;

/*
 * Title        : Test de fonctions natives
 * Description  : D�claration des fonctions natives
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

    // cr�ation de la chaine d'indentation
    String str = "" ;
    for (int i=0; i<nbCall; i++)
      str=str + "\t" ;

    CTstJni.wrtMsg(str + "Entr�e dans la fonction de callBack: ") ;
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

  // Chargement de la libr�rie
  static  { System.loadLibrary("CNative") ;   }

  // M�thodes natives
  public static native int    SumInteger(int a, int b) ;              // Passage d'argument de type simple
  public static native String SumString (String strA, String strB) ;  // Passage d'un argument jstring
  public        native void   WriteMyInt() ;                          // Acc�s au membre entier
  public        native void   CallMyFunction(int nbCall) ;            // Appel � une fonction membre depuis une fonction native


  //public static native void TestApi() ;

  }