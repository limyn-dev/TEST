package ecole;

import ecole.* ;

/**
 * Title:        Ex2
 * Description:  Main
 * Copyright:    Copyright (c) 2002
 * Company:
 * @author :     Yves Delay
 * @version 1.0
 */

public class test
  {

  public static void main(String[] args)
    {
    double masseSalarial = 0.0;
    double moyenne = 0.0;
    double freqMoy = 0;
    int anneeActuel = 2002;
    int anneeNote = 1996;
    int nbrEtudiantR = 0;
    int nbrEtudiantUniRef = 0;
    String uniRef = "Quebec";

    // Création de la table des etudiants
    CPersonne[] tbl = new CPersonne[8];
    tbl[0] = new CSecraitaire("Dupuis",    1990, "Science",  65000);
    tbl[1] = new CEnseignant ("Durand",    1995, "Science",  93000, "Math");
    tbl[2] = new CEtudiantE  ("Totor",     1997, "Math Sup", "Quebec");
    tbl[3] = new CEtudiantR  ("LaGaffe",   1996, "Physique", 4.5);
    tbl[4] = new CEtudiantE  ("DesChamps", 1997, "Chimie",   "Quebec");
    tbl[5] = new CEtudiantR  ("LaPlanta",  1996, "Physique", 5.2);
    tbl[6] = new CEtudiantE  ("LeTendre",  1997, "Physique", "Quebec");
    tbl[7] = new CEtudiantR  ("LaFleur",   1996, "Physique", 3.5);


    for(int i=0; i<tbl.length; i++ )
      {

      // Calcul de la masse salariale
      if (tbl[i] instanceof CPersonel)
        masseSalarial += ((CPersonel)tbl[i]).getSalaire();

      // Calcul de la fréquence moyenne
      freqMoy += anneeActuel - tbl[i].getAnneeEntree();

      // Calcul de la moyenne des notes et du nombre d'etudiant R
      if (tbl[i] instanceof CEtudiantR)
        if (tbl[i].getAnneeEntree() == anneeNote)
          {
          moyenne += ((CEtudiantR)tbl[i]).getNote();
          nbrEtudiantR ++;
          }

      // Calcul du nombre d'etudiant de l'uni de ref
      if (tbl[i] instanceof CEtudiantE)
        if (((CEtudiantE)tbl[i]).getUniversite() == uniRef)
          nbrEtudiantUniRef++;

      }

      //System.out.println("Il y a "+CPersonne.nbr+" personne dans l'etablissement");
      //System.out.println("dont "+CEtudiant.nbr+" etudiant et "+CPersonne.nbr+" collaborateurs");
      System.out.println("masse salariale: "+masseSalarial);
      System.out.println("moyenne de la frequantation: "+(freqMoy/(tbl.length-1)));
      System.out.println("Moyenne des Etudiant de "+anneeNote+": "+(moyenne/nbrEtudiantR));
      System.out.println("Nbr. d'etudiant de l'uni de "+uniRef+ ": "+nbrEtudiantUniRef);

      System.out.println("info: sur "+tbl[1]);
      System.out.println("info: sur "+tbl[3]);

    } // Fin du main

  } // Fin de la classe
