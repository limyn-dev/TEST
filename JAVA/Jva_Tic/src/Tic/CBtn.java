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

  /*----- Membres commun � toutes les instances -----------------------------*/
  static  CJeux Jeux ; // Param�tre du jeux

  /*----- Membres -----------------------------------------------------------*/
  private boolean Lck ; // Flag de jeux de la cellule (cellule lock�e)
  private int     Lne ; // Ref�rance sur la ligne � index�
  private int     Col ; // Ref�rance sur la colonne � index�

  /*----- Accesseurs --------------------------------------------------------*/

  /*----- Cr�ation de l'instance --------------------------------------------*/
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



  /*----- Cr�ation de l'instance --------------------------------------------*/
  private void newIst(int lne, int col, CJeux jeux)
    {
    this.addActionListener(this); // Ajout du gestionnaire d'action
    this.Lne = lne ;              // Index de la ligne du boutton
    this.Col = col ;              // Index de la colonne du boutton
    this.Lck = false ;            // Initialisation du flag de blocage
    this.Jeux = jeux ;            // Initialisation de r�f�rance sur les param�tres du jeux
    }

  } // Fin de CBtn