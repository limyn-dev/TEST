package Jeux.jeuxdu31;

import java.awt.*;
import java.awt.event.*;
import java.applet.*;
import javax.swing.*;

public class jeux extends JApplet {
  boolean isStandalone = false;
  BorderLayout borderLayout1 = new BorderLayout();
  JButton jButton1 = new JButton();
  JButton jButton2 = new JButton();
  JButton jButton3 = new JButton();
  JButton jButton4 = new JButton();
  JPanel jPanel1 = new JPanel();

  //Construire l'applet
  public jeux() {
  }

  //Initialiser l'applet
  public void init() {
    try  {
      jbInit();
    }
    catch(Exception e)  {
      e.printStackTrace();
    }
  }

  //Initialiser le composant
  private void jbInit() throws Exception
    {
    jButton1.setText("jButton1");
    this.setSize(new Dimension(400,300));
    this.getContentPane().setLayout(borderLayout1);
    jButton2.setText("jButton2");
    jButton3.setText("jButton3");
    jButton4.setText("jButton4");
    this.getContentPane().add(jButton1, BorderLayout.NORTH);
    this.getContentPane().add(jButton2, BorderLayout.WEST);
    this.getContentPane().add(jButton3, BorderLayout.SOUTH);
    this.getContentPane().add(jButton4, BorderLayout.EAST);
    this.getContentPane().add(jPanel1, BorderLayout.CENTER);

    Canvas cnv = new Canvas ;

    jPanel1.add(cnv) ;

    }

  //Démarrer l'applet
  public void start()
    {
    cnv.
    }

  //Arrêter l'applet
  public void stop()
    {
    }

  //Détruire l'applet
  public void destroy()
    {
    }

  //Obtenir les informations d'applet
  public String getAppletInfo()
    {
    return "Information applet";
    }

  //Obtenir les informations de paramètre
  public String[][] getParameterInfo()
    {
    return null;
    }



  //Méthode principale
  public static void main(String[] args)
    {
    jeux applet = new jeux();
    applet.isStandalone = true;
    JFrame frame = new JFrame();
    frame.setTitle("Cadre de l'applet");
    frame.getContentPane().add(applet, BorderLayout.CENTER);
    applet.init();
    applet.start();
    frame.setSize(400,320);
    Dimension d = Toolkit.getDefaultToolkit().getScreenSize();
    frame.setLocation((d.width - frame.getSize().width) / 2, (d.height - frame.getSize().height) / 2);
    frame.setVisible(true);
    }



  // static initializer for setting look & feel
  static {
    try {
      UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
      //UIManager.setLookAndFeel(UIManager.getCrossPlatformLookAndFeelClassName());
    }
    catch (Exception e) {}
  }

}