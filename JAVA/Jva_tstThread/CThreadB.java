package tstThread;

public class CThreadB implements Runnable
  {

  CThreadB(String nom)
    {
    Nom = nom ;
    }

 public void run()
    {
    for (int i=0; i<5; i++)
      {
      System.out.println(Thread.currentThread().toString() + ": " + Nom + " [" + i + "]");
      try
        {
        Thread.currentThread().sleep(1000);
        }
      catch(InterruptedException e)
        {
        }
      }
    }


  private String Nom ;
  }