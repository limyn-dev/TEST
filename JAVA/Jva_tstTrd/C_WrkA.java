package tstTrd;

import java.lang.* ;

public class C_WrkA implements Runnable
  {

  public void run()
    {

    for (int i=1; i<10000; i++)
      {
      System.out.println ("Je suis le gentil processus A");
      }

    }

  }