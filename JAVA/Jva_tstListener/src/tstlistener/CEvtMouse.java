package tstlistener;

import java.awt.* ;
import java.awt.event.* ;

/**
 * Title:        Test des ecouteurs d^�venement
 * Description:  Cr�ation d'un ecouteur d'�venement de la souris par impl�mentation
 *               des interfaces. Cette class demande un TextField pour l'affichage
 *               des messages.
 * Copyright  :  Copyright (c) 2000
 * Company:      _
 * @author yves Delay
 * @version 1.0
 */

public class CEvtMouse
  implements MouseListener, MouseMotionListener
  {

  /*--- Membres -------------------------------------------------------------*/
  TextField Txt ; // R�ferance sur le champs d'affichage des messages

  /*---- Cr�ation de l'instance ---------------------------------------------*/
  public CEvtMouse(TextField txt)  {  Txt = txt ; }

  /*---- Impl�mentation des interfaces --------------------------------------*/
  public void mouseClicked  (MouseEvent me) { Txt.setText("mouseClicked") ;   }
  public void mouseEntered  (MouseEvent me) { Txt.setText("mouseEntered") ;   }
  public void mouseExited   (MouseEvent me) { Txt.setText("mouseExited") ;    }
  public void mousePressed  (MouseEvent me) { Txt.setText("mousePressed") ;   }
  public void mouseReleased (MouseEvent me) { Txt.setText("mouseReleased") ;  }
  public void mouseDragged  (MouseEvent me) { Txt.setText("mouseDragged") ;   }
  public void mouseMoved    (MouseEvent me) { Txt.setText("mouseMoved") ;     }

  } // Fin de la class