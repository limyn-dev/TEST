package jeuxdestas;

import javax.swing.tree.DefaultMutableTreeNode ;

/**
 * Title:        Jeux des tas
 * Description:  Division succesives d'un ensemble de n élements, non distinct, en sous ensemble j'usqu'à ce que les sous ensemble contiennent au maximum 2 elements
 * Copyright:    Copyright (c) 2000
 * Company:      _
 * @author Yves Delay
 * @version 1.0
 */

public class CNod extends DefaultMutableTreeNode
  {

  /*---- Membre -------------------------------------------------------------*/
  int[]   LstSet ;  // Liste des ensembles
  int     NbrSet ;  // Nombre d'ensemble
  boolean Prm ;     // Flag du premier joueur
  int     ValCpt ;  // Valeur du coups

  /*---- Accesseurs ---------------------------------------------------------*/
  public void    setPrm(boolean prm)                 { Prm = prm ;               }
  public boolean getPrm()                            { return Prm ;             }
  public void    setSzeSet(int numSet, int szeSet)   { LstSet[numSet] = szeSet ; }
  public int     getSzeSet(int numSet)               { return LstSet[numSet] ;   }
  public int     getNbrSet()                         { return NbrSet ;           }
  public void    setValCpt(int valCpt)               { ValCpt = valCpt ;         }
  public int     getValCpt()                         { return ValCpt ;           }

  /*---- Construction de la class -------------------------------------------*/
  public CNod(int nbrSet) {super(); newIst(nbrSet); }

  /*---- Chaine de la classe ------------------------------------------------*/
  public String toString()  { return StrSet() ;}


  /***************************************************************************/



  /*---- Création de l'instance ---------------------------------------------*/
  private void newIst(int nbrSet)
    {
    NbrSet = nbrSet ;
    LstSet = new int[NbrSet] ;
    for (int s=0; s<NbrSet; s++)
      LstSet[s] = 0 ;
    }

  /*---- Convertion vers string ---------------------------------------------*/
  private String StrSet()
    {
    String str = new String("") ;

    // Affichage du joueur
    if (Prm)
      str = str + "A: " ;
    else
      str = str + "B: " ;

    // Affichage des ensmbles
    for (int s=0; s<NbrSet; s++)
      {
      if (s>0)
        str = str + "/" ;
      str = str + new Integer(LstSet[s]).toString() ;
      }

    // Affichage de la valeur du coup
    str = str + " " + new Integer (ValCpt).toString() ;


    return str ;
    }

  } // Fin de la class