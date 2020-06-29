package tstcomposant;

import java.awt.Frame;

/**
 * Title:        Test d'utilisation de composants dans un applet
 * Description:
 * Copyright:    Copyright (c) 2000
 * Company:      _
 * @author Yves Delay
 * @version 1.0
 */

public class tst extends Frame
  {

  public tst()
    {
    }

  public static void main(String[] args)
    {
    CTstComposant ist = new CTstComposant() ;

    ist.setVisible(true) ;
    }
}