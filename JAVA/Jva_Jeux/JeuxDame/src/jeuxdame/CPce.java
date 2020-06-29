package jeuxdame;

/**
 * Title:
 * Description:  Structure générale d'une pièce
 * Copyright  :  Copyright (c) 2000
 * Company    :
 * @author    : Yves Delay
 * @version 1.0
 */

public abstract class CPce
  {

  //---- Constante de class ---------------------------------------------------
  public final static int    CLR_NR   = 1       ; // Code de couleur  : noire
  public final static int    CLR_RG   = 2       ; // Code de couleur  : rouge
  public final static String STRBLK_L = "NOIRE" ; // Chaine de caractère noire
  public final static String STRBLK_S = "N"     ; // Abréviation noire
  public final static String STRRED_L = "ROUGE" ; // Chaine de caractère rouge
  public final static String STRRED_S = "R"     ; // Abréviation rouge

  //---- Membres --------------------------------------------------------------
  protected int     myNum  ;  // Index de la pièce
  protected int     myClr  ;  // Code de la couleur de la pièce
  protected boolean myOnG  ;  // Flag de validation si la pièce est sur la grille
  protected int     myLne  ;  // Ligne de la pièce
  protected int     myCol  ;  // Colonne de la pièce
  protected CMvt[]  myMvts ;  // Liste des mouvements de la pièce
  protected int     myNbMv ;  // Nombre de mouvement

  //---- Construction de la class ---------------------------------------------
  public CPce(int clr, int idx)  { myInit(clr, idx) ; }

  //---- Ajout, suppression de la pièce dans le jeux --------------------------
  public boolean Is_OnG()                           { return myOnG ;            }
  public void    PutOnG(int lne, int col, CGrd grd) { myPutOnG(lne, col, grd) ; }
  public void    RmvOnG()                           { myOnG=false;              }

  //---- Position de la pièce sur la grille -----------------------------------
  public int  GetLne()                              { return myLne ;            }
  public int  GetCol()                              { return myCol ;            }

  //---- Gestion des mouvements -----------------------------------------------
  public void RunMvt(int numMvt, CGrd grd)          { myRunMvt(numMvt, grd) ;   }
  public CMvt GetMvt(int numMvt)                    { return myMvts[numMvt] ;   }
  public void SetMvts(CGrd grd)                     { mySetMvts(grd) ;          }

  //---- Accès à la couleur de la pièce ---------------------------------------
  public int GetClr()                               { return myClr ;            }

  //---- Affichage de la pièce ------------------------------------------------
  public String StrCouleur (boolean abrege)         { return myStrClr(abrege) ; }
  public abstract String StrPiece   (boolean abrege) ;



  /***************************************************************************/



  //---- Initialisation de la pièce -------------------------------------------
  protected void myInit(int clr)
    {
    myIdx = idx ; // Index de la pièce
    myClr = clr ; // Couleur de la pièce
    myLne = 0   ; // Ligne initiale de la pièce
    myCol = 0   ; // Colonne initiale de la pièce
    myOnG=false ; // La pièce n'est pas sur la grille
    }

  //---- Ajout de la pièce sur la grille --------------------------------------
  protected boolean myPutOnG(int lne, int col, CGrd grd)
    {
    boolean putOnGOk = true ;

    // Contrôle si la pièce est insérable
    if (!myOnG && grd.GetCel(lne, col) == CGrd.NO_PCE)
      {

      // Mise é jour de la position de la pièce
      myLne = lne ;
      myCol = col ;

      // Mise à jour de la grille
      grd.SetCel(lne, col, myIdx) ;

      }
    else
      putOnGOk = false ;

    return putOnGOk ;
    }

  //---- Mouvement de la pièce sur la grille ----------------------------------
  protected boolean myRunMvt(int numMvt, CGrd grd)
    {
    boolean runMvtOk = true ;

    // Contrôle si la pièce peut faire le mouvement
    if (myOnG && myMvts[numMvt].Is_On())
      {

      // Suppression de l'ancienne position sur la grille
      grd.SetCel(myLne, myCol, grd.NO_PCE) ;

      // Mise à jour des valeurs de la pièce
      myLne += myMvts[numMvt].GetNbL() ;
      myCol += myMvts[numMvt].GetNbC() ;

      // Mise à jour des valeur de la grille
      grd.SetCel(myLne, myCol, myIdx)

      // Mise à jour des mouvements
      mySetMvts(grd) ;

      }
    else
      runMvtOk = false ;

    return runMvtOk ;
    } // Fin de myMvtOnG

  //---- Mise à jour des mouvements -------------------------------------------
  protected void mySetMvts(CGrd grd)
    {
    int lne ;
    int col ;

    for (int m=0; m<myNbMv; m++)
      {
      lne = myLne + myMvts[m].GetNbL() ;
      col = myCol + myMvts[m].GetNbC() ;
      if (lne<grd.GetNbL && col<grd.GetNbC)   // Limite de la grille
	if (grd.GetCel(lne, col)==grd.NO_PCE) // Cellule libre
	  myMvts[m].SetOn() ;
        else
	  myMvts[m].SetOff() ;
      }
    } // Fin de mySetMvts

  //---- Affichage de la couleur du pion --------------------------------------
  private String myStrClr(boolean abrege)
    {
    String strClr ;
    if (myClr==CLR_NR)
      if (abrege)
	strClr = STRBLK_S ;
      else
	strClr = STRBLK_L ;
    else
      if (abrege)
	strClr = STRRED_S ;
      else
	strClr = STRRED_L ;
    return strClr ;
    }


  } // Fin de CPce