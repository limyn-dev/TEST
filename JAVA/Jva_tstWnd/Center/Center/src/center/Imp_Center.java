package center;

/**
 * Title:
 * Description:
 * Copyright:    Copyright (c) 2001
 * Company:
 * @author
 * @version 1.0
 */

public class Imp_Center implements I_Center
   {

	private double cx, cy;

	public ImplCenter()                          {                 }
	public void setCenter(double x, double y)    { cx = x; cy = y; }
	public double getCenterX()                   { return cx;      }
	public double getCenterY()                   { return cy;      }

   }