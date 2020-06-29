package jeuxdame;

import java.awt.*;
import java.awt.event.*;
import java.applet.*;
import javax.swing.*;

/**
 * Title:
 * Description: Applet principal du jeux
 * Copyright  : Copyright (c) 2000
 * Company    :
 * @author    : Yves Delay
 * @version 1.0
 */

public class aplMain extends Applet
  {

  //---- Constantes de class --------------------------------------------------
  public final static int NBL = 4 ;  // Taille de la grille
  public final static int NBC = 4 ;  // Taille de la grille

  //---- Membres --------------------------------------------------------------
  private boolean  isStandalone = false;
  private CJeux    myJeux ;  // Moteur du jeux
  private CCel[][] myGrid ;  // Grille de panel pour le dessin des pièces
  private JTree    myTree ;  // Arbre des solutions

  /*---- Construct the applet -----------------------------------------------*/
  public aplMain()  {}

  /*---- Methodes de l'applet -------------------------------------------------*/
  public void       init()              { myInit() ;                    }
  public void       start()             { this.repaint() ;              }
  public void       stop()              {}
  public void       destroy()           {}
  public void       paint(Graphics g)   { myPaint(g) ;                  }
  public String     getAppletInfo()     { return "Applet Information";  }
  public String[][] getParameterInfo()  { return null;                  }
  public String     getParameter(String key, String def)
    {
    return isStandalone ? System.getProperty(key, def) :
      (getParameter(key) != null ? getParameter(key) : def);
    }

  //---- Methode du jeux ------------------------------------------------------
  //public boolean JouerPiece(int cdePce, int cdeMve) { return myMotr.PlayPiece(cdePce, cdeMve) ; }

  /*---- Main method --------------------------------------------------------*/
  public static void main(String[] args)
    {
    aplMain applet = new aplMain();
    applet.isStandalone = true;
    Frame frame;
    frame = new Frame()
      {
      protected void processWindowEvent(WindowEvent e)
	{
          super.processWindowEvent(e);
          if (e.getID() == WindowEvent.WINDOW_CLOSING)
	    {
            System.exit(0);
	    }
        }
      public synchronized void setTitle(String title)
        {
        super.setTitle(title);
        enableEvents(AWTEvent.WINDOW_EVENT_MASK);
        }
      };
    frame.setTitle("Applet Frame");
    frame.add(applet, BorderLayout.CENTER);
    applet.init();
    applet.start();
    frame.setSize(800,400);
    Dimension d = Toolkit.getDefaultToolkit().getScreenSize();
    frame.setLocation((d.width - frame.getSize().width) / 2, (d.height - frame.getSize().height) / 2);
    frame.setVisible(true);
    }



  /***************************************************************************/



  /*---- Component initialization -------------------------------------------*/
  private void myInit()
    {
    try
      { jbInit(); }
    catch(Exception e)
      { e.printStackTrace();  }
    }
  private void jbInit() throws Exception
    {

    // Création des coposants
    myJeux = new CJeux(NBL, NBC) ;
    myGrid = new CCel[NBL][NBC] ;
    myTree = new JTree() ;
    Panel pnlBck = new Panel(new GridLayout(1, 2)) ;
    Panel pnlTrv = new Panel(new BorderLayout(2, 2)) ;
    Panel pnlGrd = new Panel(new GridLayout(NBL, NBC)) ;

    // Ajout du tree sur le fond
    pnlTrv.add(myTree) ;
    pnlBck.add(pnlTrv) ;

    // Ajout de la grille sur le fond
    for (int l=0; l<NBL; l++)
        for (int c=0; c<NBL; c++)
	  {
	  if ((l%2==1 && c%2==0) || (l%2==0 && c%2==1))
	    CCel cel = new CCel(CCel.CLRBLACK) ;
	  else
	    CCel cel = new CCel(CCel.CLRWHITE) ;
	  myGrid[l][c] = cel ;
	  pnlGrd.add(cel) ;
	  }
    pnlBck.add(pnlGrd) ;

    // Ajout du fond dans l'appletb
    this.setLayout(new BorderLayout(2, 2)) ;
    this.add(pnlBck, BorderLayout.CENTER) ;
    }

    /*---- Affichage de la Grille -------------------------------------------*/
    private void myPaint(Graphics g)
      {
      for (int l=0; l<NBL; l++)
	for (int c=0; c<NBC; c++)
	  myGrid[l][c].SetPce(jeux) ;
      }

  } // Fin de l'applet

