package tstlistener;

import java.awt.*;
import java.awt.event.*;
import java.applet.*;

/**
 * Title:        Test des ecouteurs d^évenement
 * Description:  Dans cette version, les écouteur d'évenement du clavier et de
 *               la souris sont des class externe: CEvtMouse, CEvtKeyboard.
 * Copyright:    Copyright (c) 2000
 * Company:      _
 * @author yves Delay
 * @version 1.0
 */

public class CTstListener extends java.applet.Applet
  {

  /*---- MEMBRES ------------------------------------------------------------*/
  private CEvtMouse    Mse ;  // Gestionnaire d'évenement souris
  private CEvtKeyboard Keb ;  // Gestionnaire d'évenement clavier

  /*---- Composants ---------------------------------------------------------*/
  private GridLayout  Lyt ;
  private TextField   Txt ;
  private CBtn        Btn ;

  /*---- Implémentation des fonctions standars de l'applet ------------------*/
  public void init()                  { newIst() ;                  }

  /*--- Affichage du message ------------------------------------------------*/
  public void AfficherEvt(String msg) { Txt.setText(msg) ;  }



  /***************************************************************************/



  /*---- Création de l'instance ---------------------------------------------*/
  private void newIst()
    {

    // Création des composants
    Btn = new CBtn("Avant", "Après") ;
    Lyt = new GridLayout(2,2) ;
    Txt = new TextField() ;

    // Création des écouteurs
    Mse = new CEvtMouse(Txt) ;
    Keb = new CEvtKeyboard(Txt) ;

    // Assignations des ecouteurs de l'applet
    Txt.addMouseListener(Mse) ;       // Click de la souris
    Txt.addMouseMotionListener(Mse) ; // Déplacement de la souris
    Txt.addKeyListener(Keb) ;         // Touches du clavier

    // Ajout des composants
    this.setLayout(Lyt) ;
    this.add(Btn) ;
    this.add(Txt) ;

    }



  } // Fin de l'applet
