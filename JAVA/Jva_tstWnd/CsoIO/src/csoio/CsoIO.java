package csoio;

import java.io.* ;
import java.lang.Number ;

public class CsoIO
  {

  public CsoIO()
    {
    csoStrI = new BufferedReader(new InputStreamReader(System.in)) ;
    csoStrO = new PrintStream(System.out);
    csoDtaI = new DataInputStream(System.in) ;
    }

  // Affichages
  public void Afficher(char valeur)     { csoStrO.print(valeur) ;             }
  public void Afficher(String texte)    { csoStrO.print(texte) ;              }
  public void Afficher(int valeur)      { csoStrO.print(valeur) ;             }
  public void Afficher(long valeur)     { csoStrO.print(valeur) ;             }
  public void Afficher(float valeur)    { csoStrO.print(valeur);              }
  public void Afficher(double valeur)   { csoStrO.print(valeur) ;             }

  public void AfficherLn(char valeur)   { csoStrO.println(valeur) ;           }
  public void AfficherLn(String texte)  { csoStrO.println(texte) ;            }
  public void AfficherLn(int valeur)    { csoStrO.println(valeur) ;           }
  public void AfficherLn(long valeur)   { csoStrO.println(valeur) ;           }
  public void AfficherLn(float valeur)  { csoStrO.println(valeur);            }
  public void AfficherLn(double valeur) { csoStrO.println(valeur) ;           }

  // Saisies
  public char DemanderChar( String texte )
    {
    Afficher(texte) ;
    try                   { String str= new String(csoStrI.readLine()) ;
                            return str.toCharArray()[0];                      }
    catch(IOException e)  { return '*' ;                                      }
    }
  public String DemanderString(String texte)
    {
    Afficher(texte) ;
    try                   { return csoStrI.readLine() ;                       }
    catch (IOException e) { return "" ;                                       }
    }
  public int DemanderInteger(String texte)
    {
    Afficher(texte) ;
    try                   { Integer val= new Integer(csoStrI.readLine());
                            return val.intValue();                            }
    catch (IOException e) { return 0 ;                                        }
    }
  public long DemanderLong(String texte)
    {
    Afficher(texte) ;
    try                   { Long val= new Long(csoStrI.readLine());
                            return val.longValue();                           }
    catch (IOException e) { return 0 ;                                        }
    }
  public float DemanderFloat(String texte)
    {
    Afficher(texte) ;
    try                   { Float val=new Float(csoStrI.readLine()) ;
                            return val.floatValue() ;                         }
    catch (IOException e) { return 0 ;                                        }
    }
  public double DemanderDouble(String texte)
    {
    Afficher(texte) ;
    try                   { Double val=new Double(csoStrI.readLine()) ;
                            return val.doubleValue() ;                        }
    catch(IOException e)  { return 0 ;                                        }
    }

  // Validation d'affichage
  public void Valider(String texte)
    {
    Afficher(texte) ;
    try                   { String str = new String(csoStrI.readLine()) ;     }
    catch(IOException e)  { }
    }

  // Positionnement sur la console
  public void NewLne()
    {
    csoStrO.println() ;
    }
  public void SendCar(char car)
    {
    csoStrO.flush();
    csoStrO.write (car);
    }

  // Fonction de test
  public void AfficherASCI()
    {
    for (char car=0; car<256; car++)
      {
      Afficher("Caratere ") ;
      Afficher((int)car) ;
      Afficher(" -> ") ;
      Afficher(car) ;
      Valider("") ;
      }
    }


  //---------------------------------------------------------------------------
  private BufferedReader  csoStrI ;
  private PrintStream     csoStrO ;
  private DataInputStream csoDtaI ;

  }