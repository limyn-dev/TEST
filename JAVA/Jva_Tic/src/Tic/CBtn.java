package Tic;

import java.awt.* ;
import java.awt.event.*;

/**
 * Title:        Tic
 * Description:
 * Copyright:    Copyright (c) 2002
 * Company:
 * @author Yves Delay
 * @version 1.0
 */

public class CBtn extends java.awt.Button
  implements java.awt.event.ActionListener
  {

  /*----- Membres commun à toutes les instances -----------------------------*/
  static  CJeux Jeux ; // Paramètre du jeux

  /*----- Membres -----------------------------------------------------------*/
  private boolean Lck ; // Flag de jeux de la cellule (cellule lockée)
  private int     Lne ; // Reférance sur la ligne à indexé
  private int     Col ; // Reférance sur la colonne à indexé

  /*----- Accesseurs --------------------------------------------------------*/

  /*----- Création de l'instance --------------------------------------------*/
  public CBtn(int lne, int col, CJeux jeux) { super(); newIst(lne, col, jeux); }

  /*----- Implementation des interfaces -------------------------------------*/
  public void actionPerformed(ActionEvent ae) { Cocher() ;  }

  /*----- Click du boutton --------------------------------------------------*/
  public void Cocher()
    {
    if (!Lck)
      {
      this.setLabel(this.Jeux.Jouer(this.Lne, this.Col)) ;
      this.Lck = true ;
      }
    }



  /***************************************************************************/



  /*----- Création de l'instance --------------------------------------------*/
  private void newIst(int lne, int col, CJeux jeux)
    {
    this.addActionListener(this); // Ajout du gestionnaire d'action
    this.Lne = lne ;              // Index de la ligne du boutton
    this.Col = col ;              // Index de la colonne du boutton
    this.Lck = false ;            // Initialisation du flag de blocage
    this.Jeux = jeux ;            // Initialisation de référance sur les paramètres du jeux
    }

  } // Fin de CBtn