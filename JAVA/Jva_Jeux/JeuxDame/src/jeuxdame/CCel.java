package jeuxdame;

import java.awt.* ;
import java.awt.Panel;

/**
 * Title:
 * Description: C�lule graphique
 * Copyright  : Copyright (c) 2000
 * Company    :
 * @author    : Yves Delay
 * @version 1.0
 */

public class CCel extends Panel
  {

  //---- Constantes de class --------------------------------------------------
  public static final int CLRBLACK = 0 ;
  public static final int CLRWHITE = 1 ;
  public static final int CLR_NONE = -1 ;

  //---- Membres --------------------------------------------------------------
  private String  myLabel ;   // Label de la cellule
  private int     myClrBck ;  // Couleur de fond
  private int     myClrTop ;  // Couleur de dessus

  //---- Construction de l'instance -------------------------------------------
  public CCel(int clrBck)         { myInit(clrBck) ;                }

  //---- Mise � jour de la pi�ce de la cellule --------------------------------
  public void SetCel(CJeux jeux)  { mySetCel(jeux) ;                }

  //---- Mise � jour de l'affichage -------------------------------------------
  public void paint(Graphics g)   { myPaint(g) ;                     }



  /***************************************************************************/



  //---- Nouvelle cellule -----------------------------------------------------
  private void myInit(int clrBck)
    {

    // Initialisation du graphisme
    this.setLayout(new BorderLayout()) ;

    // Initalisation des membres
    myLabel = " "
    myClrBck = clrBck ;
    myClrTop = clrBck ;

    }

  //---- Mise � jour de l'affichage de la cellue ------------------------------
  private void myPaint(Graphics g)
    {

    // Taille de la cellule
    int h = this.getHeight() ;
    int w = this.getWidth() ;

    // Mise � jour de la couleur de fond
    if (myClrBck == CLRBLACK)
      this.setBackground(Color.gray) ;
    else
      this.setBackground(Color.lightGray) ;

    // Mise � jour de la couleur de dessus
    if (myClrTop == CLRBLACK)
      this.setForeground(Color.black ) ;
    else if (myClrTop == CLRWHITE)
      this.setForeground(Color.red ) ;
    else
      this.setForeground(this.getBackground()) ;

    // Dessins des carr�s
    g.drawRect(0, 0, w-1, h-1) ;

    // affichage du nom de la pi�ce
    g.drawString(myLabel,(w-30)/2 ,h/2+5) ;

    }

  //---- Mise � jour des valeurs de la cellule --------------------------------
  private void mySetCel(CJeux jeux)
    {
    int numPce = jeux.GetCel(myLne, myCol) ;

    // Cellule vide
    if (numPce==CGrd.NO_PCE )
      {
      myLabel = " " ;
      myClrTop = myClrBck ;
      }

    // Cellule occup�e
    else
      {
      CPce pce = jeux.GetPce(numPce)

      // Label de la pi�ce
      myLabel = pce.StrPiece() ;

      // Couleur de dessus
      if (pce.GetClr()==CPce.CLR_NR)
	myClrTop = CLRBLACK ;
      else
	myClrTop = CLRWITHE ;

      }

    } // Fin de mySetCel



  } // Fin de la class