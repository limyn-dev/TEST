package ficini;

import java.lang.* ;

/**
 * Title       : Lecture des fichiers INI
 * Description :
 * Copyright   : Copyright (c) 2000
 * Company     : _
 * @author     : Yves Delay
 * @version    : 1.0
 */

public class CData
  {

  // Membres
  private String mySection ;  // Section de la donnée
  private String myNom ;      // Nom de la donnée
  private String myValeur ;   // Valeur de la données

  // Constructeurs
  public CData()
    {
    myInit() ;
    }
  public CData(String section, String ligneIni)
    {
    mySection = section ;
    myScanLigneIni(ligneIni) ;
    }
  public CData(String section, String nom, String valeur)
    {
    mySection = section ;
    myNom     = nom ;
    myValeur  = valeur ;
    }

  // Accesseurs
  public String getSection ()                 { return mySection ;    }
  public String getNom     ()                 { return myNom ;        }
  public String getValeur  ()                 { return myValeur ;     }
  public void   setSection (String section)   { mySection = section ; }
  public void   setNom     (String nom)       { myNom = nom ;         }
  public void   setValeur  (String valeur)    { myValeur = valeur ;   }



  /***************************************************************************/

  private void myInit()
    {
    mySection = "-" ;
    myNom     = "-" ;
    myValeur  = "-" ;
    }

  private void myScanLigneIni(String lne)
    {
    int finNom = lne.indexOf("=") ;
    try
      {
      myNom      = lne.substring(0, finNom).trim()  ;
      myValeur   = lne.substring(finNom+1).trim()  ;
      }
    catch (StringIndexOutOfBoundsException e)
      {
      myNom    = lne ;
      myValeur = "" ;
      }

    }

  } // Fin de la class