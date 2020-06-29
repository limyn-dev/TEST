package menage;

/**
 * Title:        Menage
 * Description:
 * Copyright:    Copyright (c) 2001
 * Company:      _
 * @author Yves Delay
 * @version 1.0
 */

public class C_Vhc {

   // Membre
   private int nvt ;

   // Setter
   public void NombreDeVitesse(int nvt)  { this.nvt=nvt; }

   // Getter
   public int  NombreDeVitesse()         { return this.nvt;        }

   // Constructeurs
   public C_Vhc()                                                    { super(); NombreDeVitesse(0);                }
   public C_Vhc(int prixAchat, String marque, int nombreDeVitesse)   { super(prixAchat, marque); NombreDeVitesse(nombreDeVitesse);   }
   public C_Vhc(C_Vhc v)
}