package gestfav;

import ficini.*;
import java.io.*;
import javax.swing.tree.*;



/******************************************************************************
 * Title      : Gestion des favorites
 * Description: Information d'un fichier *.url
 * Copyright  : Copyright (c) 2000
 * Company    : _
 * @author    : Yves Delay
 * @version   : 1.0
 *****************************************************************************/



public class CUrl extends DefaultMutableTreeNode
  {

  // Membre
  String myNomFic ; // Nom du fichier
  String myLien ;   // Lien
  String myInfo ;   // Info sur le lien

  // Construction de l'instance
  public CUrl(File fichier) { myInit(fichier) ;  }

  //Chargement des valeurs du fichier
  public LoadUrl()  { myLoadFic() ; }
  public SaveUrl()  {}



  /***************************************************************************/


  //---- Initialisation de la class -------------------------------------------
  private void myInit(File fic)
    {

    // Initialisation des membres
    myNomFic = fic.getAbsolutePath() ;
    myLien   = "pas de lien" ;
    myInfo   = "Fichier pas chargé" ;

    } // Fin de l'initialisation de la class

  //---- Lecture du fichier ---------------------------------------------------
  private void myGetFic()
    {
    File fic = new File(myNomFic) ;
    CFicIni ficIni = new CFicIni(fic) ;

    // Parcourt des données du fichier url pour extraire les infos
    for (int d=0; d<ficIni.getDataCount; d++)
      {
      CData dtaIni = ficIni.getDataItem(d) ;
      if (nom=="url" || nom=="URL")
	myLien = dtaIni.getValeur() ;
      else if (nom=="Descrip")
	myInfo = dtaIni.getValeur() ;
      } // Fin du parcourt des données du fichier

    } // Fin de myGetFic



  } // Fin de la class