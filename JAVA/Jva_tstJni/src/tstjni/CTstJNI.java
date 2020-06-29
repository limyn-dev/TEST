package tstjni;

import CsoIO.*;

/**
 * Title:        Test de fonctions natives
 * Description:
 * Copyright:    Copyright (c) 2000
 * Company:      _
 * @author Yves Delay
 * @version 1.0
 */

public class CTstJni
  {

  // Console
  private static CsoIO myCso ;

  // Affichage
  public static void wrtMsg(String str)
    {
    myCso.AfficherLn("")  ;
    myCso.Afficher("Java   -> " + str) ;
    }
  private static void setCso()
    {
    myCso.AfficherLn("") ;
    myCso.AfficherLn("") ;
    myCso.AfficherLn("") ;
    myCso.Afficher
      (
      "---------------------------------------------------------------"
      ) ;
    myCso.AfficherLn("") ;
    myCso.AfficherLn("") ;
    myCso.AfficherLn("") ;
    }
  private static void wrtInf(String descript, String fctNtv, String fctJva)
    {
    myCso.AfficherLn("") ;
    myCso.AfficherLn("Déscription:") ;
    myCso.AfficherLn("   " + descript) ;
    myCso.AfficherLn("") ;
    myCso.AfficherLn("Prototypes des fonctions:") ;
    myCso.Afficher("   Fonction native   : " + fctNtv) ;
    if (fctJva != "")
      {
      myCso.AfficherLn("") ;
      myCso.Afficher("   Fonction callBack : " + fctJva) ;
      }
    myCso.AfficherLn("") ;
    myCso.AfficherLn("") ;
    myCso.Afficher("Execution:") ;
    }

  // Test de la fonction native SumInteger
  private static void tstParamInt()
    {

    // Affichage des infos
    wrtInf
      (
      "Appel d'une fonction native qui retourne la some de 2 entiers.",
      "public static native int SumInteger(int a, int b)",
      ""
      ) ;

    // Test de la methode
    int intA = 123 ;
    int intB = 45 ;
    wrtMsg("intA: ") ; System.out.print(intA) ;
    wrtMsg("intB: ") ; System.out.print(intB) ;
    wrtMsg("Appel de la fonction CNAtive.SumInteger(intA, intB)") ;
    int sum = CNative.SumInteger(intA,intB) ;
    wrtMsg("Retour de la fonction CNAtive.SumInteger(intA, intB): ") ;
    System.out.print(sum) ;

    }

  // Test de la fonction native WriteString
  private static void tstParamString()
    {

    // Affichage des infos
    wrtInf
      (
      "Appel d'une fonction native qui concatène 2 chaine de caractères.",
      "public static native String SumString (String strA, String strB)",
      ""
      ) ;

    // Test de la methode
    String strA = "la chaîne du début" ;
    String strB = " à la fin" ;
    wrtMsg("strA: " + strA) ;
    wrtMsg("strB: " + strB) ;
    wrtMsg("Appel de la fonction CNative.SumString(strA, strB)") ;
    String str  = CNative.SumString(strA, strB) ;
    wrtMsg("Retour de la fonction CNative.SumString(strA, strB): " + str) ;

    }

  // Test de l'accès à un des membre de la classe
  private static void tstMemberInt()
    {

    // Affichage des infos
    wrtInf
      (
      "Appel à une fonction native qui affiche la valeur du membre myInt de la classe CNative.",
      "public native void WriteMyInt()",
      ""
      ) ;

    // Test de la methode
    CNative clsNat = new CNative() ;
    wrtMsg("Appel de la fonction CNative.WriteMyInt()") ;
    clsNat.WriteMyInt() ;
    wrtMsg("Retour de la fonction CNative.WriteMyInt()") ;
    }

  // Test de l'appel à une fonction membre depuis une fonction native
  private static void tstCallBack()
    {

    // Affichage des infos
    wrtInf
      (
      "Appel à une fonction native qui fait appel à un fonction de callback. \n   la fonction de callback fait appel à la fonction native recursivement jusqu'à 3 fois.",
      "public native void CallMyFunction(int nbCall)",
      "private void myCallBack(int nbCall)"
      ) ;

    // Test de la methode
    CNative clsNat = new CNative() ;
    wrtMsg("Appel de la fonction CNative.CallMyFunction()") ;
    clsNat.CallMyFunction(1) ;
    wrtMsg("Retour de la fonction CNative.CallMyFunction()") ;

    }

  // Main
  public static void main(String[] args)
    {
    char rep ;
    boolean fin = false ;

    // Création de la console
    myCso = new CsoIO() ;

    // Menu
    while (!fin)
      {

      // Affichage du menu
      setCso() ;
      myCso.AfficherLn("- A - Test de fonction native avec paramètre entier.") ;
      myCso.AfficherLn("- B - Test de fonction native avec paramètre string.") ;
      myCso.AfficherLn("- C - Test d'accès à um membre java depuis une fonction native.") ;
      myCso.AfficherLn("- D - Test d'appel à une fonction java(callBack) depuis la fonction native.") ;
      myCso.AfficherLn("- Q - Quitter.") ;
      rep = myCso.DemanderChar("Votre choix: ") ;

      // Execution du choix
      myCso.AfficherLn("")  ;
      switch (rep)
	{
        case 'a':
        case 'A':
	  tstParamInt() ;
	  myCso.Valider("Pour continuer, pressez ENTER.") ;
	  break ;
        case 'b':
        case 'B':
	  tstParamString() ;
	  myCso.Valider("Pour continuer, pressez ENTER.") ;
	  break ;
        case 'c':
        case 'C':
	  tstMemberInt() ;
	  myCso.Valider("Pour continuer, pressez ENTER.") ;
	  break ;
        case 'd':
        case 'D':
	  tstCallBack() ;
	  myCso.Valider("Pour continuer, pressez ENTER.") ;
	  break ;
        case 'q':
        case 'Q':
	  fin = true ;
	} // fin du switch

      } // Fin du while

    } // Fin du main

  } // Fin de la classe