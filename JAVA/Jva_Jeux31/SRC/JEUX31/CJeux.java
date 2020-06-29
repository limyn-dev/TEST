package jeux31;

/**
 * Title:        Jeux du 31
 * Description:
 * Copyright:    Copyright (c) 2002
 * Company:      _
 * @author Yves Delay
 * @version 1.0
 */

public class CJeux
  {

  static final GAGNE=1 ;
  static final PERDU=-1 ;

  public CJeux() {}

  public static void main(String[] args)
    {
    CJeux CJeux1 = new CJeux();
    }



  /***************************************************************************/


   /*---- Test des coups succesifs -------------------------------------------*/
   private int TesterNxt(int sme, int val)
      {
      if (somme > 31)
         return GAGNE ;
      else
         {
         for (int nxt = 1; nxt < 7; nxt++)
            if (valide(val, nxt))
               {
               val = jeux(somme + nxt, nxt);
               if (val == PERDU)
                  {
                  return nxt;
                  }
               else if
                  {
                  }
               else
                  {
                  }
               }
          }
      }

    /*---- Validation du coups ----------------------------------------------*/
    private boolean Valider(int val, int nxt)
    {
    boolean ok=false ;

    switch(val)
      {
      case 1:
      case 6:
        if (nxt == 2 || nxt == 5 || nxt == 3 || nxt == 4 )
          res = true ;
        break ;
      case 2:
      case 5:
        if (nxt == 1 || nxt == 6 || nxt == 3 || nxt == 4 )
          res = true ;
        break ;
      case 3:
      case 4:
        if (nxt == 1 || nxt == 6 || nxt == 2 || nxt == 5 )
          res = true ;
      }

    return res ;
     }
// Fin de la validation d'un coups

  } // Fin de la class
