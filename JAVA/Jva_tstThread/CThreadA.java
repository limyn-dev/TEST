package tstThread;

public class CThreadA implements Runnable
  {

  public Thread t ;

  // Construction de la classe
  public CThreadA(String nom)
    {
    Nom = nom ;
    t = new Thread(this, nom) ;
    }

  // Définition de la methode run
  public void run()
    {
    for (int i=0; i<5; i++)
      {
      System.out.println(t.currentThread().toString() + ": " + Nom + " [" + i + "]");
      try
        {
        t.sleep(1000);
        }
      catch(InterruptedException e)
        {
        }
      }
    }

  private String Nom ;


  }