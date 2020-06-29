package Employe;

/*======================================================================================================================
   Déscription:
      Intérface qui définit les méthodes qui se rapport à un élément facturable
======================================================================================================================*/

public interface I_Billing
   {

   // Nom du client
   public void    setClientName(String name) ;
   public String  getClientName() ;

   // Nombre d'heures de travail
   public void addHoursWork(int hours) ;  // Ajout des heures de travail
   public int  getHoursWork() ;           // Lecture des heures de travail
   public void resetHoursWork() ;         // Remise à 0 des heures


   }