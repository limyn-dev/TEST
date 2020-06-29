package tstcomposant;

import java.awt.Button;
import java.awt.event.*;

/**
 * Title:        Test de composant
 * Description:
 * Copyright:    Copyright (c) 2002
 * Company:      _
 * @author Yves Delay
 * @version 1.0
 */

public class CBtn extends Button
  implements java.awt.event.ActionListener
  {

  public CBtn()
    {
    super() ;
    //this.enableEvents(ACTION_EVENT_MASK) ;
    }

  // Implementation des interfaces
  public void actionPerformed(ActionEvent ae)
    {
    System.out.print("C'est le boutton") ;
    }

  }