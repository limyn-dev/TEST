
//Titre :        TstWnd
//Version :      
//Copyright :    Copyright (c) 1999
//Auteur :       Yves Delay
//Société :      _
//Description :  Test de fenêtre
package tstWnd;

import java.awt.Frame ;

public class Test
  {

  public static void main(String[] args)
    {
    Frame frm = new Frame() ;
    Dialogue dlg = new Dialogue(frm) ;
    dlg.show ();

    }

  private boolean invokedStandalone = false;

  }