package shape;

/**
 * Title:
 * Description:
 * Copyright:    Copyright (c) 2001
 * Company:
 * @author
 * @version 1.0
 */

public class C_Rct extends C_Shp
   {

	protected double w,h;

	public C_Rct(double x, double y)
      {
		w = x;
		h = y;
	   }

	public double getWith()
      {
		return w;
	   }

	public double getHeight()
      {
		return h;
	   }


	public double area()
      {
		return w * h;
	   }

	public double circ()
      {
		return 2.0 * (w + h);
	   }

}