
//Titre :        CsoIO
//Version :
//Copyright :    Copyright (c) 1999
//Auteur :       Yves Delay
//Société :      _
//Description :  Votre description
package CsoIO;

public class test
  {

  public static void main(String[] args)
    {
    CsoIO cso = new CsoIO() ;


    cso.SendCar ('A');
    cso.SendCar ('\t');
    cso.SendCar ('B');
    cso.SendCar ('\t');
    cso.SendCar ('C');
    
    cso.NewLne();
    cso.Valider("Pressez 'ENTER' pour continuer") ;



    }

  private boolean invokedStandalone = false;

  }