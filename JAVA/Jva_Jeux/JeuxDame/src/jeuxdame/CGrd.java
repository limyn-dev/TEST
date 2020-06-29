package jeuxdame;

/**
 * Title:
 * Description: Grille de jeux
 * Copyright  : Copyright (c) 2000
 * Company    :
 * @author    : Yves Delay
 * @version 1.0
 */

public class CGrd
  {

  //---- Constantes de class --------------------------------------------------
  public final static int NO_PCE = -1 ;  // Code de la cellue vide

  //---- Membres --------------------------------------------------------------
  private int myNbL ;
  private int myNbC ;
  private int[][] myGrid ; // Grille de jeux

  //---- Construction de la grille --------------------------------------------
  public CGrd(int nbrLne, int nbrCol)               { myInit(nbrLne, nbrCol) ;  }

  //---- Valeur des cellules --------------------------------------------------
  public int GetNbL()                               { return myNbL ;  }
  public int GetNbC()                               { return myNbC ;  }

  //---- Valeur des cellules --------------------------------------------------
  public void SetCel(int lne, int col, int numPce)  { myGrid[lne][col] = numPce;  }
  public int  GetCel(int lne, int col)              { return myGrid[lne][col] ;   }



  /***************************************************************************/



  //---- Initialisation de la grille ------------------------------------------
  private void myInit(int nbL, int nbC)
    {

    // Initalisation de la taile de la grille
    myNbL = nbL ;
    myNbC = nbC ;

    // Création de la grille
    myGrid = new int[nbL][nbC] ;

    // Initialisation des cellules
    for (int l=0; l<nbL; l++)
      for (int c=0; c<nbC; c++)
	myGrid[l][c] = NO_PCE ;

    }  // Fin de myInit

  }