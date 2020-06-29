package jeuxdame;

/**
 * Title:
 * Description: Moteur du jeux
 * Copyright  : Copyright (c) 2000
 * Company    :
 * @author    : Yves Delay
 * @version 1.0
 */

public class CJeux
  {

  //---- Variable de class ----------------------------------------------------
  public final static int NB_PCE = 4  ;  // Nombre de pièce du jeux

  //---- Membres --------------------------------------------------------------
  private int     myNbrL ; // Nombre de ligne
  private int     myNbrC ; // Nobre de colonne
  private CGrd    myGrid ; // Grille de jeux
  private CPce[]  myPces ; // Liste des pièces

  //---- Construction ---------------------------------------------------------
  public CJeux(int nbL, int nbC)      { myInit(nbL, nbC) ;  }

  //---- Accès à une pièce ----------------------------------------------------
  public CPce GetPce(int numPce)      { return myPces[numPce] ;}

  //---- Accès à une cellule de la grille -------------------------------------
  public int GetCel(int lne, int col) { return myGrid.GetCel(lne, col) ; }



  /***************************************************************************/



  /*---- Construction de l'instance -----------------------------------------*/
  private void myInit(int nbL, int nbC)
    {
    int lMax = nbL - 1 ;
    int cMax = nbC - 1 ;

    // Construction de la grille
    myGrid = new CGrd(nbL, nbC) ;

    // Initialisation de la liste des pièces
    myPces = new CPce[NB_PCE] ;
    myPces[0] = new CDame(CPce.CLR_NR, 0) ;
    myPces[1] = new CPion(CPce.CLR_NR, 1) ;
    myPces[2] = new CDame(CPce.CLR_RG, 2) ;
    myPces[3] = new CPion(CPce.CLR_RG, 3) ;

    // Positionnement des pièces sur la grille
    myPces[0].PutOnG(0,    0,    myGrd) ;
    myPces[1].PutOnG(0,    cMax, myGrd) ;
    myPces[2].PutOnG(lMax, 0,    myGrd) ;
    myPces[3].PutOnG(lMax, cMax, myGrd) ;

    }

  } // fin de la class