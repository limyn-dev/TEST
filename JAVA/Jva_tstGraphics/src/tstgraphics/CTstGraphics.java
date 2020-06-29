package tstgraphics;



import java.awt.*;
import java.awt.event.*;
import java.applet.*;



/******************************************************************************
 * Title:        Test des graphic dans les applets
 * Description:
 * Copyright:    Copyright (c) 2000
 * Company:      _
 * @author Yves Delay
 * @version 1.0
 *****************************************************************************/



public class CTstGraphics
  extends Applet
  implements MouseListener, MouseMotionListener
  {

  /***** Membres *************************************************************/
  boolean isStandalone = false;

  int X0, X1 ;
  int Y0, Y1 ;



  /***** Methodes de l'applet ************************************************/
  public String getParameter(String key, String def)
    {
    return isStandalone ?
           System.getProperty(key, def):(getParameter(key) != null ?
	   getParameter(key) : def);
    }
  public CTstGraphics()
    {
    }
  public void init()
    {
    try
      { jbInit() ;  }
    catch(Exception e)
      { e.printStackTrace();  }
    }
  private void jbInit() throws Exception
    {

    // Ecouteur des évenement de la souris
    this.addMouseListener(this) ;
    this.addMouseMotionListener(this) ;

    // Position de départ
    X0 = 0 ;
    Y0 = 0 ;

    }
  public void start()
    {
    }
  public void stop()
    {
    }
  public void destroy()
    {
    }
  public String getAppletInfo()
    {
    return "Applet Information" ;
    }
  public String[][] getParameterInfo()
    {
    return null;
    }
  public void paint(Graphics g)
    {
    g.drawLine(X0, Y0, X1, Y1) ;
    g.drawOval(X0, Y0, X1, Y1) ;
    g.drawRect(X0, Y0, X1, Y1) ;
    g.drawRoundRect(Y0,X0,Y1, X1, Y0, X0) ;
    }



  /***** Implémentation des interfaces ***************************************/
  public void mouseClicked      (MouseEvent me)
    {
    X1 = me.getX() ;  Y1 = me.getY() ;
    this.repaint() ;
    X0 = X1 ; Y0 = Y1 ;
    }
  public void mouseEntered      (MouseEvent me)   {}
  public void mouseExited       (MouseEvent me)   {}
  public void mousePressed      (MouseEvent me)   {}
  public void mouseReleased     (MouseEvent me)   {}
  public void mouseDragged      (MouseEvent me)   {}
  public void mouseMoved        (MouseEvent me)   {}

  /***** Fonctionalités ******************************************************/


  /**Main method*/
  public static void main(String[] args)
    {
    CTstGraphics applet = new CTstGraphics();
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
      } ;
    frame.setTitle("Applet Frame");
    frame.add(applet, BorderLayout.CENTER);
    applet.init();
    applet.start();
    frame.setSize(400,320);
    Dimension d = Toolkit.getDefaultToolkit().getScreenSize();
    frame.setLocation((d.width - frame.getSize().width) / 2, (d.height - frame.getSize().height) / 2);
    frame.setVisible(true);
    }

  }