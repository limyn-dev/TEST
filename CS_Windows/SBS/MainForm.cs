/*
 * Created by SharpDevelop.
 * User: USRLOC
 * Date: 08.10.2018
 * Time: 22:07
 * 
 * To change this template use Tools | Options | Coding | Edit Standard Headers.
 */
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Windows.Forms;

namespace SBS {
   
   
public partial class MainForm : Form {

   #region ********** MEMBERS *****************************************************************************************
   C_PsLib oPsl = new C_PsLib() ;
   #endregion
   
   #region ********** CONSTRUCTOR *************************************************************************************
   public MainForm() {
		//                                                                         -----------------------------------
		InitializeComponent();
		//                                                                         -----------------------------------  
		Lg.myTBX = this.tbxLOG  ;
		Lg.WL("Start")          ;
		//                                                                         -----------------------------------
	}
   #endregion
   
   #region ********** EVENTS ******************************************************************************************
   void OpenToolStripMenuItemClick(object sender, EventArgs e) { myFileOpen() ; }
	#endregion
   
	#region ********** PRIVATE *****************************************************************************************
	private void myFileOpen() {
	   var oOfd = new OpenFileDialog() ;

	   //oOfd.Filter = "Text Files (*.txt)|*.txt|All Files (*.*)|*.*";
      //dlg.Multiselect = true;
      if (oOfd.ShowDialog() != DialogResult.OK) { return; }

      foreach (string f in oOfd.FileNames) {
         Lg.WL("Open file [" + f + "]") ;
         //new FileInfo(path, passphraseTextBox.Text);
      }
      
	}
	#endregion
	
}
   
   
}
