package ecole;

/**
 * Title:        Ex2
 * Description:  Main
 * Copyright:    Copyright (c) 2002
 * Company:
 * @author :     Yves Delay
 * @version 1.0
 */

public abstract class CEtudiant extends CPersonne
  {

  public CEtudiant()
    { super(); setSection(""); }
  public CEtudiant(String nom, int anDebut, String section)
    { super(nom, anDebut); setSection(section); }

  public void setSection(String section)        { Sct = section ;       }

  public String getSection()                    { return Sct ;      }

  //---------------------------------------------------------------------------
  private String Sct ;

  }