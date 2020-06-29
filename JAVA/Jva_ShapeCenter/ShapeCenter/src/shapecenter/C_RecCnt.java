package shapecenter;

/**
 * Title:
 * Description:
 * Copyright:    Copyright (c) 2001
 * Company:
 * @author
 * @version 1.0
 */

public class RectangleCenter extends Rectangle
							 implements Centered
{
	private double cx, cy;

	public RectangleCenter(double w, double h, double x, double y)
	{
		super(w,h);
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