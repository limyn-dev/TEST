package tstcomposant;



import java.awt.* ;
import java.awt.Frame;
import java.awt.event.* ;
import java.applet.*;



/******************************************************************************
 * Title:        Test d'utilisation de composants dans un applet
 * Description:
 * Copyright:    Copyright (c) 2000
 * Company:      _
 * @author Yves Delay
 * @version 1.0
 *****************************************************************************/
public class CTstComposant
  extends Applet
  implements MouseListener, KeyListener, ActionListener
  {



  /***** Membres *************************************************************/
  boolean isStandalone = false ;
  int NbrLne ;
  int NbrCol ;
  Button[][] Btns ;
  boolean Joueur ;



  /***** Methodes de l'applet ************************************************/

  public CTstComposant()
    {
    }

  public void init()
    {

    // Dimention de la table
    NbrLne = 3 ;
    NbrCol = 3 ;

    // Création des ecouteurs
    //this.addWindowListener(this) ;
    this.addMouseListener(this) ;
    this.addKeyListener(this) ;

    // Ajout du gestionaire de placement
    this.setLayout(new GridLayout(NbrLne, NbrCol)) ;

    // Création de la table des boutons
    Btns = new Button[NbrLne][] ;
    for (int l=0; l<NbrLne; l++)
      Btns[l] = new Button[NbrCol] ;

    // Création des bouttons
    for (int l=0; l<NbrLne; l++)
      for (int c=0; c<NbrCol; c++)
	{
	Btns[l][c] = new Button("") ;
	Btns[l][c].addActionListener(this) ;
	this.add(Btns[l][c]) ;
	}

    // Initialisation du joueur
    Joueur = true ;

    } // Fin de l'nitialisation de l'applet

  public void start()
    {
    }

  public void paint(Graphics g)
    {
    }



  /***** Implémentation des interfaces ***************************************/

  public void mouseClicked      (MouseEvent me)   {}
  public void mouseEntered      (MouseEvent me)   {}
  public void mouseExited       (MouseEvent me)   {}
  public void mousePressed      (MouseEvent me)   {}
  public void mouseReleased     (MouseEvent me)   {}
  public void keyPressed        (KeyEvent ke)     {}
  public void keyReleased       (KeyEvent ke)     {}
  public void keyTyped          (KeyEvent ke)     {}
  public void actionPerformed   (ActionEvent ae)  { SetBtns((Button)ae.getSource()) ; }



  /***** Fonctionalités ******************************************************/

  /*---------------------------------------------------------------------------
   *  Séquence de jeux
   *-------------------------------------------------------------------------*/
  private void SetBtns(Button btn)
    {
    String str ;
    int l = 0 ;
    int c = 0 ;
    boolean trouve = false ;

    // Validité du coups
    if (btn.getLabel()=="")
      {

      // Séléction du flag
      if (Joueur)
	str = new String("X") ;
      else
	str = new String("O") ;

      // Changement de joueur
      Joueur = !Joueur ;

      // Flag de la touche
      btn.setLabel(str) ;

      // Recherche de la position du jeux
      l = -1 ;
      while(!trouve && l<NbrLne-1)
	{
	l++ ;
	c = -1 ;
	while(!trouve && c<NbrCol-1)
	  {
	  c++ ;
//	  System.out.println("l / c: " + new Integer(l).toString() + " / " + new Integer(c).toString());
	  if(Btns[l][c] == btn)
	    trouve = true ;
	  }
	}

//      System.out.println("Selection: " + new Integer(l).toString() + " / " + new Integer(c).toString());

      // Check de la fin de jeux
      if (trouve)
        if (this.Gagne(l, c))
          {
	  btn.setLabel("OK!") ;
//	  for (l=0; l<NbrLne; l++)
//	    for (c=0; c<NbrCol; c++)
//	      Btns[l][c].setEnabled(false) ;
	  }

      } // Fin du contrôle de la validité du coup

    } // Fin de la séquence de jeux

  /*---------------------------------------------------------------------------
   *  Contrôle de fin du jeux
   *-------------------------------------------------------------------------*/
  private boolean Gagne(int l0, int c0)
    {
    String str = Btns[l0][c0].getLabel() ;
    boolean d1 = true ; // Valeur de la première diagonale
    boolean d2 = true ; // Valeur de la deuxième diagonale
    boolean l  = true ; // Valeur de la ligne
    boolean c  = true ; // Valeur de la colonne
    boolean lh = true ; // limite de la ligne du haut
    boolean lb = true ; // limite de la ligne du bas
    boolean cg = true ; // Limite de la colonne gauche
    boolean cd = true ; // Limite de la colonne droit

    // Parcourt des cellules autour de la cellule de base
    int i = 0 ;
    while ((lh || lb || cg || cd) && (d1 || d2 || l || c))
      {

      // Calcul des limites
      i++ ;
      if (l0+i>=NbrLne) lb = false ;
      if (l0-i<0)	lh = false ;
      if (c0+i>=NbrCol)	cd = false ;
      if (c0-i<0)	cg = false ;

      System.out.println("i / d1 / d2 / l / c: " +
		         new Integer(i ).toString() + " : " +
                         new Boolean(d1).toString() + " / " +
			 new Boolean(d2).toString() + " / " +
		         new Boolean(l ).toString() + " / " +
		         new Boolean(c ).toString()) ;

      // Première diagonale
      if (lh && cg)
	{
	System.out.println("l0-i / c0-i: " + new Integer(l0-i).toString() + " / " + new Integer(l0-i).toString()) ;
	if (Btns[l0-i][c0-i].getLabel() != str)
	  d1 = false ;
	}
      if (lb && cd)
	{
	System.out.println("l0+i / c0+i: " + new Integer(l0+i).toString() + " / " + new Integer(c0+i).toString()) ;
	if (Btns[l0+i][c0+i].getLabel() != str)
	  d1 = false ;
	}

      // Deuxième diagonale
      if (lb && cg)
	{
	System.out.println("l0+i / c0-i: " + new Integer(l0+i).toString() + " / " + new Integer(c0-i).toString()) ;
	if (Btns[l0+i][c0-i].getLabel() != str)
	  d2 = false ;
	}
      if (lh && cd)
	{
	System.out.println("l0-i / c0+i: " + new Integer(l0-i).toString() + " / " + new Integer(c0+i).toString()) ;
	if (Btns[l0-i][c0+i].getLabel() != str)
	  d2 = false ;
	}

      // Ligne
      if (cg)
	{
	System.out.println("l0 / c0-i: " + new Integer(l0).toString() + " / " + new Integer(c0-i).toString()) ;
	if (Btns[l0][c0-i].getLabel() != str)
	  l = false ;
	}
      if (cd)
	{
	System.out.println("l0 / c0+i: " + new Integer(l0).toString() + " / " + new Integer(c0+i).toString()) ;
	if (Btns[l0][c0+i].getLabel() != str)
	  l = false ;
	}

      // Colonne
      if (lb)
	{
  	System.out.println("l0+i / c0: " + new Integer(l0+i).toString() + " / " + new Integer(c0).toString()) ;
	if (Btns[l0+i][c0].getLabel() != str)
	  c = false ;
	}
      if (lh)
	{
	System.out.println("l0-i / c0: " + new Integer(l0-i).toString() + " / " + new Integer(c0).toString()) ;
	if (Btns[l0-i][c0].getLabel() != str)
          c = false ;
	}

      }

    // Contrôle des solutions valides
    if (d1 || d2 || l || c)
      return true ;
    else
      return false ;

    }



  /***** Main ****************************************************************/

  public static void main(String[] args)
    {
    CTstComposant applet = new CTstComposant();
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

    } // Fin du main

  } // Fin de l'applet





