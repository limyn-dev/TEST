package jeuxdame;

/**
 * Title:
 * Description: Structure d'une pièce dame
 * Copyright  : Copyright (c) 2000
 * Company    :
 * @author
 * @version 1.0
 */

public class CDame extends CPce
  {

  //---- Constantes de classe -------------------------------------------------
  public final static int    NB_MVT   = 8      ;  // Nombre de mouvement de la dame
  public final static int    SFT_HG   = 0      ;  // Déplacement haut gauche
  public final static int    SFT_BG   = 1      ;  // Déplacement bas gauche
  public final static int    SFT_BD   = 2      ;  // Déplacement bas droit
  public final static int    SFT_HD   = 3      ;  // Déplacement haut droit
  public final static int    JMP_HG   = 4      ;  // Saut haut gauche
  public final static int    JMP_BG   = 5      ;  // Saut bas gauche
  public final static int    JMP_BD   = 6      ;  // Saut bas droit
  public final static int    JMP_HD   = 7      ;  // Saut haut droit
  public final static String STRPCE_L = "DAME" ;  // Chaine de caractère de la dame
  public final static String STRPCE_S = "D"    ;  // Abréviation de la dame

  //---- Construction de la dame ----------------------------------------------
  public CDame(int clr)                   { super(clr); myInit();           }

  //---- Affichage de la dame -------------------------------------------------
  public String StrPiece (boolean abrege) { return myStrPce(abrege) ; }



  /***************************************************************************/



  //---- Initialisation de la dame --------------------------------------------
  private void myInit()
    {

    // Nombre de coups
    myNbMv = NB_MVT ;

    // Construction de la liste des coups
    myMvts = new CMvt[NB_MVT] ;
    myMvts[SFT_HG] = new CSft(-1, -1) ;
    myMvts[SFT_BG] = new CSft( 1, -1) ;
    myMvts[SFT_BD] = new CSft( 1,  1) ;
    myMvts[SFT_HD] = new CSft(-1,  1) ;
    myMvts[JMP_HG] = new CJmp(-2, -2, CJmp.EATER_Y) ;
    myMvts[JMP_BG] = new CJmp( 2, -2, CJmp.EATER_Y) ;
    myMvts[JMP_BD] = new CJmp( 2,  2, CJmp.EATER_Y) ;
    myMvts[JMP_HD] = new CJmp(-2,  2, CJmp.EATER_Y) ;

    } // Fin de myInit

  //---- Affichage de la valeur dela dame -------------------------------------
  private String myStrPce(boolean abrege)
    {
    String strPce ;
    if(abrege)
      strPce = STRPCE_S ;
    else
      strPce = STRPCE_L ;
    } // Fin de myStrPce

  } // Fin de CDame