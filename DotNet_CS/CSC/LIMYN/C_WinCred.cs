using CredentialManagement          ;
//using Windows.Security.Credentials  ;

namespace LIMYN
{   
public class C_WinCred
{
   /*
   private PasswordVault myPVO = null ;
   
   public void PVO_GetAll() {
      //----------------------------------------------------------------------------//
      //----------------------------------------------------------------------------//
      //                                                                            ---------------------------------      
      myPVO = new PasswordVault() ;                                                 //
      //                                                                            -----------------------------------
      foreach(object oPsw in myPVO.GetAll() ) {                                             //
         C_LG.Wl("Passw0rd") ;                                                      //
      }                                                                             //
      //                                                                            -----------------------------------
   }
   
   */
   
   
   /*
   
   public UserPass GetCredential(string starget)
    {
        Credential C = new Credential() ;
        C.Target = target ;
        if (!C.Load())
        {
            return null;
        }

        // UserPass is just a class with two string properties for user and pass
        return new UserPass(cm.Username, cm.Password);
    }

   public bool SetCredentials(string target, string username, string password, PersistanceType persistenceType)
   {
      Credential C = Credential { Target = target,
                                  Username = username,
                              Password = password,
                              PersistanceType =  persistenceType}.Save();
    }

    public static bool RemoveCredentials(string target)
    {
        return new Credential { Target = target }.Delete();
    }
    
    */
}
}