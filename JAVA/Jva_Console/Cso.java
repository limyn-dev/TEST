
//Titre :        Console
//Version :
//Copyright :    Copyright (c) 1999
//Auteur :       Yves Delay
//Société :      _
//Description :  Votre description

package Console;

import java.lang.* ;
import java.io.* ;

public class Cso
   {

   /*--------------------------------------------------------------------------
      Affichage su la console
   ==========================================================================*/
   public static void Write(String str)
      {
      System.out.print(str) ;
      }
   //--------------------------------------------------------------------------
   public static void Write(int nbr)
      {
      System.out.print(nbr) ;
      }
   //--------------------------------------------------------------------------
   public static void Write(float nbr)
      {
      System.out.print(nbr) ;
      }
   //--------------------------------------------------------------------------
   public static void Write(double nbr)
      {
      System.out.print(nbr) ;
      }


   /*--------------------------------------------------------------------------
      Saisie des types de base
   ==========================================================================*/
   public static String RdStr()
      {
      DataInputStream bufIn = new DataInputStream(System.in) ;
      String str="" ;
      boolean fin ;

      do
         {
         try                     {  str = bufIn.readLine() ; fin=true;     }
         catch (Exception e)     {  fin=false ;                            }
         }
      while (!fin) ;

      return str ;
      }
   //--------------------------------------------------------------------------
   public static int RdInt()
      {
      DataInputStream bufIn = new DataInputStream(System.in) ;
      int nbr=0 ;
      boolean fin ;

      bufIn.reset();
      do
         {
         try
         {
         nbr = bufIn.readInt() ;
         fin=true;
         }
         catch (Exception e)     {  fin=false ;                           }
         }
      while (!fin) ;

      return nbr ;
      }
   //--------------------------------------------------------------------------
   public static float RdFloat()
      {
      DataInputStream bufIn = new DataInputStream(System.in) ;
      float nbr=0 ;
      boolean fin ;

      do
         {
         try                     {  nbr = bufIn.readFloat(); fin=true;  }
         catch (Exception e)     {  fin=false ;                         }
         }
      while (!fin) ;

      return nbr ;
      }
   //--------------------------------------------------------------------------
   public static double RdDouble()
      {
      DataInputStream bufIn = new DataInputStream(System.in) ;
      double nbr=0.0 ;
      boolean fin ;

      do
         {
         try                     {  nbr = bufIn.readDouble() ; fin=true;   }
         catch (Exception e)     {  fin=false ;                            }
         }
      while (!fin) ;

      return nbr ;
      }

   /*--------------------------------------------------------------------------
      Positionnement
   ==========================================================================*/
   public static void NxtLne()
      {
      System.out.println();
      }

   }