package tstcomposant;

import java.applet.Applet;
import java.awt.*;
import java.awt.event.*;

import java.lang.*;

/**
 * Title:        Test de composant
 * Description:
 * Copyright:    Copyright (c) 2002
 * Company:      _
 * @author Yves Delay
 * @version 1.0
 */

public class CAplTstCmp extends Applet
  implements java.awt.event.ActionListener
  {

  // Membres
  CBtn btn = new CBtn() ;

  // Constructeur
  public CAplTstCmp()
    {
    this.add(btn) ;
    }

  // Gestion de l'applet
  public void init()
    {
    this.setSize(300, 300) ;
    }

  // Implementationdes interfaces
  public void actionPerformed(ActionEvent ae)
    {
    System.out.print("C'est l'applet") ;
    }

  // Main
  public static void main(String[] args)
    {
    CAplTstCmp CAplTstCmp1 = new CAplTstCmp();

    CAplTstCmp1.setVisible(true) ;

    }

  }