package c_nbc;

import java.lang.* ;
import java.math.* ;
import java.io.* ;

public class C_NbC
   {

   /* Membres
   ---------------------------------------------------------------------------*/
   private double rel ;
   private double img ;
   private double mdl ;
   private double arg ;

   /* constructeurs
   ---------------------------------------------------------------------------*/
   public C_NbC ()                           { this.setRec(0.0, 0.0) ; }
   public C_NbC (double rel, double img)     { this.setRec(rel, img) ; }

   /* Accesseurs
   ---------------------------------------------------------------------------*/
   public double Rel()                           { return this.rel; }
   public double Img()                           { return this.img; }
   public double Mdl()                           { return this.mdl; }
   public double Arg()                           { return this.arg; }
   public void setRec( double rel, double img )  { rel = rel; img = img; toPol(); }
   public void setPol( double mdl, double arg )  { mdl = mdl; arg = arg; toRec(); }

   /* Opérateurs
   ----------------------------------------------------------------------------*/
   public static C_NbC Somme( C_NbC nA, C_NbC nB)  { return new C_NbC(nA.Rel()+nB.Rel(), nA.Img()+nA.Img()); }
   public static C_NbC Produit( C_NbC nA, C_NbC nB) { return new C_NbC(nA.Arg()*nB.Arg(), nA.Arg()+nB.Arg()); }



   /***************************************************************************/



   /* Convertion
   ---------------------------------------------------------------------------*/
   private void toPol()
      {
      mdl = Math.sqrt(rel*rel + img*img) ;
      arg = Math.atan(img/rel) ;
      }
   //--------------------------------------------------------------------------
   private void toRec()
      {
      rel = mdl * Math.sin(arg) ;
      img = mdl * Math.cos(arg) ;
      }
   //--------------------------------------------------------------------------
   public String toString()
      {
      return new String(this.rel + " + j" + this.img);
      }


   /* Main
   ----------------------------------------------------------------------------*/
   public static void main(String[] args)
      {
      BufferedInputStream bufIn = new BufferedInputStream(System.in ) ;
      byte rep[] = new byte[3];

      C_NbC nA = new C_NbC(2, 3) ;
      C_NbC nB = new C_NbC(4, 2) ;
      C_NbC nC = new C_NbC() ;

      nC = Somme(nA, nB) ;

      System.out.print(nC.toString()) ;

      }  // Fin du main

   }  // Din de la class