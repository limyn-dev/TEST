package poligone;

import java.lang.* ;
//import java.io.* ;

public class C_Pnt
  {

  // Membres
  private int x ;
  private int y ;

  // Accesseurs
  public void X(int x)        { this.x = x;     }
  public void Y(int y)        { this.y = y;     }
  public int  X()             { return this.x;  }
  public int  Y()             { return this.y;  }

  // Constructeurs
  public C_Pnt()              { this.X(0); this.Y(0);             }
  public C_Pnt(int x, int y)  { this.X(x); this.Y(y);             }
  public C_Pnt(C_Pnt pnt)     { this.X(pnt.X()); this.Y(pnt.Y()); }

  // Convertion
  public String toString()     { return "{" + this.X() + " ; " + this.Y() + "}" ; }

  // Main
  public static void main(String[] args)
    {
    C_Pnt pnt = new C_Pnt(3, 5) ;

    System.out.println (pnt.toString()) ;

    }

  }