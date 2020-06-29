package tstjni;

import CsoIO.*;

public class CtstJNI
  {

  // Affichage
  public static void wrtMsg(String str)
    {
    System.out.println() ;
    System.out.print("Java  > " + str) ;
    }
  private static void setCso()
    {
    CsoIO myCso = new CsoIO() ;
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

  // Test de la fonction native SumInteger
  private static void tstParamInt()
    {
    int intA = 123 ;
    int intB = 45 ;
    wrtMsg("intA: ") ; System.out.print(intA) ;
    wrtMsg("intB: ") ; System.out.print(intB) ;

    wrtMsg("Appel de la fonction CNAtive.SumInteger(intA, intB)") ;
    int sum = CNative.SumInteger(intA,intB) ;
    wrtMsg("Retour de CNAtive.SumInteger(intA, intB): ") ;  System.out.print(sum) ;
    }

  // Test de la fonction native WriteString
  private static void tstParamString()
    {
    String strA = "la chaîne du début" ;
    String strB = " à la fin" ;
    wrtMsg("chaîne A: " + strA) ;
    wrtMsg("chaîne B: " + strB) ;

    wrtMsg("Appel de la fonction CNative.SumString(strA, strB)") ;
    String str  = CNative.SumString(strA, strB) ;
    wrtMsg("Somme des chîne par la methode native: " + str) ;
    }

  // Test de l'accès à un des membre de la classe
  private static void tstMemberInt()
    {
    CNative clsNat = new CNative() ;
    wrtMsg("Appel de la fonction CNative.WriteMyInt()") ;
    clsNat.WriteMyInt() ;
    }

  // Test de l'appel à une fonction membre depuis une fonction native
  private static void tstCallBack()
    {
    CNative clsNat = new CNative() ;
    wrtMsg("Appel de la fonction CNative.CallMyFunction()") ;
    clsNat.CallMyFunction() ;
    }

  // Main
  public static void main(String[] args)
    {
    CsoIO myCso = new CsoIO() ;
    char rep ;
    boolean fin = false ;

    while (!fin)
      {

      // Affichage du menu
      setCso() ;
      myCso.AfficherLn("- A - Test de passage de paramètre entier.") ;
      myCso.AfficherLn("- B - Test de passage de paramètre chaîne de caractère.") ;
      myCso.AfficherLn("- C - Test d'accès à um membre java.") ;
      myCso.AfficherLn("- D - Test d'appel à une fonction membre.") ;
      myCso.AfficherLn("- Q - Test de passage de paramètre entier.") ;
      rep = myCso.DemanderChar("Votre choix: ") ;

      // Execution du choix
      switch (rep)
	{
        case 'a':
        case 'A':
	  tstParamInt() ;
	  break ;
        case 'b':
        case 'B':
	  tstParamString() ;
	  break ;
        case 'c':
        case 'C':
	  tstMemberInt() ;
	  break ;
        case 'd':
        case 'D':
	  tstCallBack() ;
	  break ;
        case 'q':
        case 'Q':
	  fin = true ;
	} // fin du switch

      } // Fin du while

    } // Fin du main

  } // Fin de la class