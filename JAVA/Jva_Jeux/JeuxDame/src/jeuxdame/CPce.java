package jeuxdame;

/**
 * Title:
 * Description:  Structure g�n�rale d'une pi�ce
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
  public final static String STRBLK_L = "NOIRE" ; // Chaine de caract�re noire
  public final static String STRBLK_S = "N"     ; // Abr�viation noire
  public final static String STRRED_L = "ROUGE" ; // Chaine de caract�re rouge
  public final static String STRRED_S = "R"     ; // Abr�viation rouge

  //---- Membres --------------------------------------------------------------
  protected int     myNum  ;  // Index de la pi�ce
  protected int     myClr  ;  // Code de la couleur de la pi�ce
  protected boolean myOnG  ;  // Flag de validation si la pi�ce est sur la grille
  protected int     myLne  ;  // Ligne de la pi�ce
  protected int     myCol  ;  // Colonne de la pi�ce
  protected CMvt[]  myMvts ;  // Liste des mouvements de la pi�ce
  protected int     myNbMv ;  // Nombre de mouvement

  //---- Construction de la class ---------------------------------------------
  public CPce(int clr, int idx)  { myInit(clr, idx) ; }

  //---- Ajout, suppression de la pi�ce dans le jeux --------------------------
  public boolean Is_OnG()                           { return myOnG ;            }
  public void    PutOnG(int lne, int col, CGrd grd) { myPutOnG(lne, col, grd) ; }
  public void    RmvOnG()                           { myOnG=false;              }

  //---- Position de la pi�ce sur la grille -----------------------------------
  public int  GetLne()                              { return myLne ;            }
  public int  GetCol()                              { return myCol ;            }

  //---- Gestion des mouvements -----------------------------------------------
  public void RunMvt(int numMvt, CGrd grd)          { myRunMvt(numMvt, grd) ;   }
  public CMvt GetMvt(int numMvt)                    { return myMvts[numMvt] ;   }
  public void SetMvts(CGrd grd)                     { mySetMvts(grd) ;          }

  //---- Acc�s � la couleur de la pi�ce ---------------------------------------
  public int GetClr()                               { return myClr ;            }

  //---- Affichage de la pi�ce ------------------------------------------------
  public String StrCouleur (boolean abrege)         { return myStrClr(abrege) ; }
  public abstract String StrPiece   (boolean abrege) ;



  /***************************************************************************/



  //---- Initialisation de la pi�ce -------------------------------------------
  protected void myInit(int clr)
    {
    myIdx = idx ; // Index de la pi�ce
    myClr = clr ; // Couleur de la pi�ce
    myLne = 0   ; // Ligne initiale de la pi�ce
    myCol = 0   ; // Colonne initiale de la pi�ce
    myOnG=false ; // La pi�ce n'est pas sur la grille
    }

  //---- Ajout de la pi�ce sur la grille --------------------------------------
  protected boolean myPutOnG(int lne, int col, CGrd grd)
    {
    boolean putOnGOk = true ;

    // Contr�le si la pi�ce est ins�rable
    if (!myOnG && grd.GetCel(lne, col) == CGrd.NO_PCE)
      {

      // Mise � jour de la position de la pi�ce
      myLne = lne ;
      myCol = col ;

      // Mise � jour de la grille
      grd.SetCel(lne, col, myIdx) ;

      }
    else
      putOnGOk = false ;

    return putOnGOk ;
    }

  //---- Mouvement de la pi�ce sur la grille ----------------------------------
  protected boolean myRunMvt(int numMvt, CGrd grd)
    {
    boolean runMvtOk = true ;

    // Contr�le si la pi�ce peut faire le mouvement
    if (myOnG && myMvts[numMvt].Is_On())
      {

      // Suppression de l'ancienne position sur la grille
      grd.SetCel(myLne, myCol, grd.NO_PCE) ;

      // Mise � jour des valeurs de la pi�ce
      myLne += myMvts[numMvt].GetNbL() ;
      myCol += myMvts[numMvt].GetNbC() ;

      // Mise � jour des valeur de la grille
      grd.SetCel(myLne, myCol, myIdx)

      // Mise � jour des mouvements
      mySetMvts(grd) ;

      }
    else
      runMvtOk = false ;

    return runMvtOk ;
    } // Fin de myMvtOnG

  //---- Mise � jour des mouvements -------------------------------------------
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