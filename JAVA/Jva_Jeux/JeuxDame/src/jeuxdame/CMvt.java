package jeuxdame;

/**
 * Title:
 * Description: Mouvement d'une pièce
 * Copyright  : Copyright (c) 2000
 * Company    :
 * @author    : Yves Delay
 * @version 1.0
 */

public class CMvt
  {

  //---- Membres --------------------------------------------------------------
  private int     myNbrL ;  // Nombre de lignes de déplacement
  private int     myNbrC ;  // Nombre de colonnes de déplacemnt
  private boolean myMvOk ;  // Flag de validité du mouvement

  //---- Construction du mouvement --------------------------------------------
  public CMvt(int nbL, int nbC) { myNbrL=nbL; myNbrC=nbC; myMvOk=true; }

  //---- Validation du mouvement ----------------------------------------------
  public boolean Is_On()  { return myMvOk;  }
  public void    SetOn()  { myMvOk=true;    }
  public void    SetOff() { myMvOk=false;   }

  //---- Valeur du mouvement --------------------------------------------------
  public int GetNbL()     { return myNbrL ; }
  public int GetNbC()     { return myNbrC ; }

  /***************************************************************************/



  }