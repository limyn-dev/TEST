package tstsrb;

import java.io.* ;

/**
 * Title:
 * Description:
 * Copyright:    Copyright (c) 2002
 * Company:
 * @author
 * @version 1.0
 */

public class CDts
  {

  /*---- Membres ------------------------------------------------------------*/
  private CDta[] LstDta ;
  private int    NbrDta ;
  private String NomFic ;

  /*---- Création de la class -----------------------------------------------*/
  public CDts(String nomFic)  { newIst(nomFic) ;  }
  public Ajouter(CDta dta)    { addDta(dta) ;     }



  /***************************************************************************/



  /*---- Ecriture du fichier ------------------------------------------------*/
  private Write(String nomFic)
    {

    // Création du flux
    FileOutputStream out = new FileOutputStream(NomFic)
    ObjectOutputStream ficOut = new ObjectOutputStream(out) ;

    // Ecriture du nombre de données
    ficOut.writeint (NbrDta) ;

    // Ecriture des données
    for (int n=0; n<NbrDta; n++)
        ficOut.writeObject(LstDta[n]) ;

    // flush du flux
    ficOut.flush() ;

    // Fermeture du flux
    out.close() ;

    }

  /*---- Lecture du fichier -------------------------------------------------*/
  private Read()
    {

    // Création du flux
    FileInputStream in = new FileInputStream(NomFic) ;
    ObjectInputStream ficIn = new ObjectInputStream(in) ;

    // Lecture du nombre de données
    NbrDta = ficIn.readInt() ;

    // Lecture des données
    for (int n=0; n<NbrDta; n++)
      LstDta[n] = ficIn.readObject() ;

    // flush du flux
    ficIn.flush() ;

    // Fermeture du flux
    in.close() ;

    }

  /*---- Création de l'instance ---------------------------------------------*/
  private newIst(String nomFic)
    {

    // Initialisation des membres
    NomFic = new String(nomFic) ;
    NbrDta = 0 ;

    }

  /*---- Ajout d'une donnée dans la liste -----------------------------------*/
  private addDta(CDta dta)
    {

    // Création de la nouvelle liste de donnée
    CDta newLst = new CDta[NbrDta+1] ;

    // Copie des données
    for (int d=0; d<NbrDta; d++)
      newLst[d] = LstDta[d] ;

    // Ajout de la donnée supplémentaire
    newLst[NbrDta] = dta ;

    // Mise à jour des valeurs de la class
    NbrDta++ ;
    LstDta = newLst ;

    }


}