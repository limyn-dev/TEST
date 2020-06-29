
//Titre :        TstWnd
//Version :      
//Copyright :    Copyright (c) 1999
//Auteur :       Yves Delay
//Société :      _
//Description :  Test de fenêtre

package tstWnd;

import java.awt.*;
import java.awt.event.*;

public class Dialogue extends Dialog
  {
  Panel panel1 = new Panel();
  BorderLayout borderLayout1 = new BorderLayout();

  public Dialogue(Frame frame, String title, boolean modal)
    {
    super(frame, title, modal);
    enableEvents(AWTEvent.WINDOW_EVENT_MASK);
    try
      {
      jbInit();
      add(panel1);
      pack();
      }
    catch(Exception ex)
      {
      ex.printStackTrace();
      }
    }

  public Dialogue(Frame frame)
    {
    this(frame, "", false);
    }

  public Dialogue(Frame frame, boolean modal)
    {
    this(frame, "", modal);
    }

  public Dialogue(Frame frame, String title)
    {
    this(frame, title, false);
    }

  void jbInit() throws Exception
    {
    panel1.setLayout(borderLayout1);
    }

  protected void processWindowEvent(WindowEvent e)
    {
    if(e.getID() == WindowEvent.WINDOW_CLOSING)
      {
      cancel();
      }
    super.processWindowEvent(e);
    }

  void cancel()
    {
    dispose();
    }

  }