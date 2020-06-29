package shape;

/**
 * Title:
 * Description:
 * Copyright:    Copyright (c) 2001
 * Company:
 * @author
 * @version 1.0
 */


import java.lang.Math.*;

public class C_Crl extends C_Shp
   {

	protected double r = 0.0 ;

	public C_Crl(double r)
      {
		this.r = r ;
	   }

	public double getR()
      {
		return r ;
	   }

	public double area()
      {
		return Math.PI * r * r ;
	   }

	public double circ()
      {
		return 2.0 * Math.PI * r ;
	   }

}