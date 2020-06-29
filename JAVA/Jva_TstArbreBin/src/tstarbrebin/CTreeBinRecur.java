package tstarbrebin;

import java.awt.* ;

/**
 * Title:
 * Description:
 * Copyright:    Copyright (c) 2000
 * Company:
 * @author
 * @version 1.0
 */

public class CTreeBinRecur extends java.awt.Frame
  {

  /*---- Type membres -------------------------------------------------------*/
  class TNod
    {
    public int c ;
    public TNod p ;
    public TNod g ;
    public TNod d ;

    public TNod (int cle)
      {
      c = cle ;
      p = null ;
      g = null ;
      d = null ;
      }
    }

  /*---- Membres ------------------------------------------------------------*/

  /*---- Instanciation ------------------------------------------------------*/
  public CTreeBinRecur()  {}

  /*---- Main ---------------------------------------------------------------*/
  public static void main(String[] args)
    {
    //TNod root = new TNod() ;
    //CTreeBinRecur CTreeBinRecur1 = new CTreeBinRecur();
    }



  /***************************************************************************/


  /*---- Insértion d'un nouveau noeud ---------------------------------------*/
  public void Inserer(TNod p, TNod n)
    {


    }

    /*---- Affichage de l'arbre ---------------------------------------------*/



  } // Fin de la class