package csoio;

//Titre :        CsoIO
//Version :
//Copyright :    Copyright (c) 1999
//Auteur :       Yves Delay
//Société :      _
//Description :  Votre description

public class test
  {

  public static void main(String[] args)
    {
    CsoIO cso = new CsoIO() ;


    int val = cso.DemanderInteger("Valeur entière: ") ;

    cso.Afficher("Valeur saisie") ;
    cso.Afficher(val)  ;

    cso.NewLne();
    cso.Valider("Pressez 'ENTER' pour continuer") ;



    }

  private boolean invokedStandalone = false;

  }