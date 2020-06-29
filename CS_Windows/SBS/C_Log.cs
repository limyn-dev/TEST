/*
 * Created by SharpDevelop.
 * User: USRLOC
 * Date: 08.10.2018
 * Time: 22:52
 * 
 * To change this template use Tools | Options | Coding | Edit Standard Headers.
 */
using System				;
using System.Windows.Forms	;

namespace SBS
{
public static class Lg
{
	public static System.Windows.Forms.TextBox myTBX = null ;
		
	public static void WL(string sText = "") {
		
		if (myTBX == null) { return ; }
		
		myTBX.Text += sText ;
		
	}
	
}



}
