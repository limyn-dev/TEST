package tstarbrebin;

import java.awt.*;
import java.awt.Frame;
import java.awt.event.*;
import javax.swing.* ;
import javax.swing.tree.* ;

/**
 * Title:
 * Description:
 * Copyright:    Copyright (c) 2000
 * Company:
 * @author
 * @version 1.0
 */

public class CFrmTree extends java.awt.Frame
  implements java.awt.event.WindowListener
  {

  /*---- Membre -------------------------------------------------------------*/
  private JTree       Trv ;
  private JScrollPane Scp ;
  private GridLayout  Lyt ;
  private CNodBin     Root ;

  /*---- Evenements de la frame ---------------------------------------------*/
  public void windowActivated  (WindowEvent we) {}
  public void windowClosed     (WindowEvent we) { DelIst() ;  }
  public void windowClosing    (WindowEvent we) { DelIst() ;  }
  public void windowDeactivated(WindowEvent we) {}
  public void windowDeiconified(WindowEvent we) {}
  public void windowIconified  (WindowEvent we) {}
  public void windowOpened     (WindowEvent we) {}

  /*---- Instanciation de la class ------------------------------------------*/
  public CFrmTree() { super(); NewIst() ;  }



  /***************************************************************************/



  /*---- Création de l'instance ---------------------------------------------*/
  private void NewIst()
    {

    // Dimentionnement de la frame
    this.setSize(500, 500) ;

    // Ajout du gestionaire d'evenements de fenêtre
    this.addWindowListener(this) ;

    // Création de la racine
    Root = new CNodBin(5) ;
    InsererNoeud(Root, new CNodBin(1)) ;
    InsererNoeud(Root, new CNodBin(2)) ;
    InsererNoeud(Root, new CNodBin(3)) ;
    InsererNoeud(Root, new CNodBin(4)) ;
    InsererNoeud(Root, new CNodBin(6)) ;
    InsererNoeud(Root, new CNodBin(7)) ;
    InsererNoeud(Root, new CNodBin(8)) ;

    // Création du treeview
    Trv = new JTree(Root) ;

    // Création du scroll panel
    int h = ScrollPaneConstants.HORIZONTAL_SCROLLBAR_AS_NEEDED ;
    int v = ScrollPaneConstants.VERTICAL_SCROLLBAR_AS_NEEDED ;
    Scp = new javax.swing.JScrollPane(Trv, v, h) ;

    // Création du layout de la frame
    this.setLayout(new java.awt.BorderLayout(5, 5)) ;
    this.add(new Panel(), BorderLayout.SOUTH) ;
    this.add(Scp, BorderLayout.CENTER) ;

    } // Fin de la création de l'instance

  /*---- Suppression de l'instance ------------------------------------------*/
  private void DelIst()
    {
    this.hide() ;
    }

  /*---- Ajout d'un noeud dans l'arbre --------------------------------------*/
  public void InsererNoeud(CNodBin pere, CNodBin noeud)
    {

    // Insértion dans la branche de droit pour les petit
    if ( noeud.Valeur() < pere.Valeur())
      if (pere.getChildCount()>0)
	InsererNoeud((CNodBin)pere.getChildAt(0), noeud) ;
      else
	pere.insert(noeud,0)  ;

    // Insértion dans la branche de gauche pour les plus grans ou égal
    else
      if (pere.getChildCount()>1)
        InsererNoeud((CNodBin)pere.getChildAt(1), noeud) ;
      else
	{
	if (pere.getChildCount()==0)
	  pere.insert(null, 0) ;
        pere.insert(noeud, 1) ;
	}


    } // Fin de l'ajout du noeud

  /*---- Recherche d'un noeud dans l'arbre ----------------------------------*/
  //public CNodBin FindNoeud(int val)
  //  {
  //  } // Fin de la recherche dans l'arbre


  } // Fin de la class