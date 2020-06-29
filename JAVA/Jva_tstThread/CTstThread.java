package tstThread;

public class CTstThread
  {

  static void Dormir()
    {

    // Affichage du thread
    System.out.println("Blocage de " +
                        Thread.currentThread().toString() +
                        " pendant 10 secondes");

    // Blocage du thread pendant 10 scondes
    try
      {
      Thread.currentThread().sleep(10000);
      }
    catch(InterruptedException e)
      {
      System.out.print("Tread interrompu");
      }
    catch(Exception e)
      {
      System.out.println(e.toString()) ;
      }
    finally
      {
      }

    }

  public static void main(String[] args)
    {

    CThreadA ta = new CThreadA("Premier A") ;
    ta.t.start();

    CThreadB b  = new CThreadB("Duexieme B") ;
    Thread tb = new Thread(b,"Duexieme B") ;
    tb.start();

    CThreadC tc = new CThreadC("Troixieme C") ;

    // Attente de la fin de l'execution des threads
    try
      {
      ta.t.join ();
      tb.join() ;
      tc.join() ;
      }
    catch(InterruptedException e)
      {
      }

    System.out.println("Fin de l'execution des threads (ctrl+C) ");

    }

  private boolean invokedStandalone = false;
  }