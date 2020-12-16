using System;
using System.Drawing;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Windows.Forms;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

[assembly: AssemblyTrademark  ("LIMYN"  ) ]
[assembly: AssemblyTitle      ("CHKEdit") ]
[assembly: AssemblyProduct    ("CHKEdit") ]
[assembly: AssemblyVersion    ("1.2.0.1") ]
[assembly: AssemblyFileVersion("1.2.0.1") ]

namespace CHK
{


/* CLASS CPSEdit */
public partial class CHKEdit : Form
{
   #region    ********** [ LITERALS    ] ******************************************************************************
   //                                                                               -----------------------------------
   private string myFDF  = "seq files (*.seq)|*.seq|All files (*.*)|*.*"         ;  // File dialog filter
   //                                                                               -----------------------------------
   #endregion *********************************************************************************************************
   #region    ********** [ MEMBERS     ] ******************************************************************************
   //                                                                               -----------------------------------
   private string                     myTPH  = ""                                ;  // Template path
   private Dictionary<string,Control> myCTL  = new Dictionary<string,Control>()  ;  //
   private TextBox                    myTBL  = new TextBox()      {Name="TBXL"}  ;  // Log TextBox
   private CTemplates                 myTPL  = null                              ;  // Template object
   private TreeView                   myTTV  = new TreeView()     {Name="TRVT"}  ;  // Template TreeView
   private DataGridView               myTDV  = new DataGridView() {Name="DGVT"}  ;  // Template DataGridView
   private CSequence                  mySQC  = null                              ;  // Sequence object
   private TreeView                   mySTV  = new TreeView()     {Name="TRVS"}  ;  // Sequence TreeView
   private DataGridView               mySDV  = new DataGridView() {Name="DGVS"}  ;  // Sequence DataGridView
   //                                                                               -----------------------------------
   #endregion *********************************************************************************************************
   #region    ********** [ CONSTRUCT   ] ******************************************************************************
   public                  CHKEdit  (                                            )  {
      /*----------------------------------------------------------------------------*/
      /*----------------------------------------------------------------------------*/
      //                                                                            -----------------------------------
      myGUI_Init()                                                               ;  // Ini gui
      //                                                                            -----------------------------------
      myTPH = System.IO.Path.GetDirectoryName(Application.ExecutablePath)        ;  // Set templates path
      myTPH = myTPH + "\\Templates"                                              ;  //
      CL.Trace("Templates path [" + myTPH + "]")                                 ;  //
      //                                                                            -----------------------------------
      myTPL = new CTemplates(myTPH, myTTV, myTDV)                                ;  // Init Ctemplate
      //                                                                            -----------------------------------
   }
   protected override void Dispose  (bool disposing                              )  {
      /*----------------------------------------------------------------------------*/
      /*----------------------------------------------------------------------------*/
      if (disposing) {                                                              //
         //if (components != null) {components.Dispose();}                          //
      }                                                                             //
      //                                                                            -----------------------------------
      base.Dispose(disposing);                                                      //
      //                                                                            -----------------------------------
   }
   #endregion *********************************************************************************************************
   #region    ********** [ MENU EVENTS ] ******************************************************************************
   void Menu_Click                  (Object sender, EventArgs e                  )  {
      /*----------------------------------------------------------------------------*
       *----------------------------------------------------------------------------*/
      ToolStripMenuItem I = (ToolStripMenuItem)sender                            ;  // Retrieve menu item
      string            A = I.Text.ToUpper().Replace(" ", "_")                   ;  // Retrieve action
      string            F = ""                                                   ;  // Retrieve menu item
      //                                                                            -----------------------------------
      if (A == "FILE") { return;                                                 }  // Unmanaged events
      //                                                                            -----------------------------------
      CL.TraceEvent()                                                            ;  // Trace evnet
      //                                                                            -----------------------------------
      switch (A)                                                                 {  // Event action
         case "NEW_SEQUENCE"                                                     :  //    New sequence
            F =  myTPH + "\\_NewSeq.xml"                                         ;  //
            mySQC = new CSequence(myTPL, F, mySTV, mySDV)                        ;  //
            break                                                                ;  //
         case "OPEN_SEQUENCE"                                                    :  //    Open sequence file
            F = myGUI_File_Open()                                                ;  //
            if (F != "")                                                         {  //
               this.Text=F; mySQC = new CSequence(myTPL, F, mySTV, mySDV);       }  //
            break                                                                ;  //
         case "SAVE_SEQUENCE"                                                    :  //    Save sequence file
            mySQC.DbSave()                                                       ;  //
            break                                                                ;  //
         case "SAVE_SEQUENCE_AS"                                                 :  //    Save as sequence file
            F = myGUI_File_Save()                                                ;  //
            if (F != "")                                                         {  //
               this.Text=F; mySQC.DbSave(F);                                     }  //
            break                                                                ;  //            
         case "MAKE_SCRIPT"                                                      :  //    Make script
            mySQC.PS1Make()                                                      ;  //
            break                                                                ;  //
         default                                                                 :  //
            CL.Trace("Unknow action [" + A + "]")                                ;  //
            break                                                                ;  //
      }                                                                             //
      //                                                                            -----------------------------------
   }
   #endregion *********************************************************************************************************
   #region    ********** [ PRIVATE GUI ] ******************************************************************************
   private string myGUI_File_Open   (                                            )  {
      /*----------------------------------------------------------------------------*
       *----------------------------------------------------------------------------*/
      OpenFileDialog O   = new OpenFileDialog()                                  ;  //
      string         F   = ""                                                    ;  //
      //                                                                            -----------------------------------
      O.Filter           = myFDF                                                 ;  //
      O.FilterIndex      = 1                                                     ;  //
      O.RestoreDirectory = true                                                  ;  //
      if (O.ShowDialog() == DialogResult.OK)                                     {  //
         F = O.FileName;                                                         }  //
      //                                                                            -----------------------------------
      return F                                                                   ;  //
   }
   private string myGUI_File_Save   (                                            )  {
      /*----------------------------------------------------------------------------*
       *----------------------------------------------------------------------------*/   
      SaveFileDialog O = new SaveFileDialog()                                    ;  //
      string         F = ""                                                      ;  //
      //                                                                            ----------------------------------- 
      O.Filter           = myFDF                                                 ;  //
      O.FilterIndex      = 1                                                     ;  //
      O.RestoreDirectory = true                                                  ;  //
      if(O.ShowDialog() == DialogResult.OK)                                      {  //
         F=O.FileName;                                                           }  //
      //                                                                            -----------------------------------
      return F                                                                   ;  //
   }
   private void   myGUI_Init_Menu   (                                            )  {
      /*----------------------------------------------------------------------------*
       * Initialize graphical components. This function is called by the class      *
       * constructor CPSEdit.                                                       *
       *----------------------------------------------------------------------------*/
      Dictionary<int, ToolStripMenuItem> L = null                                ;  //
      MenuStrip                          M = null                                ;  //
      //                                                                            -----------------------------------
      L = new Dictionary<int, ToolStripMenuItem>()                               ;  //
      L.Add(0, new ToolStripMenuItem("File"))                                    ;  // Create menuitems
      L.Add(1, new ToolStripMenuItem("New Sequence"    ))                        ;  //
      L.Add(2, new ToolStripMenuItem("Open Sequence"   ))                        ;  //
      L.Add(3, new ToolStripMenuItem("Save Sequence"   ))                        ;  //
      L.Add(4, new ToolStripMenuItem("Save Sequence As"))                        ;  //
      L.Add(5, new ToolStripMenuItem("Make Script"     ))                        ;  //
      //                                                                            -----------------------------------
      for (int I=0; I<L.Count; I++)                                              {  // Set event handler
         L[I].Click += new EventHandler(this.Menu_Click);                        }  //
      //                                                                            -----------------------------------
      M = new MenuStrip()                                                        ;  // Ceate menu
      M.Name = "MN00"                                                            ;  //
      M.Dock = DockStyle.Top                                                     ;  //
      M.Items.Add(L[0])                                                          ;  //    Add File
      L[0].DropDownItems.Add(L[1])                                               ;  //    Add New Sequence
      L[0].DropDownItems.Add(L[2])                                               ;  //    Add Open Sequence
      L[0].DropDownItems.Add(L[3])                                               ;  //    Add Save Sequence
      L[0].DropDownItems.Add(L[4])                                               ;  //    Add Save Sequence As
      L[0].DropDownItems.Add(L[5])                                               ;  //    Add Make Check
      //                                                                            -----------------------------------
      this.Controls.Add(M)                                                       ;  // Update windows
      //                                                                            -----------------------------------
   }
   private void   myGUI_Init        (                                            )  {
      /*----------------------------------------------------------------------------*
       * Initialize graphical components. This function is called by the class      *
       * constructor CPSEdit.                                                       *
       *----------------------------------------------------------------------------*/
      Font oFnt = new Font("Consolas", 12.0f); 
      //                                                                            -----------------------------------
      myCTL.Add("TAB0", new TabControl()              {Name="TAB0"}  )           ;  // Create Main TabControl
      myCTL.Add("TBPS", new TabPage()                 {Name="TBPS"}  )           ;  // Create Sequence TabPage
      myCTL.Add("SPCS", new SplitContainer()          {Name="SPCS"}  )           ;  // Create Sequence SplitContainer
      myCTL.Add("TRVS", mySTV                                        )           ;  // Create Sequence Treeview
      myCTL.Add("DGVS", mySDV                                        )           ;  // Create Sequence DataGridview
      myCTL.Add("TBPT", new TabPage()                 {Name="TBPT"}  )           ;  // Create Template TabPage
      myCTL.Add("SPCT", new SplitContainer()          {Name="SPCT"}  )           ;  // Create Template SplitContainer
      myCTL.Add("TRVT", myTTV                                        )           ;  // Create Template Treeview
      myCTL.Add("DGVT", myTDV                                        )           ;  // Create Template DataGridview
      myCTL.Add("TBPL", new TabPage()                 {Name="TBPL"}  )           ;  // Create Log TabPage
      myCTL.Add("TBXL", myTBL                                        )           ;  // Create Log Textbox
      //                                                                 Build form >----------------------------------
      myCTL["TAB0"].Controls.Add(myCTL["TBPS"])                                  ;  // Add SequenceTabPage to MainTabControl
      myCTL["TBPS"].Controls.Add(myCTL["SPCS"])                                  ;  // Add SequenceSplitContainer to SequenceTabPage
      ((SplitContainer)myCTL["SPCS"]).Panel1.Controls.Add(myCTL["TRVS"])         ;  // Add SequenceTreeview to SequenceSplitContainer
      ((SplitContainer)myCTL["SPCS"]).Panel2.Controls.Add(myCTL["DGVS"])         ;  // Add SequenceDataGridview to SequenceSplitContainer
      myCTL["TAB0"].Controls.Add(myCTL["TBPT"])                                  ;  // Add TemplateTabPage to TemplateTabControl
      myCTL["TBPT"].Controls.Add(myCTL["SPCT"])                                  ;  // Add SplitContainer to TemplateTabPage
      ((SplitContainer)myCTL["SPCT"]).Panel1.Controls.Add(myCTL["TRVT"])         ;  // Add MainTreeview to SplitContainer
      ((SplitContainer)myCTL["SPCT"]).Panel2.Controls.Add(myCTL["DGVT"])         ;  // Add MainDataGridview to SplitContainer
      myCTL["TAB0"].Controls.Add(myCTL["TBPL"])                                  ;  // Add LogTabPage to TemplateTabControl
      myCTL["TBPL"].Controls.Add(myCTL["TBXL"])                                  ;  // Add LogTextBox to LogTabPage
      //                                                          Size and position >----------------------------------
      myCTL["TAB0"].Dock = DockStyle.Fill                                        ;  //
      myCTL["TBPS"].Dock = DockStyle.Fill                                        ;  //
      myCTL["SPCS"].Dock = DockStyle.Fill                                        ;  //
      myCTL["TRVS"].Dock = DockStyle.Fill                                        ;  //
      myCTL["DGVS"].Dock = DockStyle.Fill                                        ;  //
      myCTL["TBPT"].Dock = DockStyle.Fill                                        ;  //
      myCTL["SPCT"].Dock = DockStyle.Fill                                        ;  //
      myCTL["TRVT"].Dock = DockStyle.Fill                                        ;  //
      myCTL["DGVT"].Dock = DockStyle.Fill                                        ;  //
      myCTL["TBPL"].Dock = DockStyle.Fill                                        ;  //
      myCTL["TBXL"].Dock = DockStyle.Fill                                        ;  //
      //                                                       Configure components >----------------------------------
      myCTL["TBPS"].Text                  = "SEQUENCE"                           ;  //
      myCTL["TBPT"].Text                  = "TEMPLATES"                          ;  //
      myCTL["TBPL"].Text                  = "LOG"                                ;  //
      ((TextBox)myCTL["TBXL"]).Font       = oFnt                                 ;  //
      ((TextBox)myCTL["TBXL"]).Multiline  = true                                 ;  //
      ((TextBox)myCTL["TBXL"]).ScrollBars = System.Windows.Forms.ScrollBars.Both ;  //
      //                                                                            -----------------------------------
      this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F)               ;  // Set windows
      this.AutoScaleMode       = System.Windows.Forms.AutoScaleMode.Font         ;  //
      this.ClientSize          = new System.Drawing.Size(600, 600)               ;  //
      this.Controls.Add(myCTL["TAB0"])                                           ;  // Set form content
      myGUI_Init_Menu()                                                          ;  // Add menu
      //                                                                            -----------------------------------
      CL.Start(myTBL)                                                            ;  // Start log
      //                                                                            -----------------------------------
   }
   #endregion *********************************************************************************************************
   #region    ********** [ ENTRY POINT ] ******************************************************************************
   [STAThread]
   public static void Main() {
      /*----------------------------------------------------------------------------*
       * Entry point (program start). Create an instance of class C_StartExe and    *
       * run it.                                                                    *
       *----------------------------------------------------------------------------*/
      Application.EnableVisualStyles();
      Application.Run(new CHKEdit());
   }
   #endregion *********************************************************************************************************
}


/* END OF NAMESPACE  */
}