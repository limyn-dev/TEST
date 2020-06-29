package Employe;

/*======================================================================================================================
   D�scription:
      Int�rface qui d�finit les m�thodes qui se rapport � un �l�ment facturable
======================================================================================================================*/

public interface I_Billing
   {

   // Nom du client
   public void    setClientName(String name) ;
   public String  getClientName() ;

   // Nombre d'heures de travail
   public void addHoursWork(int hours) ;  // Ajout des heures de travail
   public int  getHoursWork() ;           // Lecture des heures de travail
   public void resetHoursWork() ;         // Remise � 0 des heures


   }