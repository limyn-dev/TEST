package tstarbrebin;

import java.awt.*;
import java.awt.event.*;
import java.applet.*;

/**
 * Title:
 * Description:
 * Copyright:    Copyright (c) 2000
 * Company:
 * @author
 * @version 1.0
 */

public class CAplTstArbre extends Applet
  {

  /*---- Membre -------------------------------------------------------------*/
  boolean isStandalone = false;
  CFrmTree frm ;

  /*---- Construct the applet -----------------------------------------------*/
  public CAplTstArbre() {}

  /*---- Gestion de l'applet ------------------------------------------------*/
  public void       init()                    { NewApl() ;  }
  public void       start()                   {}
  public void       stop()                    {}
  public void       destroy()                 {}
  public String     getAppletInfo()           { return "Applet Information"; }
  public String[][] getParameterInfo()        { return null;  }
  public String getParameter(String key, String def)
    {
    return isStandalone ? System.getProperty(key, def) :
      (getParameter(key) != null ? getParameter(key) : def);
    }

  /*---- Main method --------------------------------------------------------*/
  public static void main(String[] args)
    {
    CAplTstArbre applet = new CAplTstArbre();
    applet.isStandalone = true;
    applet.init();
    applet.start();
    }



  /***************************************************************************/



  /*---- Création de l'applet -----------------------------------------------*/
  private void NewApl()
    {
    try
      { jbInit(); }
    catch(Exception e)
      { e.printStackTrace();  }
    }
  private void jbInit() throws Exception
    {
    frm = new CFrmTree() ;
    frm.show() ;
    }

  /*---- Suppression de l'applet --------------------------------------------*/
  private void DelApl()
    {
    }



  } // Fin de l'applet