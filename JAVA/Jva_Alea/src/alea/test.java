package alea;

public class test
  {

  public static void main (String args[])
    {
    int SZE = 100 ;

    CAlea tblA = new CAlea(SZE, 6);

    System.out.println("val a de l'index 2 et 20: "+tblA.getVal(2)+", "+tblA.getVal(20));

    // Copie de la table
    int[] ntbla = tblA.getVals();
    for(int i=0;i<SZE;i+=10)
      {
      System.out.println("val du nouveau tableau["+i+"] "+ntbla[i]);
      }

    // Création de la table des occurances
    int[] hist = tblA.getHisto();

    for(int i=1;i<SZE;i++)
      {
      System.out.println("rang "+i+": "+hist[i]);
      }

    } // Fin du main

  } // Fin de la classe