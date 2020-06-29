package tstclass;

import java.lang.* ;
import java.lang.System.* ;

/**
 * Title:
 * Description:
 * Copyright:    Copyright (c) 2000
 * Company:
 * @author
 * @version 1.0
 */

public class CTstClass
  {

  public CTstClass()  {}

  public static void main(String[] args)
    {
    CA ca = new CA() ;
    CB cb = new CB() ;

    java.lang.Object cx = ca ; // pointeur sur un objet

    System.out.println(ca.getClass().getName()) ;
    System.out.println(cb.getClass().getName()) ;

    System.out.println("---------------------------------------------") ;

    System.out.println("Nom de la class: " + cx.getClass().getName()) ;
    System.out.println("Super class    : " + cx.getClass().getSuperclass()) ;
    System.out.print("Methodes       : ") ;
    boolean nxtMethode=true ;
    int m=0 ;
    while(nxtMethode)
      try
        { System.out.print(cx.getClass().getMethods()[m++].getName() + " / ") ; }
      catch (java.lang.Exception e)
        { nxtMethode=false ; }


    }

  } // Fin de la class