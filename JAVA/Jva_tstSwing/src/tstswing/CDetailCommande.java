package tstswing;

/**
 * Title:        Test de l'interface swing
 * Description:
 * Copyright:    Copyright (c) 2002
 * Company:      _
 * @author Yves Delay
 * @version 1.0
 */

public class CDetailCommande
  {

  // Mmembres
  private int      myID ;
  private CProduit myProduct ;
  private long     myUnitPrice ;
  private int      myQuantity ;
  private int      myDiscount ;

  // Instanciation
  public CDetailCommande() {}

  // Accesseurs
  public int      GetID       ()                    { return myID ;             }
  public CProduit GetProduct  ()                    { return myProduct ;        }
  public long     GetUnitPrice()                    { return myUnitPrice ;      }
  public int      GetQuantity ()                    { return myQuantity ;       }
  public int      GetDiscount ()                    { return myDiscount ;       }
  public void     SetID       (int      id       )  { myID        = id;         }
  public void     SetProduct  (CProduit product  )  { myProduct   = product;    }
  public void     SetUnitPrice(long     unitPrice)  { myUnitPrice = unitPrice;  }
  public void     SetQuantity (int      quantity )  { myQuantity  = quantity;   }
  public void     SetDiscount (int      discount )  { myDiscount  = discount;   }



  /***************************************************************************/



  /* Instanciation
  ---------------------------------------------------------------------------*/
  private void myInit()
    {
    myID        = 0 ;
    myProduct   = new CProduit() ;
    myUnitPrice = 0 ;
    myQuantity  = 0 ;
    myDiscount  = 0 ;
    }

  }