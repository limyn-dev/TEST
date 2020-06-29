package jeuxdame;

/**
 * Title:
 * Description:
 * Copyright:    Copyright (c) 2000
 * Company:
 * @author
 * @version 1.0
 */

public class CPion extends CPce
  {

  //---- Constantes de classe -------------------------------------------------
  public final static int    NB_MVT   = 4      ;  // Nombre de mouvement
  public final static int    SFT_HG   = 0      ;  // Mouvement haut gauche
  public final static int    SFT_BG   = 1      ;  // Mouvement bas gauche
  public final static int    SFT_BD   = 2      ;  // Mouvement bas droit
  public final static int    SFT_HD   = 3      ;  // Mouvement haut droit
  public final static String STRPCE_L = "PION"  ;  // Chaine de caractère du pion
  public final static String STRPCE_S = "P"     ;  // Abréviation du pion

  //---- Construction du pion -------------------------------------------------
  public CPion(int clr)                     { super(clr); myInit();     }

  //---- Affichage du pion ----------------------------------------------------
  public String StrPiece   (boolean abrege) { return myStrPce(abrege) ; }


  /***************************************************************************/



  //---- Initialisation du pion -----------------------------------------------
  private void myInit()
    {

    // Nombre de mouvement
    myNbMv = NB_MVT ;

    // Construction de la liste des mouvements
    myMvts = new CMvt[NB_MVT] ;
    myMvts[SFT_HG] = new CSft(-1, -1) ;
    myMvts[SFT_BG] = new CSft( 1, -1) ;
    myMvts[SFT_BD] = new CSft( 1,  1) ;
    myMvts[SFT_HD] = new CSft(-1,  1) ;

    }

  //---- Affichage de la valeur du pion ---------------------------------------
  private String myStrPce(boolean abrege)
    {
    String strPce ;
    if(abrege)
      strPce = PCE_S ;
    else
      strPce = PCE_L ;
    }

  }