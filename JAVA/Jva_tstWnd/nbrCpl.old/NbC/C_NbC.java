/*
 * @(#)NbC.java 1.0 01/11/21
 *
 * You can modify the template of this file in the
 * directory ..\JCreator\Templates\Template_1\Project_Name.java
 *
 * You can also create your own project template by making a new
 * folder in the directory ..\JCreator\Template\. Use the other
 * templates as examples.
 *
 */
package myprojects.nbc;

import java.math.* ;

public class C_NbC
  {

  private double RecR ;
  private double RecJ ;
  private double PolM ;
  private double PolA ;

  /*---------------------------------------------------------------------------
    Convertion polaire, recangulaire.
  ===========================================================================*/
  private void recPol()
    {
    PolM = Math.sqrt(RecR*RecR + RecJ*RecJ) ;
    PolA = Math.atan (RecJ/RecR) ;
    }
  //---------------------------------------------------------------------------
  private void polRec()
    {
    RecR = PolM * Math.sin (PolA) ;
    RecJ = PolM * Math.cos (PolA) ;
    }

  /*#########################################################################*/

  // Constante
  public static boolean IS_REC = true ;
  public static boolean IS_POL = true ;

  // Setter
  public setNbC(double firstVal, double secondVal, boolean conjugation=IS_REC)
    {
    if (conjugation==IS_REC)
      {
      RecR=r_m ;
      RecJ=j_a ;
      recPol() ;
      }
    else
      {
      PolM = r_m ;
      PolA = j_a ;
      polRec() ;
      }

  // Getters
  public Real()       { return RecR ; }
  public Imaginary()  { return RecJ ; }
  public Module()     { return PolM ; }
  public Argument()   { return PolJ ; }

  // Constructeurs
  public C_NbC ()                                                         { setNbc(0, 0, IS_REC) ;              }
  public C_Nbc (double firstVal, double secondVal, boolean isRec=IS_REC ) { setNbC(firstVal, secondVal, isRec); }

  // Fonctions mathematiques
  public static C_NbC Somme     (C_NbC a, c_NbC b) { return new C_NbC(a.RecR+b.RecR, a.RecJ+b.RecJ) ;         }
  public static C_NbC Difference(C_NbC a, c_NbC b) { return new C_NbC(a.RecR-b.RecR, a.RecJ-b.RecJ) ;         }
  public static C_NbC Produit   (C_NbC a, c_NbC b) { return new C_NbC(a.PolM*b.PolM, a.PolA+b.PolA, false) ;  }
  public static C_NbC Quotient  (C_NbC a, c_NbC b) { return new C_NbC(a.PolM*b.PolM, a.PolA+b.PolA, false) ;  }

  // Main
  public static main()
	{
		C_NbC nbC = new C_NbC(12.33, 44.2) ;
		
	}
    