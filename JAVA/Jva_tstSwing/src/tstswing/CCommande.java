package tstswing;



import java.util.*;



/******************************************************************************
 * Title:        Test de l'interface swing
 * Description:
 * Copyright:    Copyright (c) 2002
 * Company:      _
 * @author Yves Delay
 * @version 1.0
 *****************************************************************************/



public class CCommande extends java.lang.Object
  {

  // Membres
  private int    myOrderID ;
  private String myCustomerID ;
  private int    myEmployeeID ;
  private long   myOrderDate ;
  private long   myRequiredDate ;
  private long   myShippedDate ;
  private int    myShipVia ;
  private int    myFreight ;
  private String myShipName ;
  private String myShipAddress ;
  private String myShipCity ;
  private String myShipRegion ;
  private String myShipPostalCode ;
  private String myShipCountry ;

  // Instanciation
  public CCommande(int orderID) {}

  // Accesseurs
  public int    GetOrderID        ()                      { return myOrderID ;                  }
  public String GetCustomerID     ()                      { return myCustomerID ;               }
  public int    GetEmployeeID     ()                      { return myEmployeeID ;               }
  public long   GetOrderDate      ()                      { return myOrderDate ;                }
  public long   GetRequiredDate   ()                      { return myRequiredDate ;             }
  public long   GetShippedDate    ()                      { return myShippedDate ;              }
  public int    GetShipVia        ()                      { return myShipVia ;                  }
  public int    GetFreight        ()                      { return myFreight ;                  }
  public String GetShipName       ()                      { return myShipName ;                 }
  public String GetShipAddress    ()                      { return myShipAddress ;              }
  public String GetShipCity       ()                      { return myShipCity ;                 }
  public String GetShipRegion     ()                      { return myShipRegion ;               }
  public String GetShipPostalCode ()                      { return myShipPostalCode ;           }
  public String GetShipCountry    ()                      { return myShipCountry ;              }
  public void   SetOrderID        (int    orderID       ) { myOrderID        = orderID ;        }
  public void   SetCustomerID     (String customerID    ) { myCustomerID     = customerID;      }
  public void   SetEmployeeID     (int    employeeID    ) { myEmployeeID     = employeeID;      }
  public void   SetOrderDate      (long   orderDate     ) { myOrderDate      = orderDate;       }
  public void   SetRequiredDate   (long   requiredDate  ) { myRequiredDate   = requiredDate;    }
  public void   SetShippedDate    (long   shippedDate   ) { myShippedDate    = shippedDate;     }
  public void   SetShipVia        (int    shipVia       ) { myShipVia        = shipVia;         }
  public void   SetFreight        (int    freight       ) { myFreight        = freight;         }
  public void   SetShipName       (String shipName      ) { myShipName       = shipName;        }
  public void   SetShipAddress    (String shipAddress   ) { myShipAddress    = shipAddress;     }
  public void   SetShipCity       (String shipCity      ) { myShipCity       = shipCity;        }
  public void   SetShipRegion     (String shipRegion    ) { myShipRegion     = shipRegion;      }
  public void   SetShipPostalCode (String shipPostalCode) { myShipPostalCode = shipPostalCode;  }
  public void   SetShipCountry    (String shipCountry   ) { myShipCountry    = shipCountry;     }



  /***************************************************************************/



  /*Instaciation
  ---------------------------------------------------------------------------*/
  private void myInit()
    {
    myOrderID        = 0 ;
    myCustomerID     = "NO DATA" ;
    myEmployeeID     = 0 ;
    myOrderDate      = 0 ;
    myRequiredDate   = 0 ;
    myShippedDate    = 0 ;
    myShipVia        = 0 ;
    myFreight        = 0 ;
    myShipName       = "NO DATA" ;
    myShipAddress    = "NO DATA" ;
    myShipCity       = "NO DATA" ;
    myShipRegion     = "NO DATA" ;
    myShipPostalCode = "NO DATA" ;
    myShipCountry    = "NO DATA" ;
    }

  }