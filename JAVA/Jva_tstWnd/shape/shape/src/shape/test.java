package shape;

/**
 * Title:
 * Description:
 * Copyright:    Copyright (c) 2001
 * Company:
 * @author
 * @version 1.0
 */

public class test
   {

   public static void main( String args[] )
      {

		double totalArea = 0.0;
		double totalCirc = 0.0;

		C_Shp[] formes = new C_Shp[3];

		formes[0] = new C_Crl(2.0);
		formes[1] = new C_Rct(1.0,3.0);
		formes[2] = new C_Rct(2.0,5.0);

		for (int i=0; i<formes.length;i++)
         {
			totalArea += formes[i].area();
			totalCirc += formes[i].circ();
		   }

		System.out.println("total de l'aire: "+totalArea);
		System.out.println("total de la circonference: "+totalCirc);

	   }
}
