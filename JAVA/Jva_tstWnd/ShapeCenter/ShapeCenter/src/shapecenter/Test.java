package shapecenter;

/**
 * Title:
 * Description:
 * Copyright:    Copyright (c) 2001
 * Company:
 * @author
 * @version 1.0
 */

import java.lang.Math.*;

public class mainCenterShape {
	public static void main( String args[] ) {

		double totalArea = 0.0;
		double totalCirc = 0.0;
		double totalDist = 0.0;

		Shape[] formes = new Shape[3];

		formes[0] = new CircleCenter(2.0,1.0,1.0);
		formes[1] = new RectangleCenter(1.0,3.0,1.0,1.0);
		formes[2] = new RectangleCenter(2.0,5.0,1.0,1.0);

		for (int i=0; i<formes.length;i++) {
			totalArea += formes[i].area();
			totalCirc += formes[i].circ();
			double x = ((Centered)formes[i]).getCenterX();
			double y = ((Centered)formes[i]).getCenterY();
			totalDist += Math.sqrt(x*x + y*y);
		}

		System.out.println("total de l'aire: "+totalArea);
		System.out.println("total de la circonference: "+totalCirc);
		System.out.println("total des distances: "+totalDist);

	}
}
