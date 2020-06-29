package tstlistener;

import java.awt.*;
import java.awt.event.* ;
import java.awt.Frame.*;

/**
 * Title:        Test des ecouteurs d^�venement
 * Description:  Dans cette version, l'�couteur d'�venement du click du boutton
 *               est une class interne du boutton. Les ecouteur des �venements
 *               de la souris sont dirrectement impl�ment� dans la class boutton
 * Copyright:    Copyright (c) 2000
 * Company:      _
 * @author yves Delay
 * @version 1.0
 */

public class CBtn extends Button
  implements MouseListener, MouseMotionListener
  {

  /*---- Construction de l'instance -----------------------------------------*/
  public CBtn(String avant, String apres) { super("") ;  newIst() ;   }

  /*---- Impl�mentation des interfaces --------------------------------------*/
  public void mouseClicked  (MouseEvent me) { setLabel("mouseClicked") ;   }
  public void mouseEntered  (MouseEvent me) { setLabel("mouseEntered") ;   }
  public void mouseExited   (MouseEvent me) { setLabel("mouseExited") ;    }
  public void mousePressed  (MouseEvent me) { setLabel("mousePressed") ;   }
  public void mouseReleased (MouseEvent me) { setLabel("mouseReleased") ;  }
  public void mouseDragged  (MouseEvent me) { setLabel("mouseDragged") ;   }
  public void mouseMoved    (MouseEvent me) { setLabel("mouseMoved") ;     }

  /*---- Class interne pour la d�finition de l'�couteur d'action -----------*/
  private class CMyAction
    implements ActionListener
    {
    public void CMyAction() {}

    /*---- Impl�mentation des interfaces ------------------------------------*/
    public void actionPerformed(ActionEvent ae) { setLabel(ae.getActionCommand());  }

    }



  /**************************************************************************/



  /*---- Cr�ation de l'instance --------------------------------------------*/
  private void newIst()
    {

    // Assignation des �couteurs
    this.addActionListener(new CMyAction()) ; // Pression sur le boutton
    this.addMouseListener(this) ;             // Click de souris
    this.addMouseMotionListener(this) ;       // D�placement de la souris

    }

  }