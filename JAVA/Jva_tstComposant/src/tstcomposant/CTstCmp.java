package tstcomposant;

import java.applet.*;
import java.awt.*;
import java.awt.event.*;


/**
 * Title:        Test de composant
 * Description:
 * Copyright:    Copyright (c) 2002
 * Company:      _
 * @author Yves Delay
 * @version 1.0
 */


public class CTstCmp extends java.applet.Applet
  implements java.awt.event.ActionListener
  {

  // Membres
  CBtn btn = new CBtn() ;

  // Construction
  public CTstCmp()
    {
    }

  // Implémentation des interfaces
  public void actionPerformed(ActionEvent ae)
    {
    this.btn.setLabel("C'est la fenêtre") ;
    }

  }