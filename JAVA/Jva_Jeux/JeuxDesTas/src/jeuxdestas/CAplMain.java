package jeuxdestas;

import java.awt.* ;
import javax.swing.* ;
import javax.swing.event.* ;
import javax.swing.tree.* ;
import javax.swing.text.* ;

/**
 * Title:        Jeux des tas
 * Description:  Division succesives d'un ensemble de n élements, non distinct, en sous ensemble j'usqu'à ce que les sous ensemble contiennent au maximum 2 elements
 * Copyright:    Copyright (c) 2000
 * Company:      _
 * @author Yves Delay
 * @version 1.0
 */

public class CAplMain extends JApplet
  {

  /*---- Constantes ---------------------------------------------------------*/
  static final int NBRPCE = 8 ;

  /*---- Membres ------------------------------------------------------------*/
  private boolean isStandalone = false;
  private CNod    Root ;
  private int     NbrTas ;

  /*---- Composants ---------------------------------------------------------*/
  private JPanel    PnlCenter ;
  private JPanel    PnlBtn ;
  private CBtnTas[] BtnTas ;
  private JTree     Trv ;



  /*---- Construction de l'applet -------------------------------------------*/
  public CAplMain() {}
  public void init()
    {
    try
      { jbInit(); }
    catch(Exception e)
      { e.printStackTrace();  }
    }

  /*---- Gestion de l'applet ------------------------------------------------*/
  public void start()                   {}
  public void stop()                    {}
  public void destroy()                 {}
  public String getAppletInfo()         { return "Applet Information"; }
  public String[][] getParameterInfo()  { return null;  }
  public String getParameter(String key, String def)
    {
    return isStandalone ? System.getProperty(key, def) :
      (getParameter(key) != null ? getParameter(key) : def);
    }

  /*---- Main ---------------------------------------------------------------*/
  public static void main(String[] args)
    {
    CAplMain applet = new CAplMain();
    applet.isStandalone = true;
    applet.init();
    applet.start();
    } // Fin du main



  /***************************************************************************/



  /*---- Initialisation de l'applet -----------------------------------------*/
  private void jbInit() throws Exception
    {
    CNod newNod ;

    // Format de l'applet
    this.getContentPane().setLayout(new BorderLayout(5, 5)) ;

    // Création de la racine
    Root = new CNod(1) ;
    Root.setSzeSet(0, NBRPCE) ;

    // Création de l'arbre
    NxtNod(Root, true) ;

    // Création des composant
    PnlCenter = new JPanel(new java.awt.GridLayout(1, 2)) ;
    PnlBtn = new JPanel(new java.awt.GridLayout(NBRPCE, 1)) ;
    NbrTas = 1 ;  BtnTas = new CBtnTas[NbrTas] ;
    BtnTas[0] = new CBtnTas(NBRPCE) ;
    Trv = new JTree(Root) ;

    // Construction de l'affichage
    PnlCenter.add(Trv) ;
    this.getContentPane().add(PnlCenter, BorderLayout.CENTER) ;
    this.getContentPane().setSize(800, 800) ;

    }

  /*---- Initialisation de l'applet -----------------------------------------*/
  private void NxtNod(CNod pere, boolean prm)
    {
    CNod nod ;
    int vp ;
    int v1 ;
    int v2 ;

    for (int v=1; v<=pere.getSzeSet(0)/2; v++)
      {

      // Création du nouveau noeud
      nod = new CNod(pere.getNbrSet()+1) ;

      // Mise à jour des valeurs des tas
      v1 = v ;
      v2 = pere.getSzeSet(0)-v ;
      int p=1 ;
      for (int n=0; n<nod.getNbrSet(); n++)
	{

	if (p<pere.getNbrSet())
	  vp = pere.getSzeSet(p) ;
	else
	  vp = 0 ;

	if (v2>vp)
	  {
	  nod.setSzeSet(n, v2) ;
	  v2 = 0 ;
	  }
	else if(v1>vp)
	  {
	  nod.setSzeSet(n, v1) ;
	  v1 = 0 ;
	  }
	else if (vp>0)
	  {
	  nod.setSzeSet(n, vp) ;
	  p++ ;
	  }

	} // Fin de la mise à jour de la valeur des tas

	// Mise à jour du joueur
	nod.setPrm(!pere.getPrm()) ;

	// Noeuds enfants
	if (nod.getSzeSet(0)>2)
	  NxtNod(nod, !prm) ;
	else
	  if (nod.getPrm())
	    nod.setValCpt(1) ;
	  else
	    nod.setValCpt(-1) ;

	// Ajout des noeuds dans la liste des enfants
	pere.add(nod);

	// Mise à jour de la valeur du coup
	pere.setValCpt(pere.getValCpt()+nod.getValCpt()) ;

	}

    } // Fin de la création des noeuds

    /*---- Dessin de l'applet -----------------------------------------------*/
    private void drwApl(Graphics g)
      {
      g.drawLine(10, 10, 100, 100) ;
      }

  } // Fin de la class