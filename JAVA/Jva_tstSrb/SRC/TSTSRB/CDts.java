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

  /*---- Cr�ation de la class -----------------------------------------------*/
  public CDts(String nomFic)  { newIst(nomFic) ;  }
  public Ajouter(CDta dta)    { addDta(dta) ;     }



  /***************************************************************************/



  /*---- Ecriture du fichier ------------------------------------------------*/
  private Write(String nomFic)
    {

    // Cr�ation du flux
    FileOutputStream out = new FileOutputStream(NomFic)
    ObjectOutputStream ficOut = new ObjectOutputStream(out) ;

    // Ecriture du nombre de donn�es
    ficOut.writeint (NbrDta) ;

    // Ecriture des donn�es
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

    // Cr�ation du flux
    FileInputStream in = new FileInputStream(NomFic) ;
    ObjectInputStream ficIn = new ObjectInputStream(in) ;

    // Lecture du nombre de donn�es
    NbrDta = ficIn.readInt() ;

    // Lecture des donn�es
    for (int n=0; n<NbrDta; n++)
      LstDta[n] = ficIn.readObject() ;

    // flush du flux
    ficIn.flush() ;

    // Fermeture du flux
    in.close() ;

    }

  /*---- Cr�ation de l'instance ---------------------------------------------*/
  private newIst(String nomFic)
    {

    // Initialisation des membres
    NomFic = new String(nomFic) ;
    NbrDta = 0 ;

    }

  /*---- Ajout d'une donn�e dans la liste -----------------------------------*/
  private addDta(CDta dta)
    {

    // Cr�ation de la nouvelle liste de donn�e
    CDta newLst = new CDta[NbrDta+1] ;

    // Copie des donn�es
    for (int d=0; d<NbrDta; d++)
      newLst[d] = LstDta[d] ;

    // Ajout de la donn�e suppl�mentaire
    newLst[NbrDta] = dta ;

    // Mise � jour des valeurs de la class
    NbrDta++ ;
    LstDta = newLst ;

    }


}