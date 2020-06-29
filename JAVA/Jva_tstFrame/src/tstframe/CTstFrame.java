package tstframe;

import java.awt.*;
import java.awt.event.*;
import java.applet.*;

/**
 * Title:        Test de frame
 * Description:  Applet qui lance une fenêtre
 * Copyright:    Copyright (c) 2000
 * Company:      _
 * @author Yves Delay
 * @version 1.0
 */

public class CTstFrame extends Applet
  {

  /*---- Membres -----------------------------------------------------------*/
  CFrame frm ;
  boolean isStandalone = false;

  /*---- Initialisation de l'applet ----------------------------------------*/
  public CTstFrame()  {}
  public void init()  { iniApl() ; }

  /*---- Methodes standards de l'applet -------------------------------------*/
  public void       start()             {}
  public void       stop()              {}
  public void       destroy()           {}
  public String     getAppletInfo()     { return "Applet Information"; }
  public String[][] getParameterInfo()  { return null;   }
  public String     getParameter(String key, String def)
    {
    return isStandalone ? System.getProperty(key, def) :
      (getParameter(key) != null ? getParameter(key) : def);
    }



  /**************************************************************************/


  /*---- Initialisation de l'aaplet -----------------------------------------*/
  private void iniApl()
    {
    try
      { jbInit() ;   }
    catch(Exception e)
      { e.printStackTrace();  }
    }
  private void jbInit() throws Exception
    {
    frm = new CFrame("Test de frame") ;
    frm.setVisible(true) ;
    }

  }