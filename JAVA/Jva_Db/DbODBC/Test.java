
//Titre :        Connexion sur des DB ODBC
//Version :
//Copyright :    Copyright (c) 1999
//Auteur :       Yves Delay
//Soci�t� :      _
//Description :  Votre description
package DB.DbODBC;

public class Test
  {

  public static void main(String[] args)
    {

    // Ouverture de la DB
    CDSN db = new CDSN("jdb0") ;

    // Execution de la requ�te
    db.CommandeSelect ("*", "tblA", "");

    // Execution de la seconde commande
    db.CommandeSelect ("Nom", "tblA", "");

    }

  }