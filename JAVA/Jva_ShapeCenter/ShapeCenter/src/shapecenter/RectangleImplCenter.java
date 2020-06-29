
public class RectangleImplCenter extends Rectangle
								 implements Centered
{
	
	ImplCenter ic = new ImplCenter();
	

	public RectangleImplCenter(double w, double h, double x, double y) 
	{
		super(w,h);
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
