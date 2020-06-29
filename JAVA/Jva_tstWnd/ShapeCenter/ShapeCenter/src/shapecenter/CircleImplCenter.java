

public class CircleImplCenter extends Circle
							  implements Centered
							  
{
	ImplCenter ic = new ImplCenter();
	

	public CircleImplCenter(double r, double x, double y) 
	{
		super(r);
		ic.setCenter(x,y);
	}
	
	public void setCenter(double x, double y) 
	{
		ic.setCenter(x,y);
	}
	
	public double getCenterX() {
		return ic.getCenterX();
	}
	
	public double getCenterY() {
		return ic.getCenterY();
	}
}
