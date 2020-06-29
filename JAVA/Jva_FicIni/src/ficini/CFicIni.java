package ficini;



import java.io.* ;



/**
 * Title:        Lecture des fichiers INI
 * Description:
 * Copyright:    Copyright (c) 2000
 * Company:      _
 * @author Yves Delay
 * @version 1.0
 */

public class CFicIni
  {

  // Code de retour des fonctions
  public static int CDE_NO_ERROR = 0 ;
  public static int CDE_NO_FILE  = -1 ;

  //---- Membres --------------------------------------------------------------
  String myNameFile ;
  CData  myLstDta[] ;
  int    myNbrDta   ;

  //---- Constructeur ---------------------------------------------------------
  public CFicIni(File fichier)         { myInit(fichier) ;                     }

  //---- Acc�s au fichier -----------------------------------------------------
  public void LoadFileIni()            {  myLoadFile() ;                       }
  public void SaveFileIni()            {  mySaveFile() ;                       }

  //---- Acc�s au donn�es -----------------------------------------------------
  public CData[] getDataList ()        {  return myLstDta ;                    }
  public int     getDataCount()        {  return myNbrDta ;                    }
  public String  getDataValue(String section, String nom)
				       {  return myGetDataValue(section, nom) ;}



  /***************************************************************************/



  //---- Initialisation -------------------------------------------------------
  private void myInit(File fichier)
    {
    myNameFile = fichier.getAbsolutePath() ;
    myLstDta = null ;
    myNbrDta = 0 ;
    }

  //---- Lecture du fichier ---------------------------------------------------
  private int myLoadFile()
    {
    int            cdeRet            = CDE_NO_ERROR ;
    BufferedReader myBufferedReader  = null ;
    String         lne               = "" ;
    String         section           = "" ;
    boolean        readOk            = true ;

    // Ouverture du fichier
    try
      {
      FileReader myFileReader = new FileReader(myNameFile) ;
      myBufferedReader = new BufferedReader(myFileReader);
      cdeRet = CDE_NO_ERROR;
      }
    catch (FileNotFoundException e)
      {
      cdeRet = CDE_NO_FILE ;
      }

    // Traitement du fichier
    if (cdeRet == CDE_NO_ERROR)
      {

      // Parcourt des lignes du fichier
      while(readOk)
        {

	// Lecture de la ligne du fichier ini
	try
	  { lne=myBufferedReader.readLine() ; }
	catch (IOException e)
	  { lne = null ; }

	// Traitement de la ligne
	if (lne != null && lne.length()>0)
	  {
          lne = lne.trim() ;
          if (lne.charAt(0)== '[')
	    section = lne.substring(1, lne.length()-1) ;
          else
	    addDta(section, lne) ;
	  }
	else
	  {
	  readOk = false ;
	  }

        } // Fin du parcourt des lignes di fichier

      	// Fermeture du fichier
	try
	  { myBufferedReader.close() ;  }
	catch (IOException e)
	  {}

      } // Fin du traitement du fichier

    // Code de retour
    return cdeRet ;
    } // Fin de myReadFic

  //---- Ecriture du fichier --------------------------------------------------
  public int mySaveFile()
    {
    return 0 ;
    }
  //---- Ajout d'une donn�e � la liste ----------------------------------------
  private void addDta(String section, String lneIni)
    {

    // Cr�ation de la nouvelle liste des donn�es
    CData newLstDta[] = new CData[myNbrDta+1] ;

    //copies des donn�es existantes
    for (int d=0; d<myNbrDta; d++)
      newLstDta[d] = myLstDta[d] ;

    // Cr�ation de la nouvelle donn�e
    newLstDta[myNbrDta] = new CData(section, lneIni) ;

    // Mise � jour des membres
    myLstDta = newLstDta ;
    myNbrDta++ ;

    } // Fin de addData

  //---- Acc�s � une valeur d'une des donn�es ---------------------------------
  private String myGetDataValue(String section, String nom)
    {
    String s ;      // Section de la donn�e
    String n ;      // Nom de la donn�e
    String v = "" ; // Valeur de la donn�e
    int    d = 0  ; // Index de la donn�e

    // Parcourt des donn�e
    while (d++<myNbrDta && v.compareTo("")!=0)
      {
      s = myLstDta[d].getSection() ;
      n = myLstDta[d].getNom() ;
      if (s.compareTo(section)==0 && n.compareTo(nom)==0)
	v = myLstDta[d].getValeur()  ;
      }

    // Contr�le de la validit� de la valeur
    if (v.compareTo("")==0)
      v = "pas de correspondance pour section:" + section + " ,nom:" + nom ;

    return v ;
    } // Fin de l'acc�s � une des valeur



  } // Fin de la class