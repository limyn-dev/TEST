using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

[assembly: AssemblyTrademark  ("limy.yves@outlook.com"         ) ]
[assembly: AssemblyTitle      ("Run command from windows from.") ]
[assembly: AssemblyProduct    ("StartExe"                      ) ]
[assembly: AssemblyVersion    ("1.0.0.1"                       ) ]
[assembly: AssemblyFileVersion("1.0.0.1"                       ) ]

namespace PSC
{


/* CLASS C_PSC_Edit */
public partial class C_PSC_Edit : Form
{
   #region    ********** [ MEMBERS     ] ******************************************************************************
   //                                                                               -----------------------------------
   private Button  BTN_RUN = new Button () ;                                        //
   private Label   LBL_EXE = new Label  () ;                                        //
   private TextBox TBX_EXE = new TextBox() ;                                        //
   private Label   LBL_ARG = new Label  () ;                                        //
   private TextBox TBX_ARG = new TextBox() ;                                        //
   private TextBox TBX_LOG = new TextBox() ;                                        //
   //                                                                               -----------------------------------
   #endregion *********************************************************************************************************
   #region    ********** [ CONSTRUCT   ] ******************************************************************************
   //                                                                               -----------------------------------
   public                  C_PSC_Edit()            {
      myCmpInit();
   }
   protected override void Dispose(bool disposing) {
      /*----------------------------------------------------------------------------*/
      /*----------------------------------------------------------------------------*/
      if (disposing) {                                                              //
         //if (components != null) {components.Dispose();}                            //
      }
      //                                                                            -----------------------------------
      base.Dispose(disposing);
      //                                                                            -----------------------------------
   }
   //                                                                               -----------------------------------
   #endregion *********************************************************************************************************
   #region    ********** [ EVENTS      ] ******************************************************************************
   //                                                                               -----------------------------------
   void C_PSC_EditLoad(object sender, EventArgs e)   {}
   public void BTN_RUN_Click (object sender, System.EventArgs e) {
      /*----------------------------------------------------------------------------*/
      /*----------------------------------------------------------------------------*/
      //                                                                            -----------------------------------
      myLw("********** Event [BTN_RUN_Click] **********") ;                         //
      myPROC_Start()                                      ;                         //
      //                                                                            -----------------------------------      
   }
   //
   #endregion *********************************************************************************************************
   #region    ********** [ PRIVATE CMD ] ******************************************************************************
   private void myPROC_Start (){
      /*----------------------------------------------------------------------------*
       * Start process according to the command line written in TBX_EXE.             *
       *----------------------------------------------------------------------------*/
      string sCmd = TBX_EXE.Text ;                                                  //
      string sArg = TBX_ARG.Text ;                                                  //
      //                                                                            ----------------------------------- 
      if (sCmd == "") {                                                             //
         string            sMsg = "Executable requried"                ;            //
         string            sTtl = "ERROR"                              ;            //
         MessageBoxButtons oBtn = MessageBoxButtons.OK                 ;            //
         MessageBox.Show(sMsg, sTtl, oBtn, MessageBoxIcon.Exclamation) ;            //
         return                                                        ;            //
      }                                                                             //
      //                                                                            ----------------------------------- 
      myLw("START command:")                       ;                                //
      myLw("   Executable [" + sCmd + "]")         ;                                //
      myLw("   Arguments  [" + sArg + "]")         ;                                //
      System.Diagnostics.Process.Start(sCmd, sArg) ;                                //
      //                                                                            -----------------------------------       
   }
   
   #endregion *********************************************************************************************************
   #region    ********** [ PRIVATE GUI ] ******************************************************************************
   //
   private void myLw      (string sLine = ""                                           ) {
      /*----------------------------------------------------------------------------*
       * Write line of text in TBX_LOG                                               *
       *----------------------------------------------------------------------------*/
      //                                                                            -----------------------------------
      TBX_LOG.Text += sLine                ;                                         // Update TBX_LOG
      TBX_LOG.Text += Environment.NewLine  ;                                         //
      //                                                                            -----------------------------------
   }
   private void myCmpLoc  ( Control C=null, Int32 T=0, Int32 L=0, Int32 H=0, Int32 W=0 ) {
      /*----------------------------------------------------------------------------*
       * Set size and position of a component                                       *
       *----------------------------------------------------------------------------*/
      //                                                                            -----------------------------------
      C.Location    = new System.Drawing.Point(L, T)                          ;     //
      C.Size        = new System.Drawing.Size (W, H)                          ;     //
      //                                                                            -----------------------------------
   }
   private void myCmpInit (                                                            ) {
      /*----------------------------------------------------------------------------*
       * Initialize graphical components. This function is called by the class      *
       * constructor C_PSC_Edit.                                                    *
       *----------------------------------------------------------------------------*/
      //                                                                            -----------------------------------
      this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F)            ;     // Set windows
      this.AutoScaleMode       = System.Windows.Forms.AutoScaleMode.Font      ;     //
      this.ClientSize          = new System.Drawing.Size(700, 700)            ;     //
      //                                                                            -----------------------------------
      this.Controls.Add(this.LBL_EXE)                                         ;     // Add LBL_EXE
      this.Controls.Add(this.TBX_EXE)                                         ;     // Add TBX_EXE
      this.Controls.Add(this.LBL_ARG)                                         ;     // Add LBL_ARG
      this.Controls.Add(this.TBX_ARG)                                         ;     // Add TBX_ARG      
      this.Controls.Add(this.BTN_RUN)                                         ;     // Add BTN_RUN
      this.Controls.Add(this.TBX_LOG)                                         ;     // Add TBX_LOG
      //                T     L     H     W                                         -----------------------------------
      myCmpLoc( LBL_EXE, 25 ,  25 ,  25 , 100 )                               ;     // Set size and loction
      myCmpLoc( TBX_EXE, 25 , 130 ,  25 , 500 )                               ;     //
      myCmpLoc( LBL_ARG, 60 ,  25 ,  25 , 100 )                               ;     //
      myCmpLoc( TBX_ARG, 60 , 130 ,  25 , 500 )                               ;     //
      myCmpLoc( BTN_RUN, 25 , 635 ,  25 ,  50 )                               ;     //
      myCmpLoc( TBX_LOG, 95 ,  25 , 500 , 650 )                               ;     //
      //                                                                            -----------------------------------      
      this.LBL_EXE.Text = "Executable:"                                       ;     // Customize LBL_EXE
      //                                                                            -----------------------------------      
      this.LBL_ARG.Text = "Arguments:"                                        ;     // Customize LBL_ARG
      //                                                                            -----------------------------------      
      this.BTN_RUN.BackColor = Color.LightGray                                ;     // Customize BTN_RUN
      this.BTN_RUN.Text      = "RUN"                                          ;     //
      this.BTN_RUN.Click    += BTN_RUN_Click                                  ;     //    On click event      
      //                                                                            -----------------------------------
      this.TBX_LOG.AcceptsReturn  = true                                      ;     // Customize TBX_LOG
      this.TBX_LOG.AcceptsTab     = true                                      ;     //
      this.TBX_LOG.Multiline      = true                                      ;     //
      this.TBX_LOG.ScrollBars     = System.Windows.Forms.ScrollBars.Vertical  ;     //
      //                                                                            -----------------------------------
   }
   //
   #endregion *********************************************************************************************************
   #region    ********** [ ENTRY POINT ] ******************************************************************************
   [STAThread]
   public static void Main() {
      /*----------------------------------------------------------------------------*
       * Entry point (program start). Create an instance of class C_PSC_Edit and    *
       * run it.                                                                    *
       *----------------------------------------------------------------------------*/      
      Application.EnableVisualStyles();
      Application.Run(new C_PSC_Edit());
   }
   #endregion *********************************************************************************************************
}


/* END OF NAMESPACE  */
}