package tstsrb;

import java.awt.*;
import java.awt.event.*;
import java.applet.*;
import javax.swing.*;

/**
 * Title:
 * Description:
 * Copyright:    Copyright (c) 2002
 * Company:
 * @author
 * @version 1.0
 */

public class aplMain extends JApplet
  {

  /*---- Membres ------------------------------------------------------------*/
  boolean isStandalone = false;
  CDts Dts = new CDts("c:\\temp\\tst.dat") ;

  /*---- Construct the applet -----------------------------------------------*/
  public aplMain() {}

  /*---- implémentation de l'applet -----------------------------------------*/
  public void       init()              { newIst() ;  }
  public void       start()             {}
  public void       stop()              {}
  public void       destroy()           {}
  public String     getAppletInfo()     { return "Applet Information"; }
  public String[][] getParameterInfo()  { return null; }
  public String getParameter(String key, String def)
    {
    return isStandalone ? System.getProperty(key, def) :
      (getParameter(key) != null ? getParameter(key) : def);
    }

  /*---- Main method --------------------------------------------------------*/
  public static void main(String[] args)
    {
    aplMain applet = new aplMain();
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
      {
      }
    }

  /***************************************************************************/

  /*---- Création de l'instance ---------------------------------------------*/
  private void newIst()
    {
    try
      { jbInit(); }
    catch(Exception e)
      { e.printStackTrace(); }
    }
  private void jbInit() throws Exception
    {
    this.setSize(new Dimension(400,300));
    }

  } // Fin de l'applet

