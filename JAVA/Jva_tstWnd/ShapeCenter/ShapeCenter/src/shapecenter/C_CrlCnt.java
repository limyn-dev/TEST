package shapecenter;

/**
 * Title:
 * Description:
 * Copyright:    Copyright (c) 2001
 * Company:
 * @author
 * @version 1.0
 */

import shape.*;
public class CircleCenter extends Circle
						  implements Centered
{
	private double cx, cy;

	public CircleCenter(double r, double x, double y)
	{
		super(r);
		cx = x;
		cy = y;
	}

	public void setCenter(double x, double y)
	{
		cx = x;
		cy = y;
	}

	public double getCenterX() {
		return cx;
	}

	public double getCenterY() {
		return cy;
	}
}