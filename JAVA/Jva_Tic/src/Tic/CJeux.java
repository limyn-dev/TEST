package Tic;

import java.lang.Math.*;

/**
 * Title:        Tic
 * Description:  Valeurs du jeux
 * Copyright:    Copyright (c) 2002
 * Company:
 * @author Yves Delay
 * @version 1.0
 */

public class CJeux
  {

  /*----- Membres -----------------------------------------------------------*/
  private int   Plr ; // Index du joueur courant
  private int   Sze ; // Taille de la grille
  private int   Dg1 ; // valeurs de la première diagonale
  private int   Dg2 ; // Valeur de la deuxième diagonale
  private int[] Lns ; // Valeurs des lignes
  private int[] Cls ; // Valeurs des colonnes
  private boolean Fin ; // Flag de fin de jeux

  /*----- Création de l'instance --------------------------------------------*/
  public CJeux(int sze)                 {  newIst(sze);  }

  /*----- Jeux d'un coups ---------------------------------------------------*/
  public String Jouer(int lne, int col) { return NxtCps(lne, col) ;  }

  /*----- Check de la fin du jeux -------------------------------------------*/
  public boolean IsEnd()                { return Fin ;}



  /***************************************************************************/



  /*----- Création de l'instance --------------------------------------------*/
  private void newIst(int sze)
    {

    // Initialisation du flag de fin de jeux
    Fin = false ;

    // Initalisation de la taille de la grille
    Sze = sze ;

    // Initialisation des valeurs des diagonales
    Dg1 = 0 ;
    Dg2 = 0 ;

    // Initialisation des valeurs des lignes
    Lns = new int[sze] ;
    for (int l=0; l<sze;l++)
      Lns[l] = 0 ;

    // Initialisation des valeurs des colonnes
    Cls = new int[sze] ;
    for (int c=0; c<sze;c++)
      Cls[c] = 0 ;

    }

  /*----- Jeux d'un coups ---------------------------------------------------*/
  private String NxtCps(int lne, int col)
    {
    String str ;

    if (Fin)
      str = new String("FINI") ;

    else
      {

      // Click du joueur 0
      if (Plr==0)
        {
        this.Lns[lne]++ ;             // Modification de la valeur de la ligne
        this.Cls[col]++ ;             // Modification de la valeur de la colonne
        if (lne == col) Dg1++ ;       // Modification de la valeur de la diagonale 1
        if (lne+col == Sze-1) Dg2++ ; // Modification de la valeur de la diagonale 2
        this.Plr = 1 ;                // Changement de joueur
        str = new String("X") ;       // Valorisation du label
        }

      // Click du joueur 1
      else
        {
        this.Lns[lne]-- ;             // Modification de la valeur de la ligne
        this.Cls[col]-- ;             // Modification de la valeur de la colonne
        if (lne == col) Dg1-- ;       // Modification de la valeur de la diagonale 1
        if (lne+col == Sze-1) Dg2-- ; // Modification de la valeur de la diagonale 2
        this.Plr = 0 ;                // Changement de joueur
        str = new String("O") ;       // Valorisation du label
        }

      // Contrôl des diagonales
      if (java.lang.Math.abs(Dg1) == Sze)
        Fin = true ;
      else if (java.lang.Math.abs(Dg2) == Sze)
        Fin = true ;

      // Contrôle des lignes
      int l=-1 ;
      while (!Fin && ++l<Sze)
        if (java.lang.Math.abs(Lns[l]) == Sze)
          Fin = true ;

      // Contrôle des colonnes
      int c=-1 ;
      while (!Fin && ++c<Sze)
        if (java.lang.Math.abs(Cls[c]) == Sze)
          Fin = true ;

      }

    return str ;
    } // Fin du jeux d'un coup



  } // Fin de la class

