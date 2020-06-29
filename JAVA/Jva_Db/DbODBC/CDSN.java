package DB.DbODBC;

import java.sql.* ;
import CsoIO.CsoIO ;

public class CDSN
  {



  /*---------------------------------------------------------------------------
    Initialisation de la classe. Ouverture de la connexion, création du  statment
  =============================================================================
    In :  DSN -> Nom de la source de donnée du pilote ODBC
    Out:  Membre initialisés
  ---------------------------------------------------------------------------*/
  public CDSN(String DSN)
    {

    // Création des flux de la console
    CsoIO cso = new CsoIO() ;

    // Chargement du driver
    try
      { Class.forName("sun.jdbc.odbc.JdbcOdbcDriver") ;  }
    catch (ClassNotFoundException e)
      {}
    catch (Exception e)
      {}

    // Ouverture de la connexion
    try
      { Con = DriverManager.getConnection("jdbc:odbc:"+DSN) ; }
    catch (SQLException eSQL)
      { gstSQLEx(eSQL, "getConnection(\"jdbc:odbc:\"+DSN)") ;  }
    catch (Exception e)
      {}

    // Création du statement
    try
      { Stm = Con.createStatement();  }
    catch (SQLException eSQL)
      { gstSQLEx(eSQL, "Con.createStatement()") ;  }
    catch (Exception e)
      {}

    }



  /*---------------------------------------------------------------------------
    Execution d'une commande Select
  =============================================================================
    In :  commandeSQL -> Commande SQL
    Out:  Rst pointe sur les données selectionnée
  ---------------------------------------------------------------------------*/
  public void CommandeSelect(String clauseSelect, String clauseFrom)
    {
    Cmd = "SELECT " + clauseSelect + " " +
          "FROM "   + clauseFrom ;
    ExecuteCmd() ;
    }
  public void CommandeSelect(String clauseSelect, String clauseFrom, String clauseWhere)
    {
    Cmd = "SELECT " + clauseSelect + " " +
          "FROM "   + clauseFrom   + " " +
          "WHERE "  + clauseWhere ;
    ExecuteCmd() ;
    }



  //***************************************************************************
  private Connection Con ;
  private Statement  Stm ;
  private ResultSet  Rst ;
  private String     Cmd ;

  // Execution de la commande
  private void ExecuteCmd()
    {

    // Reset du resultSet
    try
      { Rst.close(); }
    catch (SQLException eSQL)
      { gstSQLEx(eSQL, "Rst.close()") ; }
    catch (Exception e)
      {}

    // Création du resultSet
    try
      { Rst = Stm.executeQuery(Cmd) ; }
    catch (SQLException eSQL)
      { gstSQLEx(eSQL, "Stm.executeQuery(cmd)") ;    }
    catch (Exception e)
      {}

    }

  // Gestion des exception SQL
  private void gstSQLEx(SQLException eSQL, String sender)
    {
    CsoIO cso = new CsoIO() ;

    cso.NewLne();
    cso.AfficherLn("SQLException dans " + sender) ;
    cso.AfficherLn("  Message  : " + eSQL.getMessage()) ;
    cso.AfficherLn("  SQLState : " + eSQL.getSQLState()) ;
    cso.AfficherLn("  ErrorCode: " + eSQL.getErrorCode()) ;

    cso.Valider   ("Fin de SQLException");

    }

  }