package tstlistener;

import java.awt.*;
import java.awt.event.*;
import java.applet.*;

/**
 * Title:        Test des ecouteurs d^�venement
 * Description:  Dans cette version, les �couteur d'�venement du clavier et de
 *               la souris sont des class externe: CEvtMouse, CEvtKeyboard.
 * Copyright:    Copyright (c) 2000
 * Company:      _
 * @author yves Delay
 * @version 1.0
 */

public class CTstListener extends java.applet.Applet
  {

  /*---- MEMBRES ------------------------------------------------------------*/
  private CEvtMouse    Mse ;  // Gestionnaire d'�venement souris
  private CEvtKeyboard Keb ;  // Gestionnaire d'�venement clavier

  /*---- Composants ---------------------------------------------------------*/
  private GridLayout  Lyt ;
  private TextField   Txt ;
  private CBtn        Btn ;

  /*---- Impl�mentation des fonctions standars de l'applet ------------------*/
  public void init()                  { newIst() ;                  }

  /*--- Affichage du message ------------------------------------------------*/
  public void AfficherEvt(String msg) { Txt.setText(msg) ;  }



  /***************************************************************************/



  /*---- Cr�ation de l'instance ---------------------------------------------*/
  private void newIst()
    {

    // Cr�ation des composants
    Btn = new CBtn("Avant", "Apr�s") ;
    Lyt = new GridLayout(2,2) ;
    Txt = new TextField() ;

    // Cr�ation des �couteurs
    Mse = new CEvtMouse(Txt) ;
    Keb = new CEvtKeyboard(Txt) ;

    // Assignations des ecouteurs de l'applet
    Txt.addMouseListener(Mse) ;       // Click de la souris
    Txt.addMouseMotionListener(Mse) ; // D�placement de la souris
    Txt.addKeyListener(Keb) ;         // Touches du clavier

    // Ajout des composants
    this.setLayout(Lyt) ;
    this.add(Btn) ;
    this.add(Txt) ;

    }



  } // Fin de l'applet
