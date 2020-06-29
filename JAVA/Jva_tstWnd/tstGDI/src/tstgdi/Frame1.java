package tstgdi;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

/**
 * Title:        Test de GDI
 * Description:
 * Copyright:    Copyright (c) 2002
 * Company:      _
 * @author Yves Delay
 * @version 1.0
 */

public class Frame1 extends JFrame
  {

  // structure des composants
  GridLayout gridLayout1 = new GridLayout(2,1,1,1) ;
  GridLayout gridLayout2 = new GridLayout(2,3,1,1);

  // Panneau
  JPanel fond = (JPanel) this.getContentPane();
  Panel panel1 = new Panel(gridLayout1) ;

  // Bouttons
  Button btnBip = new Button("Bip") ;
  Button btnTick = new Button("Tick");
  Button btnStop = new Button("Stop");
  Button btnStart = new Button("Start");
  Button btnReset = new Button("Reset");
  Button btnQuit = new Button("Quit");

  // Chrono
  C_Chrono cro = new C_Chrono() ;

  /**Construct the frame*/
  public Frame1()
    {
    enableEvents(AWTEvent.WINDOW_EVENT_MASK);

    // Initialisation de la forme
    try { jbInit(); }
    catch(Exception e) { e.printStackTrace(); }

    }

  /**Component initialization*/
  private void jbInit() throws Exception
    {

    // Taille de la fenêtre
    this.setSize(new Dimension(200, 200));

    // Titre de la fenêtre
    this.setTitle("Test de GDI");

    // Division du fond en 2 parties
    fond.setLayout(gridLayout1);

    // Division du panel1 en 6
    panel1.setLayout(gridLayout2);

    fond.add(panel1) ;
    fond.add(cro) ;

    // Ajout des boputons sur le panel 1
    panel1.add(btnBip, null);
    panel1.add(btnQuit, null);
    panel1.add(btnReset, null);
    panel1.add(btnStop, null);
    panel1.add(btnTick, null);
    panel1.add(btnStart, null);



    }

  /**Overridden so we can exit when window is closed*/
  protected void processWindowEvent(WindowEvent e)
    {
    super.processWindowEvent(e);
    if (e.getID() == WindowEvent.WINDOW_CLOSING)
      {
      System.exit(0);
      }
    }

  void btnTick_actionPerformed(ActionEvent e) {

  }

  void btnTick_mouseClicked(MouseEvent e) {

  }


  }

class Frame1_btnTick_actionAdapter implements java.awt.event.ActionListener {
  Frame1 adaptee;

  Frame1_btnTick_actionAdapter(Frame1 adaptee) {
    this.adaptee = adaptee;
  }
  public void actionPerformed(ActionEvent e) {
    adaptee.btnTick_actionPerformed(e);
  }
}

class Frame1_btnTick_mouseAdapter extends java.awt.event.MouseAdapter {
  Frame1 adaptee;

  Frame1_btnTick_mouseAdapter(Frame1 adaptee) {
    this.adaptee = adaptee;
  }

  public void mouseClicked(MouseEvent e) {
    adaptee.btnTick_mouseClicked(e);
  }
}