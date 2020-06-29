package tstsrv;

import java.awt.*;
import java.awt.event.*;
import java.applet.*;
import javax.swing.*;

/**
 * Title:        Test de servelet
 * Description:
 * Copyright:    Copyright (c) 2002
 * Company:      _
 * @author Yves Delay
 * @version 1.0
 */

public class AplTstSrv extends JApplet
  implements java.awt.event.ActionListener
  {

  /*---- Membres ------------------------------------------------------------*/
  boolean isStandalone = false;

  /*---- Implementation des interfaces --------------------------------------*/
  public void actionPerformed(ActionEvent ae) { OnClikBtn() ;       }

  /*---- Composants ---------------------------------------------------------*/
  Button btn ;

  /*---- Construct the applet -----------------------------------------------*/
  public AplTstSrv() {}

  /*---- Mthodes de l'applet ------------------------------------------------*/
  public void start()                   {}
  public void stop()                    {}
  public void destroy()                 {}
  public String getAppletInfo()         { return "Applet Information";}
  public String[][] getParameterInfo()  { return null;  }
  public void init()                    { MyInit() ;  }
  public String getParameter(String key, String def)
    {
    return isStandalone ? System.getProperty(key, def) :
      (getParameter(key) != null ? getParameter(key) : def);
    }

  /**Main method*/
  public static void main(String[] args) {
    AplTstSrv applet = new AplTstSrv();
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
  static {
    try {
      //UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
      //UIManager.setLookAndFeel(UIManager.getCrossPlatformLookAndFeelClassName());
    }
    catch(Exception e) {
      }
    }



  /***************************************************************************/



  /*---- Initialisation de l'applet -----------------------------------------*/
  private void MyInit()
    {
    try
      { jbInit(); }
    catch(Exception e)
      { e.printStackTrace(); }
    }
  private void jbInit() throws Exception
    {

    // Taille de l'applet
    this.setSize(new Dimension(100,100));

    // Création des composants
    btn = new Button("*") ;
    btn.addActionListener(this) ;

    // Construction du graphisme
    this.getContentPane().add(btn) ;


    }

    /*---- Click sur le boutton ---------------------------------------------*/
    private void OnClikBtn()
      {
      if (btn.getLabel() == "*")
        btn.setLabel("-") ;
      else
        btn.setLabel("*") ;
      }

  } // Fin de l'applet