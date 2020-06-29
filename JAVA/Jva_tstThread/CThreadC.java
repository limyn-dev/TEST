package tstThread;

public class CThreadC extends Thread
  {

  public CThreadC(String nom)
    {
    Nom = nom ;
    this.start() ;
    }

 public void run()
    {
    for (int i=0; i<5; i++)
      {
      System.out.println(this.toString() + ": " + Nom + " [" + i + "]");
      try
        {
        this.sleep(1000);
        }
      catch(InterruptedException e)
        {
        }
      }
    }


  private String Nom ;

  }