
//Titre :        Test de tread
//Version :
//Copyright :    Copyright (c) 1999
//Auteur :       Yves Delay
//Société :      _
//Description :  Programme de test de tread

package tstTrd;

import java.lang.* ;

public class Test
  {

  public static void main(String[] args)
    {

    // Instanciation des runnable
    C_WrkA wrkA = new C_WrkA() ;
    C_WrkB wrkB = new C_WrkB() ;

    // Création des threads
    Thread trdA = new Thread(wrkA) ;
    Thread trdB = new Thread(wrkB) ;

    // Execution des threads
    trdA.start ();
    trdA.wait (1000);
    //trdB.start ();

    }

  private boolean invokedStandalone = false;

  }