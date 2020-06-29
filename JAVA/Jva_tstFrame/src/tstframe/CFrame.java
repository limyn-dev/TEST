package tstframe;

import java.awt.event.* ;
import java.awt.* ;

/**
 * Title:        Test de frame
 * Description:  Test de création d'une frame avec les getionnaire d'évenement
 * Copyright:    Copyright (c) 2000
 * Company:      _
 * @author Yves Delay
 * @version 1.0
 */

public class CFrame extends Frame
  implements MouseListener, MouseMotionListener, WindowListener
  {

  // Membres
  String   Msg ;
  int      PosX ;
  int      PosY ;

  // Constructeurs
  public CFrame()             { super() ; InitFrame() ;       }
  public CFrame(String titre) { super(titre) ;  InitFrame() ; }

  // Surdéfinition des methodes de Frame
  public void init  ()  {}
  public void paint (Graphics g)  { pntFrm(g) ; }
  public void start ()  {}
  public void stop  ()  {}

  // Implémentation des interfaces des évenement
  public void mouseClicked      (MouseEvent me)   { WriteFrame("Click") ;}
  public void mouseEntered      (MouseEvent me)   {}
  public void mouseExited       (MouseEvent me)   {}
  public void mousePressed      (MouseEvent me)   { WriteFrame("Pression") ;}
  public void mouseReleased     (MouseEvent me)   {}
  public void mouseDragged      (MouseEvent me)   {}
  public void mouseMoved        (MouseEvent me)   { WriteFrame("Depalcement") ; }
  public void windowActivated   (WindowEvent we)  {}
  public void windowClosed      (WindowEvent we)  { CloseFrame() ;  }
  public void windowClosing     (WindowEvent we)  { CloseFrame() ;  }
  public void windowDeactivated (WindowEvent we)  {}
  public void windowDeiconified (WindowEvent we)  {}
  public void windowIconified   (WindowEvent we)  {}
  public void windowOpened      (WindowEvent we)  {}




  /***************************************************************************/



  /*---- Création de l'instance ---------------------------------------------*/
  private void InitFrame()
    {

    // Initialisation des membres
    Msg = new String("") ;
    PosX = 10 ;
    PosY = 10 ;

    // Création des listener pour les évenement de la frame
    addMouseListener(this) ;
    addMouseMotionListener(this) ;
    addWindowListener(this) ;

    // Taille de la fenêtre
    this.setSize(500, 500) ;



    }

  /*---- Fermeture de la frame ----------------------------------------------*/
  private void CloseFrame()
    {

    // Fermture de la frame
    this.setVisible(false) ;

    }

  private void WriteFrame(String msg)
    {
    Msg = msg ;
    PosX = this.getX() ;
    PosY = this.getY() ;
    this.repaint() ;
    }

  /*---- Affichage dans la frame --------------------------------------------*/
  private void pntFrm(Graphics g)
    {
    g.drawString(Msg, 50, 100) ;
    }


  }