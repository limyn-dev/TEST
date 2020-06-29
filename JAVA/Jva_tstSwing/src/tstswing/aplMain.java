package tstswing;



import java.awt.*;
import java.awt.event.*;
import java.applet.*;
import javax.swing.*;



/******************************************************************************
 * Title      : Test de l'interface swing
 * Description:
 * Copyright  : Copyright (c) 2002
 * Company    : _
 * @author    : Yves Delay
 * @version   : 1.0
 *****************************************************************************/



public class aplMain extends Applet
  {

  // Membres
  boolean     isStandalone  = false;
  CDataBase   myDataBase    = new CDataBase("NorthWind") ;

  // Composants
  JSplitPane  jsppMain      = new JSplitPane();
  JScrollPane jscpSelect    = new JScrollPane();
  JScrollPane jscpDetail    = new JScrollPane();
  JList       jlstCommande  = new JList() ;
  JTable      jtblCommande  = new JTable();

  // Instaciation
  public aplMain() {}

  // Methodes
  public void       init()                                {  jbInit() ;                   }
  public void       start()                               {}
  public void       stop()                                {}
  public void       destroy()                             {}
  public String     getAppletInfo()                       { return "Applet Information";  }
  public String[][] getParameterInfo()                    { return null;                  }
  public String     getParameter(String key, String def)  { return myGetParameter(key,def) ; }



  /***************************************************************************/



  /* Initalisation de l'applet
  ---------------------------------------------------------------------------*/
  private void jbInit()
    {
  try
    {

    // Initialisation des composants
    this.setLayout(new BorderLayout(100,100)) ;

    // Assemblage des composant
    this.add(jsppMain, BorderLayout.CENTER);
    jsppMain.add(jscpSelect, JSplitPane.LEFT);
    jsppMain.add(jscpDetail, JSplitPane.RIGHT);
    jscpSelect.getViewport().add(jlstCommande, null);
    jscpDetail.getViewport().add(jtblCommande, null);

    // Mise à jour des valeurs des listes
    mySetLstCommande() ;

    }
  catch(Exception e)  {e.printStackTrace();}
    }

  /* Mise à jour de la liste des commandes
  ---------------------------------------------------------------------------*/
  private void mySetLstCommande()
    {
    jscpSelect.getViewport().add(new JList(myDataBase.GetProduits()), null);
    }

  /* Retour des paramètres de l'applet
  ---------------------------------------------------------------------------*/
  private String myGetParameter(String key, String def)
    {
    if (isStandalone)
      return System.getProperty(key, def) ;
    else if (getParameter(key) != null)
      return getParameter(key) ;
    else
      return def ;
    }

  /* Main
  ---------------------------------------------------------------------------*/
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
    frame.setSize(600,620);
    Dimension d = Toolkit.getDefaultToolkit().getScreenSize();
    frame.setLocation((d.width - frame.getSize().width) / 2, (d.height - frame.getSize().height) / 2);
    frame.setVisible(true);
    }

  }