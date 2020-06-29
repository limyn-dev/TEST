package tstswing;



import java.util.* ;



/******************************************************************************
 * Title      : Test de l'interface swing
 * Description: Liste de produits
 * Copyright  : Copyright (c) 2002
 * Company    : _
 * @author    : Yves Delay
 * @version   : 1.0
 *****************************************************************************/



public class CProduits extends Vector
  {

  // Instanciation
  public CProduits()                                    { super() ; myInit() ;          }

  // Ajout d'une catégorie, spécialisation de Vecteur
  public void     insertElementAt(CProduit p, int i)    { super.insertElementAt(p, i) ; }
  public void     add            (int i, CProduit p)    { super.add(i, p) ;             }
  public boolean  add            (CProduit p)           { return super.add(p) ;         }
  public boolean  addAll         (CProduits p)          { return super.addAll(p) ;      }
  public boolean  addAll         (int i, CProduits p)   { return super.addAll(i, p) ;   }
  public void     addElement     (CProduit p)           { super.addElement(p) ;         }



  /***************************************************************************/



  /* Instanciation
  ---------------------------------------------------------------------------*/
  private void myInit()
    {
    }


}