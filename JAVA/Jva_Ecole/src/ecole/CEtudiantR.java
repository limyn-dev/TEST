package ecole;

/**
 * Title:
 * Description:
 * Copyright:    Copyright (c) 2002
 * Company:
 * @author
 * @version 1.0
 */

public class CEtudiantR extends CEtudiant
  {

  public CEtudiantR()
    { super(); setNote(0.0); }
  public CEtudiantR(String nom, int anDebut, String section, double note )
    { super(nom, anDebut, section); setNote(note); }

  public void setNote(double note)   { Nte = note ; }

  public double getNote()           { return Nte ; }

  //---------------------------------------------------------------------------
  private double Nte ;
}