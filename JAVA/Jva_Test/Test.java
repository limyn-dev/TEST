package Test;

import Console.Cso ;

public class Test
   {

   public static void main(String[] args)
      {
      String str ;
      int    nbrInt=0 ;
      float  nbrFloat=0 ;
      double nbrDouble=0 ;

      // Saisie des valeurs
      Cso.Write ("Chaine de caractère: "); str = Cso.RdStr() ;
      Cso.Write ("Nombre entier      : "); nbrInt = Cso.RdInt() ;
      Cso.Write ("Flotant            : "); nbrFloat = Cso.RdFloat() ;
      Cso.Write ("Flotant double     : "); nbrDouble = Cso.RdDouble() ;

      // Affichage des valeurs
      Cso.Write ("Chaine saisie               : "+str);        Cso.NxtLne();
      Cso.Write ("Nombre entier saisit        : "+nbrInt);     Cso.NxtLne();
      Cso.Write ("Nombre flotant saisit       : "+nbrFloat);   Cso.NxtLne();
      Cso.Write ("Nombre flotant double saisit: "+nbrDouble);  Cso.NxtLne();
      }

   }