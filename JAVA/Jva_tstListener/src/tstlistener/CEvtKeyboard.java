package tstlistener ;

import java.awt.* ;
import java.awt.event.* ;

/**
 * Title:        Test des ecouteurs d^�venement
 * Description:  Dans cette version la class ecouteur est une extansion de la
 *               class KeyAdapter qui elle m�me impl�mente l'interface KeyListener.
 * Copyright:    Copyright (c) 2000
 * Company:      _
 * @author yves Delay
 * @version 1.0
 */

public class CEvtKeyboard extends KeyAdapter
  {

  /*---- Membres ------------------------------------------------------------*/
  private TextField Txt ; // R�ferance sur la zone d'affichage des message

  /*---- Construction de la classe ------------------------------------------*/
  public CEvtKeyboard(TextField txt) {  Txt = txt; }

  /*---- Sur d�finition des methodes utiles ---------------------------------*/
  public void keyPressed(KeyEvent ke) { Txt.setText("keyPressed: " + ke.getKeyChar()) ; }
  public void keyRelased(KeyEvent ke) { Txt.setText("keyRelased: " + ke.getKeyChar()) ; }
  public void keyTyped (KeyEvent ke)  { Txt.setText("keyTyped: " + ke.getKeyChar()) ;   }

  }