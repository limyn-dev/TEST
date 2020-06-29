package jeuxdame;

/**
 * Title:
 * Description: Mouvement avec saut par dessus les autres pièces
 * Copyright  : Copyright (c) 2000
 * Company    :
 * @author    : Yves Delay
 * @version 1.0
 */

public class CJmp extends CMvt
  {

  //---- Constante de class ---------------------------------------------------
  public final static boolean EATER_Y = true ;   // Le saut mange les pièces
  public final static boolean EATER_N = false ;  // Le saut ne mange pas les pièces

  //---- Membres --------------------------------------------------------------
  private boolean imEater ;  // Mange les pièces sur les quelles il passe

  //---- Construction du saut -------------------------------------------------
  public CJmp(int nbL, int nbC, boolean eater) { super(nbL, nbC); imEater=eater; }

  }