/*
 * Created by SharpDevelop.
 * User: USRLOC
 * Date: 08.10.2018
 * Time: 22:07
 * 
 * To change this template use Tools | Options | Coding | Edit Standard Headers.
 */
using System;
using System.Management.Automation;
using System.Management.Automation.Language;

namespace SBS
{
public class C_PsLib {
      
   #region ******** MEMBERS *********************************************************** 
   private System.Management.Automation.Language.Token[]      myTKS ;
   private System.Management.Automation.Language.ParseError[] myERS ;
	#endregion

	#region ******** CONSTRUCT ********************************************************
	public C_PsLib() { }
	#endregion

	#region ******** PUBLIC ***********************************************************
	public void PS1_Load(string sFile="") { myPS1_Read(sFile) ; }
	#endregion

	#region ******** PRIVATE **********************************************************
	private void myPS1_Read(string sFile=""){
		System.Management.Automation.Language.ScriptBlockAst oSba = null;
		
		Lg.WL("Open PS1 file [" + sFile + "]") ;
		System.Management.Automation.Language.Parser.ParseFile(sFile, out myTKS, out myERS) ;
		
		
	}
	#endregion
	
	}
}
