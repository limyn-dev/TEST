package tstswing;

import java.util.*;
import java.sql.* ;

/**
 * Title:        Test de l'interface swing
 * Description:
 * Copyright:    Copyright (c) 2002
 * Company:      _
 * @author Yves Delay
 * @version 1.0
 */

public class CCommandes implements ListModel
  {

  // Membre
  private Connection myCon ;

  // Instanciation
  public CCommandes(Connexion con)                              { myInit(con) ;  }

  // Implémentation de ListModel
  public CCommande getElementAt(int index)                      { return myGetElement(index) ;  }
  public int       getSize()                                    {}
  public void      voidaddListDataListener(ListDataListener, 1)  {}
  public void      removeListDataListener(ListDataListener, 1)   {}



  /***************************************************************************/



  /* Instanciation
  ---------------------------------------------------------------------------*/
  private void myInit(Connection con)
    {
    myCon = con ;
    }

  /* Recherche d'un élément dans la table
  ---------------------------------------------------------------------------*/
  private CCommande myGetElement(int id)
    {
    }

  }
