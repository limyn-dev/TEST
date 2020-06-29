package Tic;

import java.awt.*;
import java.awt.event.*;
import java.applet.*;
import javax.swing.* ;

/**
 * Title:        Tic
 * Description:
 * Copyright:    Copyright (c) 2002
 * Company:
 * @author Yves Delay
 * @version 1.0
 */

public class CTic extends Applet
  {

  /*----- Membres -----------------------------------------------------------*/
  boolean isStandalone = false;
  CTic_ frmTic ;

  /*----- Création de l'applet ----------------------------------------------*/
  public CTic() {}

  /*----- Gestion de l'applet -----------------------------------------------*/
  public void       init(int lne, int col)    { newIst() ;  }
  public void       start()                   { newFrm() ;  }
  public void       stop()                    {}
  public void       destroy()                 {}
  public String     getAppletInfo()           { return "Applet Information";  }
  public String[][] getParameterInfo()        { return null;  }
  public String     getParameter(String key, String def)
    {
    return isStandalone ? System.getProperty(key, def) :
      (getParameter(key) != null ? getParameter(key) : def);
    }

  /*----- Main --------------------------------------------------------------*/
  public static void main(String[] args)
    {
    CTic applet = new CTic();
    applet.isStandalone = true;
    JFrame frame = new JFrame("TIC") ;

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



  /***************************************************************************/



  /*----- Initialisation de l'applet ----------------------------------------*/
  private void newIst()
    {
    try
      { jbInit(); }
    catch(Exception e)
      { e.printStackTrace(); }
    }
  private void jbInit() throws Exception
    {
    }

  /*----- Gestion de la frame -----------------------------------------------*/
  private void newFrm()
    {
    frmTic = new CTic_() ;
    frmTic.show() ;
    }
  private void clsFrm()
    {
    frmTic.hide() ;
    }


  } // Fin de la class CTic
