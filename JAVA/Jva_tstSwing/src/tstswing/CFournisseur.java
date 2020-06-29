package tstswing;

/**
 * Title:        Test de l'interface swing
 * Description:
 * Copyright:    Copyright (c) 2002
 * Company:      _
 * @author Yves Delay
 * @version 1.0
 */

public class CFournisseur
  {

  // Membres
  private int    myId ;
  private String myName ;
  private String myPhone ;

  // Instanciation
  public CFournisseur()                 { myInit() ;            }

  // Accesseurs
  public int    GetId   ()              { return myId ;         }
  public String GetName ()              { return myName ;       }
  public String GetPhone()              { return myPhone ;      }
  public void   SetId   (int    id)     { myId    = id ;        }
  public void   SetName (String name)   { myName  = name ;      }
  public void   SetPhone(String phone)  { myPhone = phone ;     }

  // Convertion string
  public String toString()              { return myToString() ; }



  /***************************************************************************/



  /* Instanciation
  ---------------------------------------------------------------------------*/
  private void myInit()
    {
    myId    = 0 ;
    myName  = "NO DATA" ;
    myPhone = "NO DATA" ;
    }

  /* Convertion String
  ---------------------------------------------------------------------------*/
  private String myToString()
    {
    return myName + " (" + myPhone + ")" ;
    }

  }