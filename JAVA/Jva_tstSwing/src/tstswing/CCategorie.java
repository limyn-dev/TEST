package tstswing;

/**
 * Title:        Test de l'interface swing
 * Description:
 * Copyright:    Copyright (c) 2002
 * Company:      _
 * @author Yves Delay
 * @version 1.0
 */

public class CCategorie
  {

  // Membres
  private int    myID ;
  private String myName ;
  private String myDescription ;

  // Instanciation
  public CCategorie() { myInit() ;  }

  // Accesseurs
  public int    GetID          ()                   { return myID ;                 }
  public String GetName        ()                   { return myName ;               }
  public String GetDescription ()                   { return myDescription ;        }
  public void   SetID          (int    id         ) { myID = id ;                   }
  public void   SetName        (String name       ) { myName = name ;               }
  public void   SetDescription (String description) { myDescription = description ; }

  // Methodes
  public String toString()                          { return myToString() ;         }



  /***************************************************************************/



  /* Instanciation
  --------------------------------------------------------------------------*/
  private void myInit()
    {
    myID          = 0 ;
    myName        = "NO DATA" ;
    myDescription = "NO DATA" ;
    }

  /* Convertion
  --------------------------------------------------------------------------*/
  private String myToString()
    {
    String str = "" ;
    str = str + myName + " (" + myDescription + ")" ;
    return str ;
    }

  }