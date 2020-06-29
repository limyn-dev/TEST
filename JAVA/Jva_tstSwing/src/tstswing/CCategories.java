package tstswing;



import java.util.*;
import javax.swing.*;



/******************************************************************************
 * Title:        Test de l'interface swing
 * Description:
 * Copyright:    Copyright (c) 2002
 * Company:      _
 * @author Yves Delay
 * @version 1.0
 *****************************************************************************/



public class CCategories extends Vector
  {

  // Instanciation
  public CCategories()                                  { super() ; myInit() ;          }

  // Ajout d'une catégorie, spécialisation de Vecteur
  public void     insertElementAt(CCategorie c, int i)  { super.insertElementAt(c, i) ; }
  public void     add            (int i, CCategorie c)  { super.add(i, c) ;             }
  public boolean  add            (CCategorie c)         { return super.add(c) ;         }
  public boolean  addAll         (CCategories c)        { return super.addAll(c) ;      }
  public boolean  addAll         (int i, CCategories c) { return super.addAll(i, c) ;   }
  public void     addElement     (CCategorie c)         { super.addElement(c) ;         }



  /***************************************************************************/



  /* Instanciation
  ---------------------------------------------------------------------------*/
  private void myInit()
    {
    }



  }