package tstswing;



import java.sql.* ;



/****************************************************************************
 * Title        : Interface avec la DB Northwind
 * Description  :
 * Copyright    : Copyright (c) 2000
 * Company      :      _
 * @author      : Yves Delay
 * @version 1.0 :
 ****************************************************************************/



public class CDataBase
  {


  // Membres
  private Connection myCon ;

  // Instanciation
  public CDataBase()                    { myInit() ;                  }
  public CDataBase(String dsn)          { myInit() ;  myOpen(dsn) ;   }

  // Methodes
  public void          Open(String dsn)       { myOpen(dsn) ;                 }
  public void          Close()                { myClose() ;                   }
  public CCategories   GetCategories()        { return myGetCategories() ;    }
  public CCategorie    GetCategorie(int id)   { return myGetCategorie(id) ;   }
  public CFournisseurs GetFournisseurs()      { return myGetFournisseurs() ;  }
  public CFournisseur  GetFournisseur(int id) { return myGetFournisseur(id) ; }
  public CProduits     GetProduits()          { return myGetProduits() ;      }
  public CProduit      GetProduit(int id)     { return myGetProduit(id) ;     }



  /***************************************************************************/



  /* Instanciation
  ---------------------------------------------------------------------------*/
  private void myInit()
    {
    myCon = null ;
    }

  /* Ouverture de la db
  ---------------------------------------------------------------------------*/
  private void myOpen(String DSN)
    {
  try
    {

    // Chargement du drivers
    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver") ;

    // Ouverture de la connexion
    myCon = DriverManager.getConnection("jdbc:odbc:"+DSN) ;

    }
  catch (SQLException eSQL)           { ErrorSQL("myOpen", eSQL) ;            }
  catch (ClassNotFoundException eCls) { ErrorClassNotFound("myOpen", eCls) ;  }
  catch (Exception e)                 { ErrorDefault("myOpen", e) ;           }
    } // fin de myOpen

  /* Fermeture de la db
  ---------------------------------------------------------------------------*/
  private void myClose()
    {
  try
    {
    myCon.close() ;
    }
  catch (SQLException eSQL) { ErrorSQL("myClose", eSQL) ;      }
  catch (Exception e)       { ErrorDefault("myClose", e) ;     }
    }

  /* Selection d'une catégorie en fonction de son id
  ---------------------------------------------------------------------------*/
  private CCategorie myGetCategorie(int id)
    {
    CCategorie categorie = new CCategorie() ;
    try
      {
      ResultSet rst = ExecuteCmd
        (
        "SELECT * " +
        "FROM Categories " +
        "WHERE CategoryID=" + Integer.toString(id)
        ) ;
      categorie.SetID(rst.getInt("CategoryID")) ;
      categorie.SetName(rst.getString("CategoryName")) ;
      categorie.SetDescription(rst.getString("Description")) ;
      rst.close() ;
      }
    catch (SQLException eSQL) { ErrorSQL("myCategories", eSQL) ;      }
    catch (Exception e)       { ErrorDefault("myCategories", e) ;     }
    return categorie ;
    }

  /* Liste des catégories
  ---------------------------------------------------------------------------*/
  private CCategories myGetCategories()
    {
    CCategories categories = new CCategories() ;
    try
      {
      ResultSet rst = ExecuteCmd("SELECT CategoryID FROM Categories") ;
      while (!rst.isAfterLast())
        {
        categories.add(myGetCategorie(rst.getInt("CategoryID"))) ;
        rst.next() ;
        rst.close() ;
        }
      }
    catch (SQLException eSQL) { ErrorSQL("myCategories", eSQL) ;      }
    catch (Exception e)       { ErrorDefault("myCategories", e) ;     }
    return categories ;
    }

  /* Selection d'un fournisseur en fonction de son id
  ---------------------------------------------------------------------------*/
  private CFournisseur myGetFournisseur(int id)
    {
    CFournisseur fournisseur = new CFournisseur() ;
    try
      {
      ResultSet rst = ExecuteCmd
        (
        "SELECT * " +
        "FROM Suppliers " +
        "WHERE SupplierID=" + Integer.toString(id)
        ) ;
      fournisseur.SetId   ( rst.getInt   ("SupplierID")   ) ;
      fournisseur.SetName ( rst.getString("CompanyName") ) ;
      fournisseur.SetPhone( rst.getString("Phone")       ) ;
      rst.close() ;
      }
    catch (SQLException eSQL) { ErrorSQL("myGetFournisseur", eSQL) ;      }
    catch (Exception e)       { ErrorDefault("myGetFournisseur", e) ;     }
    return fournisseur ;
    }

  /* Liste des fournisseurs
  ---------------------------------------------------------------------------*/
  private CFournisseurs myGetFournisseurs()
    {
    CFournisseurs fournisseurs = new CFournisseurs() ;
    try
      {
      ResultSet rst = ExecuteCmd("SELECT ShipperID FROM Shippers") ;
      while (!rst.isAfterLast())
        {
        fournisseurs.add(myGetFournisseur(rst.getInt("ShipperID"))) ;
        rst.next() ;
        }
      rst.close() ;
      }
    catch (SQLException eSQL) { ErrorSQL("myGetFournisseurs", eSQL) ;      }
    catch (Exception e)       { ErrorDefault("myGetFournisseurs", e) ;     }
    return fournisseurs ;
    }

  /* Selection d'un produit en fonctionde son id
  ---------------------------------------------------------------------------*/
  private CProduit myGetProduit(int id)
    {
    CProduit produit = new CProduit() ;
    try
      {
      ResultSet rst = ExecuteCmd
        (
        "SELECT * " +
        "FROM Products " +
        "WHERE ProductID=" + Integer.toString(id)
        ) ;
      produit.SetID             ( rst.getInt      ("ProductID")             ) ;
      produit.SetName           ( rst.getString   ("ProductName")           ) ;
      produit.SetDiscontinued   ( rst.getBoolean  ("Discontinued")          ) ;
      produit.SetQuantityPerUnit( rst.getString   ("QuantityPerUnit")       ) ;
      produit.SetReorderLevel   ( rst.getInt      ("ReorderLevel")          ) ;
      produit.SetUnitPrice      ( rst.getInt      ("UnitPrice")             ) ;
      produit.SetUnitsInStock   ( rst.getInt      ("UnitsInStock")          ) ;
      produit.SetUnitsOnOrder   ( rst.getInt      ("UnitsOnOrder")          ) ;
      produit.SetCategorie      ( myGetCategorie  (rst.getInt("CategoryID"))) ;
      produit.SetFournisseur    ( myGetFournisseur(rst.getInt("SupplierID"))) ;
      rst.close() ;
      }
    catch (SQLException eSQL) { ErrorSQL("myGetProduits", eSQL) ;      }
    catch (Exception e)       { ErrorDefault("myGetProduits", e) ;     }
    return produit ;
    }

  /* Liste des produits
  ---------------------------------------------------------------------------*/
  private CProduits myGetProduits()
    {
    CProduits produits = new CProduits() ;
    CProduit prd = null ;
    try
      {
      ResultSet rst = ExecuteCmd("SELECT ProductID FROM Products") ;
      while (!rst.isAfterLast())
        {
        prd = myGetProduit(rst.getInt("ProductID")) ;
        produits.add(prd) ;
        System.err.println("Ajout du produit: " + prd.GetID() + " " + prd.toString()) ;
        rst.next() ;

        }
      rst.close() ;
      }
    catch (SQLException eSQL) { ErrorSQL("myGetFournisseurs", eSQL) ;      }
    catch (Exception e)       { ErrorDefault("myGetFournisseurs", e) ;     }
    return produits ;

    }

  /* Execution de la commande
  ---------------------------------------------------------------------------*/
  private ResultSet ExecuteCmd(String cmd)
    {
    ResultSet rst = null ;
    try
      {
      Statement stm = myCon.createStatement
        (
        ResultSet.TYPE_SCROLL_INSENSITIVE ,
        ResultSet.CONCUR_READ_ONLY
        );
      rst = stm.executeQuery(cmd) ;
      rst.first() ;
      }
    catch (SQLException eSQL) { ErrorSQL("ExecuteCmd", eSQL) ;   }
    catch (Exception e)       { ErrorDefault("ExecuteCmd", e) ;  }
    return rst ;
    } // fin de ExecutCmd

  /* Gestion des erreurs SQL
  ---------------------------------------------------------------------------*/
  private void ErrorSQL(String fct, SQLException e)
    {
    System.err.println() ;
    System.err.println("-------------------------------------------------") ;
    System.err.println("Erreur 'SQL' dans " + fct + ": ") ;
    System.err.println("   " + e.getLocalizedMessage()) ;
    System.err.println("   " + e.getMessage()) ;
    System.err.println("   " + e.getSQLState()) ;
    System.err.println("   " + e.toString()) ;
    if (e.getNextException() != null)
      ErrorSQL(fct, e.getNextException()) ;
    }

  /* Gestion des erreurs class not found
  ---------------------------------------------------------------------------*/
  private void ErrorClassNotFound(String fct, ClassNotFoundException e)
    {
    String str = "" ;
    str = str + "Erreur 'ClassNotFound' dans " + fct + ": " ;
    str = str + e.getLocalizedMessage() + " / ";
    str = str + e.getMessage() + " / " ;
    str = str + e.toString() ;
    System.err.println(str) ;
    }

  /* Gestion des erreurs générique
  ---------------------------------------------------------------------------*/
  private void ErrorDefault(String fct, Exception e)
    {
    String str = "" ;
    str = str + "Erreur indéfinie dans " + fct + ": " ;
    str = str + e.getLocalizedMessage()  + " / ";
    str = str + e.getMessage() + " / " ;
    str = str + e.toString() ;
    System.err.println(str) ;
    }


  } // Fin de CDataBase

