package triangle;

import java.lang.* ;
import triangle.C_Pnt ;

public class C_Lne
  {

  // Membres
  private C_Pnt a ;
  private C_Pnt b ;

  // Accesseurs
  public void  A(int x, int y)                  { this.a.X(x); this.b.Y(y);       }
  public void  B(int x, int y)                  { this.a.X(x); this.b.Y(y);       }
  public C_Pnt A()                              { return a;  }
  public C_Pnt B()                              { return b;  }

  // Constructeurs
  public C_Lne()                                { this.a=new C_Pnt(0, 0);    this.b=new C_Pnt(0, 0);    }
  public C_Lne(int ax, int ay, int bx, int by)  { this.a=new C_Pnt(ax, ay);  this.b=new C_Pnt(ax, ay);  }
  public C_Lne(C_Lne lne)                       { this.a=new C_Pnt(lne.A()); this.b=new C_Pnt(lne.B()); }

  // Convertion
  public String toString()  { return A.toString() + " / " + B.toString();     }

  // Main
  public static void main()
    {
    C_Lne lne = new C_Lne(2, 4, 3, 7) ;

    System.out.println(lne.toString()) ;

    }

  }