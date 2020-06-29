package polinome;

/**
 * Title:        Triangle
 * Description:  Votre description
 * Copyright:    Copyright (c) 1999
 * Company:      _
 * @author Yves Delay
 * @version
 */

public class C_Pnm
  {

  // Membre
  C_Pnt pts[] ;
  int   nbr ;

  // Setter
  public void Point(int num, C_Pnt pnt) { this.ptd[num]=pnt ; }

  // Getter
  public C_Pnt Point(int num)           { return this.pts[num] ; }

  // Constructeurs
  public C_Tri()                        { nbr=0 ; }
  public C_Tri(C_Pnt pts[]; int nbr)    { newPts(pts, nbr) ; }
  public C_Tri(C_Tri tri)               { newPts(tri.pts, tri.nbr) ; }

  // Outils
  private newPts(C_Pnt pts, int nbr)
    {
    this.nbr = nbr ;
    for (int i=0; i<this.nbr; i++)
      this.pts[num] = new c_Pnt(pts[num]) ;
    }

  // Main
  public static void main(String[] args)
    {
    C_Tri c_Tri1 = new C_Tri();
    }
}