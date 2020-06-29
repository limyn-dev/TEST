package tstarbrebin;

import java.util.Enumeration ;
import javax.swing.tree.* ;

/**
 * Title:
 * Description:
 * Copyright:    Copyright (c) 2000
 * Company:
 * @author
 * @version 1.0
 */

public class CNodBin extends javax.swing.tree.DefaultMutableTreeNode
  {

  /*---- Membre -------------------------------------------------------------*/
  private int V ; // Valeur du noeud

  /*---- Accesseurs ---------------------------------------------------------*/
  public int  Valeur ()     { return V ;  }
  public void Valeur(int v) { V = v ;     }

  /*---- Instanciation ------------------------------------------------------*/
  public CNodBin(int valeur)  { super(); NewIst(valeur); }

  /*---- Methodes -----------------------------------------------------------*/
  public String toString()  { return new Integer(V).toString() ;    }



  /***************************************************************************/



  /*---- Création de l'instance ---------------------------------------------*/
  private void NewIst(int v)
    {
    V = v ;
    } // Fin de la création de la class

  /*---- Suppression de l'instance ---------------------------------------------*/
  private void DelIst()
    {
    } // Fin de la suppression de la class


  } // Fin de la class