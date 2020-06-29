package jeuxdame;

/**
 * Title:
 * Description: Mouvement avec saut par dessus les autres pi�ces
 * Copyright  : Copyright (c) 2000
 * Company    :
 * @author    : Yves Delay
 * @version 1.0
 */

public class CJmp extends CMvt
  {

  //---- Constante de class ---------------------------------------------------
  public final static boolean EATER_Y = true ;   // Le saut mange les pi�ces
  public final static boolean EATER_N = false ;  // Le saut ne mange pas les pi�ces

  //---- Membres --------------------------------------------------------------
  private boolean imEater ;  // Mange les pi�ces sur les quelles il passe

  //---- Construction du saut -------------------------------------------------
  public CJmp(int nbL, int nbC, boolean eater) { super(nbL, nbC); imEater=eater; }

  }