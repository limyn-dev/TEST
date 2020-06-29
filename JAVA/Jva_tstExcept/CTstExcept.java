package tstExcept;


public class CTstExcept
  {

  // Gestion d'une division par 0
  static void GestExcept()
    {

    for (int i=2; i>-2; i--)
      try
        { System.out.println (3/i); }
      catch(ArithmeticException e)
        { System.out.println("INFINI"); }
      catch(Exception e)
        { System.out.print(e.toString());}

    }

  // Déclenche,ment d'une exception par throw
  static void GenereExcept() throws CMonExcept
    {
    throw new CMonExcept() ;
    }


  // Execution de la methode de déclenchement de l'exception
  static void ExecutExcept()
    {

    try
      {
      GenereExcept() ;
      }
    catch(CMonExcept e)
      {
      System.out.println(e.toString());
      }
    catch(Exception e)
      {
      System.out.println(e.toString());
      }
    finally
      {
      System.out.println("Fin de la gestion de l'exception") ;
      }

    }


  }