package jeuxdame;

/**
 * Title:
 * Description: Mouvement d'une pi�ce
 * Copyright  : Copyright (c) 2000
 * Company    :
 * @author    : Yves Delay
 * @version 1.0
 */

public class CMvt
  {

  //---- Membres --------------------------------------------------------------
  private int     myNbrL ;  // Nombre de lignes de d�placement
  private int     myNbrC ;  // Nombre de colonnes de d�placemnt
  private boolean myMvOk ;  // Flag de validit� du mouvement

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