package alea;

import java.lang.Number.* ;
import java.lang.Math.* ;

/**
 * Title:       Ex1
 * Description:
 * Copyright:    Copyright (c) 2002
 * Company:
 * @author:     Yves Delay
 * @version 1.0
 */

public class CAlea
  {

  public CAlea(int taille, int limite)
    { Sze=taille; Lim = limite; setTbl(); }

  public int getVal(int n)
    { return Tbl[n].intValue ;  }

  public int[] getVals()
    {
    int[] tbl = new int[Sze] ;

    for ( int val=0; val<Sze; val++)
      tbl[val] = Tbl[val].intValue() ;

    return tbl ;
    }

  public int[] getHisto()
    {
    int[] ocu = new int[Lim+1] ;

    for (int val=0; val<=Sze; val++)
      ocu[Tbl[val].intValue()]++ ;

    return ocu ;
    }

  //---------------------------------------------------------------------------
  private setTbl()
    {

    // Création de la table
    Tbl = new Integer[Sze] ;

    // Initialisation des valeurs
    for (int val=0; val<Sze; val++)
      Tbl[val] = new Integer((int)(random()*Lim)) ;
    }

  private Integer[] Tbl ;
  private int       Sze ;
  Private int       Lim ;
  }