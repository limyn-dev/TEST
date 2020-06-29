using System                                                ;
using System.Collections.Generic                            ;
using System.ComponentModel                                 ;
using System.Data                                           ;
using System.Drawing                                        ;
using System.Linq                                           ;
using System.Text                                           ;
using System.Windows.Forms                                  ;  
using System.Management.Automation                          ;
using System.Management.Automation.Runspaces                ;  

namespace PSUI
{

public partial class Form1 : Form
{

#region MEMBERS
   private PowerShell myPws = null ;
   private Object     myRlt = null ;   
#endregion

#region CONSTRUCTORS
   public Form1() { InitializeComponent(); myInitialize(); }
#endregion

#region EVENTS
   private void Form1_Load         (object sender, EventArgs e)         { myResize()        ; }
   private void Form1_Shown        (object sender, EventArgs e)         {                     }
   private void Form1_Resize       (object sender, EventArgs e)         { myResize()        ; }
   private void btnRun_Click       (object sender, EventArgs e)         { myCmdRun()        ; }
   private void rtbScript_KeyPress (object sender, KeyPressEventArgs e) {                     }
   private void rtbScript_KeyDown  (object sender, KeyEventArgs e)      {                     }
#endregion

#region PRIVATE
   private void myInitialize()
   {
      //                                                                            -----------------------------------
      this.rtbScript.AcceptsTab = true ;                                            // Set script text box 
      this.rtbScript.SelectionTabs = new int[] { 15,30,45,60,75,90,105,120,135 } ;  //
      //                                                                            -----------------------------------
      Runspace R = RunspaceFactory.CreateRunspace(); R.Open();                      // Powershell object initialisation
      myPws = PowerShell.Create(); myPws.Runspace = R;                              //
      //                                                                            -----------------------------------

   }
   private void myResize()
   {
      int H = this.Height ;
      int W = this.Width  ;
      //                                                                            -----------------------------------
      this.btnRun.Top    = 0   ;                                                    // Set RUN rutton position
      this.btnRun.Left   = 0   ;                                                    //
      this.btnRun.Height = 50  ;                                                    //
      this.btnRun.Width  = 100 ;                                                    //
      //                                                                            -----------------------------------
      this.tabMain.Top    = 50    ;                                                 // Set TAB panel position
      this.tabMain.Left   = 0     ;                                                 //
      this.tabMain.Height = H-100 ;                                                 //
      this.tabMain.Width  = W     ;                                                 //
      //                                                                            -----------------------------------
      this.rtbScript.Top    = 0                        ;                            // Set script textbox
      this.rtbScript.Left   = 0                        ;                            //
      this.rtbScript.Height = this.tabMain.Height - 25 ;                            //
      this.rtbScript.Width  = this.tabMain.Width - 25  ;                            //
      //                                                                            -----------------------------------
      this.tbxResult.Top    = 0                        ;                            // Set result textbox
      this.tbxResult.Left   = 0                        ;                            //
      this.tbxResult.Height = this.tabMain.Height - 25 ;                            //
      this.tbxResult.Width  = this.tabMain.Width - 25  ;                            //
      //                                                                            -----------------------------------
   }
   private void myCmdRun()
   {
      string sText = "";

      myPws.AddScript(this.rtbScript.Text) ;  
      myRlt = myPws.Invoke() ;

      this.tabMain.SelectedTab = this.tbpResult  ;

      foreach (PSObject O in myPws.Invoke())
      {
         sText += "-------------------------------------------------------------" ;
         sText += Environment.NewLine;
         sText += O.ToString() ; 
         sText += Environment.NewLine ;
      }

      this.tbxResult.Text = sText; 

   }
#endregion


}

}
