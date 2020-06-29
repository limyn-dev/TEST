package Tic;

import java.awt.*;
import java.awt.event.*;
import java.applet.*;
import javax.swing.*;

/**
 * Title:        Tic
 * Description:
 * Copyright:    Copyright (c) 2002
 * Company:
 * @author Yves Delay
 * @version 1.0
 */

public class CTic extends JApplet
  {

  /** Objet graphique **/
  boolean isStandalone = false;

  // Panel principal
  Panel pnlMain = new Panel();
  GridLayout grdMain ;

  // Taille de la grille
  private int NbrLne ;
  private int NbrCol ;

  // Matrice de bouttons
  CBtn[][] btns ;

  /**Get a parameter value*/
  public String getParameter(String key, String def)
    {
    return isStandalone ? System.getProperty(key, def) :
      (getParameter(key) != null ? getParameter(key) : def);
    }

  // Constructeur de l'applet
  public CTic()
    {
    }

  // Initialisation de l'applet
  public void init(int lne, int col)
    {
    try
      { jbInit(lne, col); }
    catch(Exception e)
      { e.printStackTrace(); }
    }

  // Initialisation du compposant
  private void jbInit(int lne, int col) throws Exception
    {

    // Dimention de la grille
    NbrLne = lne ;
    NbrCol = col ;

    // Dimention de la fenêtre
    this.setSize(new Dimension(300, 300));

    // Définition du layout de panel principal
    this.getContentPane().add(pnlMain, BorderLayout.CENTER);
    grdMain = new GridLayout(300, 300) ;
    pnlMain.setLayout(grdMain);

    // Création de la grille des boutons
    btns = new CBtn[NbrLne][NbrCol] ;
    for (int l=0; l<NbrLne; l++)
      for (int c=0; c<NbrCol; c++)
        {

        // Création du boutton
        btns[l][c] = new CBtn(l, c) ;
        btns[l][c].addMouseListener(new CTic_btn_mouseAdapter(this));

        // Ajout du boutton dans le composant
        pnlMain.add(btns[l][c], null);

        }

    } // Fin de l'initialisation du composant

  /**Start the applet*/
  public void start()
    {
    }

  /**Stop the applet*/
  public void stop()
    {
    }

  /**Destroy the applet*/
  public void destroy()
    {
    }

  /**Get Applet information*/
  public String getAppletInfo()
    {
    return "Applet Information";
    }

  /**Get parameter info*/
  public String[][] getParameterInfo()
    {
    return null;
    }

  /**Main method*/
  public static void main(String[] args)
    {
    CTic applet = new CTic();
    applet.isStandalone = true;
    JFrame frame = new JFrame();
    //EXIT_ON_CLOSE == 3
    frame.setDefaultCloseOperation(3);
    frame.setTitle("Applet Frame");
    frame.getContentPane().add(applet, BorderLayout.CENTER);
    applet.init();
    applet.start();

    frame.setSize(400,320);
    Dimension d = Toolkit.getDefaultToolkit().getScreenSize();
    frame.setLocation((d.width - frame.getSize().width) / 2, (d.height - frame.getSize().height) / 2);
    frame.setVisible(true);
    }

  //static initializer for setting look & feel
  static
  {
    try
      {
      //UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
      //UIManager.setLookAndFeel(UIManager.getCrossPlatformLookAndFeelClassName());
      }
    catch(Exception e)
      {}
  }

  // Clik sur un des boutons
  void btn_mouseClicked(MouseEvent e)
    {
    e.getSource().toString() ;
    }

  } // Fin de la class CTic

class CTic_btn_mouseAdapter extends java.awt.event.MouseAdapter
  {
  CTic adaptee;

  CTic_btn_mouseAdapter(CTic adaptee)
    {this.adaptee = adaptee; }

  public void mouseClicked(MouseEvent e)
    { adaptee.btn_mouseClicked(e) ; }

  }