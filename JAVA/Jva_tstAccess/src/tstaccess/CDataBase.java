package tstaccess;

/**
 * Title:        Test de connexion sur db access
 * Description:
 * Copyright:    Copyright (c) 2000
 * Company:      _
 * @author Yves Delay
 * @version 1.0
 */

import java.sql.* ;

public class CDataBase
  {

  private Connection myCon ;
  private Statement  myStm ;
  private ResultSet  myRst ;
  private String     myCmd ;

  public CDataBase(String nomMdb)  {}



  /***************************************************************************/


  /* Ouverture de la db
  ---------------------------------------------------------------------------*/
  private myOpen(String DSN)
    {

    // Chargement du gestionnaire de connexion
    try
      { Class.forName("sun.jdbc.odbc.JdbcOdbcDriver") ;  }
    catch (ClassNotFoundException e)
      {}
    catch (Exception e)
      {}

    // Ouverture de la connexion
    try
      { myCon = DriverManager.getConnection("jdbc:odbc:"+DSN) ; }
    catch (SQLException eSQL)
      {}
    catch (Exception e)
      {}

    // Création du statement
    try
      { myStm = Con.createStatement();  }
    catch (SQLException eSQL)
      {}
    catch (Exception e)
      {}
    } // fin de myOpen

  /* Création de commandes select
  ---------------------------------------------------------------------------*/
  private void mySelect(String clauseSelect, String clauseFrom)
    {
    myCmd = "SELECT " + clauseSelect + " " +
          "FROM "   + clauseFrom ;
    ExecuteCmd() ;
    }
  private void mySelect(String clauseSelect, String clauseFrom, String clauseWhere)
    {
    myCmd = "SELECT " + clauseSelect + " " +
          "FROM "   + clauseFrom   + " " +
          "WHERE "  + clauseWhere ;
    ExecuteCmd() ;
    }

  /* Execution de la commande
  ---------------------------------------------------------------------------*/
  private void ExecuteCmd()
    {

    // Reset du resultSet
    try
      { myRst.close(); }
    catch (SQLException eSQL)
      {}
    catch (Exception e)
      {}

    // Création du resultSet
    try
      { Rst = Stm.executeQuery(Cmd) ; }
    catch (SQLException eSQL)
      {}
    catch (Exception e)
      {}

    } // fin de ExecutCmd

  } // Fin de CDataBase

