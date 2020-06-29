package ecole;

/**
 * Title:        Ex2
 * Description:  Main
 * Copyright:    Copyright (c) 2002
 * Company:
 * @author :     Yves Delay
 * @version 1.0
 */

public abstract class CPersonne
  {

  public CPersonne()
    { setNom(""); setAnneeEntree(0); }
  public CPersonne(String nom, int anDebut)
    { setNom(nom); setAnneeEntree(anDebut); }

  public void setNom(String nom)    { Nom = nom ;   }
  public void setAnneeEntree(int anDebut)  { AnI = anDebut ; }

  public String getNom()          { return Nom ;  }
  public int    getAnneeEntree()  { return AnI ; }


  //---------------------------------------------------------------------------
  String Nom ;
  int    AnI ;

  }