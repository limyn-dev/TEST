package jeuxdestas;

/**
 * Title:        Jeux des tas
 * Description:  Division succesives d'un ensemble de n élements, non distinct, en sous ensemble j'usqu'à ce que les sous ensemble contiennent au maximum 2 elements
 * Copyright:    Copyright (c) 2000
 * Company:      _
 * @author Yves Delay
 * @version 1.0
 */

public class CBtnTas extends javax.swing.JButton
  {

  /*---- Membre -------------------------------------------------------------*/
  private Integer NbrPce ;

  /*---- Accesseurs ---------------------------------------------------------*/
  public void SetNbrPce(int nbrPce)  { newIst(nbrPce) ; }
  public int  GetNbrPce()           { return NbrPce.intValue();    }

  /*---- Construction de la class -------------------------------------------*/
  public CBtnTas(int nbrPce)  { super(new Integer(nbrPce).toString()); newIst(nbrPce) ;  }



  /**************************************************************************/



  private void newIst(int nbrPce)
    {

    // Initialisation des membres
    NbrPce = new Integer(nbrPce) ;

    // Mise à jour de l'apparence
    this.setName(NbrPce.toString()) ;

    }


  }