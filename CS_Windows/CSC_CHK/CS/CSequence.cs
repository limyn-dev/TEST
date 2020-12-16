using System               ;
using System.Data          ;
using System.Windows.Forms ;

namespace CHK
{
class CSequence {
#region ********** LITERALS               *******************************************
//                                                                                  -----------------------------------
private const string myFHD = "_HEAD.txt"                                         ;  // Header script file
private const string myFMN = "_MAIN.txt"                                         ;  // Footer script file
//                                                                                  -----------------------------------
#endregion
#region ********** MEMBERS                *******************************************
//                                                                                  -----------------------------------
private CTemplates       myTpl = null                                            ;  // Templates
private string           myDBF = ""                                              ;  // Data base file
private DataSet          myDST = null                                            ;  // Templates DataSet
private TreeView         myTRV = null                                            ;  // Treeview
private DataGridView     myDGV = null                                            ;  // DataGridView
private ContextMenuStrip myRCM = null                                            ;  // Right click menu
private string           myCDT = ""                                              ;  // Current diplayed table
//                                                                                  -----------------------------------
#endregion
#region ********** CONSTRUCTOR            *******************************************
public CSequence(CTemplates oTemplate, string sDbFile, TreeView oTreeview, DataGridView oDataGridView) {
   /*-------------------------------------------------------------------------------*/
   /*-------------------------------------------------------------------------------*/
   //                                                                               -----------------------------------
   myTpl = oTemplate                                                             ;  // Set members
   myDstInit(sDbFile)                                                            ;  //
   myTrvInit(oTreeview)                                                          ;  //
   myDgvInit(oDataGridView)                                                      ;  //
   //                                                                               -----------------------------------
   myTrvLoad()                                                                   ;  //
   //                                                                               -----------------------------------
   myTRV.SelectedNode = myTRV.Nodes["ROOT"]                                      ;  //
   //                                                                               -----------------------------------
}
#endregion
#region ********** PUBLIC                 *******************************************
public void DbSave  (string sFile="", bool bConfirm=false) { myDstSave(sFile, bConfirm);  }
public void PS1Make (string sFile=""                     ) { myPS1Make(sFile)          ;  }
#endregion
#region ********** PRIVATE DataSet        *******************************************
private void myDstInit            (string sFile)                                    {
   /*-------------------------------------------------------------------------------*/
   /*-------------------------------------------------------------------------------*/
   //                                                                               -----------------------------------
   myDBF = sFile                                                                 ;  // Set members
   myDST = new DataSet("SEQUENCE")                                               ;  //
   //                                                                               -----------------------------------
   // sFle = System.IO.Path.GetDirectoryName(Application.ExecutablePath)         ;  //
   // sFle += "\\ElementsSchema.xml"                                             ;  //
   // Lg(" - Open [" + sFle + "]")                                               ;  //
   // myDST.ReadXmlSchema(sFle)                                                  ;  //
   //                                                                               -----------------------------------
   CL.Trace(" - Open [" + myDBF + "]")                                           ;  // Open file
   myDST.ReadXml(myDBF)                                                          ;  //
   //                                                                               -----------------------------------
   foreach(DataTable T in myDST.Tables)                                          {  // Set data events handlers
      T.RowChanged  += new DataRowChangeEventHandler(myDST_TableRowChange)       ;  //
      T.RowDeleted  += new DataRowChangeEventHandler(myDST_TableRowDelte)        ;  //
      T.TableNewRow += new DataTableNewRowEventHandler(myDST_TableRowAdd)        ;  //
   }                                                                                //
   //                                                                               -----------------------------------
}
private void myDstSave            (string sFile, bool bConfirm)                     {
   /*-------------------------------------------------------------------------------*/
   /*-------------------------------------------------------------------------------*/
   string            sMsg = "Save sequence change ?"                             ;  //
   MessageBoxButtons oMsb = MessageBoxButtons.YesNo                              ;  //
   //                                                                               -----------------------------------
   if (bConfirm)                                                                 {  // Confirm
      if (MessageBox.Show(sMsg, "Save", oMsb) != DialogResult.Yes) { return ;    }  //
   }                                                                                //
   //                                                                               -----------------------------------
   if (sFile != "")                                                              {  // Set file name
      myDBF = sFile;                                                             }  //
   //                                                                               -----------------------------------
   CL.Trace("Save file [" + myDBF + "]")                                         ;  // Save file
   myDST.WriteXml(myDBF)                                                         ;  //
   //                                                                               -----------------------------------
}
private void myDstStepAdd         (string sTemplate)                                {
   DataTable oTvr = myTpl.TableVariable                                          ;  // Template variables table
   DataTable oTbl = myDST.Tables["STEP"]                                         ;  // Steps table
   DataTable oTvl = myDST.Tables["VALUE"]                                        ;  // Values table
   DataRow   oRow = null                                                         ;  // Generic DataRow
   string    sSid = Guid.NewGuid().ToString()                                    ;  // Step ID
   //                                                                               -----------------------------------
   oRow = oTbl.NewRow()                                                          ;  // Add step row
   oRow["STEP_ID"]  = sSid                                                       ;  //
   oRow["TEMPLATE"] = sTemplate                                                  ;  //
   oRow["NAME"]     = "New Step"                                                 ;  //
   oRow["ORDER"]    = 0                                                          ;  //
   oTbl.Rows.Add(oRow)                                                           ;  //
   //                                                                               -----------------------------------
   foreach (DataRow R in oTvr.Select("TEMPLATE LIKE '" + sTemplate + "'"))       {  // Add step values
      oRow = oTvl.NewRow()                                                       ;  //
      oRow["STEP"] = sSid                                                        ;  //
      oRow["NAME"] = R["NAME"]                                                   ;  //
      oRow["TEXT"] = R["DEFAULT"]                                                ;  //
      oTvl.Rows.Add(oRow)                                                        ;  //
   }                                                                                //
   //                                                                               -----------------------------------
}
private void myDstStepDel         (string sStepId)                                  {
   /*-------------------------------------------------------------------------------*/
   /*-------------------------------------------------------------------------------*/
   DataTable oTsp = myDST.Tables["STEP"]                                         ;  // Table Step
   DataTable oTvl = myDST.Tables["VALUE"]                                        ;  // Table Value
   string    sQry = ""                                                           ;  // Generic query
   DataRow   oRow = null                                                         ;  // Generic datarow
   //                                                                               -----------------------------------
   sQry = "STEP_ID LIKE '" + sStepId + "'"                                       ;  // Select step row
   foreach (DataRow R in oTsp.Select(sQry))  { oRow = R  ;                       }  //
   if (oRow == null)                         { return    ;                       }  //
   //                                                                               -----------------------------------
   sQry = "STEP LIKE '" + oRow["STEP_ID"] + "'"                                  ;  // Remove step values
   foreach (DataRow R in oTvl.Select(sQry))  {  R.Delete() ;                     }  //
   //                                                                               -----------------------------------
   oRow.Delete()                                                                 ;  // Remove step row
   //                                                                               -----------------------------------
}
private void myDST_TableRowChange (object sender, DataRowChangeEventArgs   e)       {
   //                                                                               -----------------------------------
   CL.TraceEvent()                                                               ;  // Trace event
   //                                                                               -----------------------------------
   myTrvLoad()                                                                   ;  //
   //                                                                               -----------------------------------
}
private void myDST_TableRowAdd    (object sender, DataTableNewRowEventArgs e)       {
   //                                                                               -----------------------------------
   CL.TraceEvent()                                                               ;  // Trace event
   //                                                                               -----------------------------------
   myTrvLoad()                                                                   ;  //
   //                                                                               -----------------------------------
}
private void myDST_TableRowDelte  (object sender, DataRowChangeEventArgs   e)       {
   //                                                                               -----------------------------------
   CL.TraceEvent()                                                               ;  // Trace event
   //                                                                               -----------------------------------
   myTrvLoad()                                                                   ;  //
   //                                                                               -----------------------------------
}
#endregion
#region ********** PRIVATE TreeView       *******************************************
private void myTrvInit   (TreeView oTreeview                )                       {
   /*-------------------------------------------------------------------------*/
   /*-------------------------------------------------------------------------*/
   //                                                                         -----------------------------------
   CL.Trace("Initialize treeview")                                         ;  // Initialize treeview
   //                                                                         -----------------------------------
   myTRV = oTreeview                                                       ;  // Set treeview reference
   //                                                                         -----------------------------------
   myTRV.AfterSelect += new TreeViewEventHandler(this.myTrvSelect)         ;  // Set handlers
   //                                                                         -----------------------------------
}
private void myTrvLoad   (                                  )                       {
   /*-------------------------------------------------------------------------------*/
   /*-------------------------------------------------------------------------------*/
   string   sEid = ""                                                            ;  //
   string   sNme = ""                                                            ;  //
   TreeNode oTnd = null                                                          ;  //
   DataView oViw = null                                                          ;  //
   //                                                                               -----------------------------------
   myTRV.Nodes.Clear()                                                           ;  //
   myTRV.BeginUpdate()                                                           ;  //
   oTnd = myTRV.Nodes.Add("ROOT", "Sequence")                                    ;  //
   oViw = myDST.Tables["STEP"].DefaultView                                       ;  //
   oViw.Sort = "ORDER ASC"                                                       ;  //
   foreach(DataRow R in oViw.ToTable().Rows)                                     {  //
      sEid  = R["STEP_ID"].ToString()                                            ;  //
      sNme  = R["ORDER"].ToString() + " - "                                      ;  //
      sNme += R["NAME"].ToString()                                               ;  //
      CL.Trace("Add node [" + sEid + "][" + sNme + "]")                          ;  //
      oTnd.Nodes.Add(sEid, sNme)                                                 ;  //
   }                                                                                //
   myTRV.EndUpdate()                                                             ;  //
   //                                                                               -----------------------------------
   myTRV.ExpandAll()                                                             ;  //
   //                                                                               -----------------------------------
}
private void myTrvSelect (object sender, TreeViewEventArgs e)                       {
   /*-------------------------------------------------------------------------------*/
   /*-------------------------------------------------------------------------------*/
   //                                                                               -----------------------------------
   CL.TraceEvent()                                                               ;  //
   //                                                                               -----------------------------------
   if (myTRV.SelectedNode != null)                                               {  //
      switch (myTRV.SelectedNode.Level)                                          {  //
         case 0: myDgvStepsLoad()                        ; break                 ;  //
         case 1: myDgvValuesLoad(myTRV.SelectedNode.Name); break                 ;  //
      }                                                                             //
   }                                                                                //
   //                                                                               -----------------------------------
}
#endregion
#region ********** PRIVATE DataGridView   *******************************************
private void myDgvInit         (DataGridView oDataGridView                       )  {
   //                                                                               -----------------------------------
   CL.Trace("Initialize datagridview")                                           ;  // Variable grid view
   //                                                                               -----------------------------------
   myDGV = oDataGridView                                                         ;  // initialize members
   myDGV.AutoGenerateColumns = true                                              ;  //
   myDGV.DataSource          = myDST                                             ;  //
   //                                                                               -----------------------------------
   myDGV.RowsAdded        += new DataGridViewRowsAddedEventHandler  (myDGV_RowNew);  // Set handlers
   myDGV.RowsRemoved      += new DataGridViewRowsRemovedEventHandler(myDGV_RowDel);  //
   myDGV.CellValueChanged += new DataGridViewCellEventHandler       (myDGV_CellChanged)   ;  //
   myDGV.MouseDown        += new MouseEventHandler                  (myDGV_MouseDown)     ;  //
   //                                                                               -----------------------------------
}
private void myDgvStepsLoad    (                                                 )  {
   /*----------------------------------------------------------------------------*/
   /*----------------------------------------------------------------------------*/
   DataView oViw = myDST.Tables["STEP"].DefaultView                           ;  //
   //                                                                               -----------------------------------
   CL.Trace("Load steps list")                                                   ;  //
   myDGV.DataSource = oViw                                                       ;  //
   myCDT = "STEP"                                                                ;  //
   //                                                                               -----------------------------------
   myDGV.Columns["STEP_ID"].DisplayIndex     = 0                                 ;  // Set diplay order
   myDGV.Columns["STEP_ID"].Visible          = false                             ;  // Lock columns
   myDGV.Columns["TEMPLATE"].DisplayIndex    = 1                                 ;  //
   myDGV.Columns["TEMPLATE"].ReadOnly        = true                              ;  //
   myDGV.Columns["ORDER"].DisplayIndex       = 2                                 ;  //
   myDGV.Columns["NAME"].DisplayIndex        = 3                                 ;  //
   myDGV.Columns["NAME"].ReadOnly            = false                             ;  //
   myDGV.Columns["DESCRIPTION"].DisplayIndex = 4                                 ;  //
   //                                                                               -----------------------------------
   foreach (DataGridViewColumn C in myDGV.Columns)                               {  // Autofit columns
      C.AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells                   ;  //
   }                                                                                //
   //                                                                               -----------------------------------
}
private void myDgvValuesLoad   (string sStep = ""                                )  {
   /*----------------------------------------------------------------------------*/
   /*----------------------------------------------------------------------------*/
   DataView oViw = myDST.Tables["VALUE"].DefaultView                          ;  //
   //                                                                         -----------------------------------
   CL.Trace("load values of steps [" + sStep + "]")                           ;  //
   oViw.RowFilter = "STEP='" + sStep + "'"                                    ;  //
   myDGV.DataSource = oViw                                                    ;  //
   myCDT = "VALUE"                                                            ;  //
   //                                                                            -----------------------------------
   myDGV.Columns["STEP"].DisplayIndex = 0                                     ;  //
   myDGV.Columns["STEP"].Visible      = false                                 ;  //
   myDGV.Columns["NAME"].DisplayIndex = 1                                     ;  //
   myDGV.Columns["NAME"].ReadOnly     = true                                  ;  //
   myDGV.Columns["NAME"].InheritedStyle.ForeColor = System.Drawing.Color.Gray ;  //
   myDGV.Columns["TEXT"].DisplayIndex = 2                                     ;  //

   //                                                                         -----------------------------------
   foreach (DataGridViewColumn C in myDGV.Columns)                            {  // Autofit columns
      C.AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells                ;  //
   }                                                                             //
   //                                                                         -----------------------------------
}
private void myDGV_RowNew      (object sender, DataGridViewRowsAddedEventArgs e  )  {
   //                                                                               -----------------------------------
   CL.TraceEvent()                                                               ;  //
   //                                                                               -----------------------------------
   //                                                                               -----------------------------------
}
private void myDGV_RowDel      (object sender, DataGridViewRowsRemovedEventArgs e)  {
   //                                                                               -----------------------------------
   CL.TraceEvent()                                                               ;  //
   //                                                                               -----------------------------------
   //                                                                               -----------------------------------
}
private void myDGV_CellChanged (object sender, DataGridViewCellEventArgs e       )  {
   //                                                                               -----------------------------------
   CL.TraceEvent()                                                               ;  //
   //                                                                               -----------------------------------
   if (myTRV.SelectedNode != null)                                               {  //
      if (myTRV.SelectedNode.Level == 0)                                         {  //
         myTrvLoad()                                                             ;  //
      }                                                                             //
   }                                                                                //
   //                                                                               -----------------------------------
}
private void myDGV_MouseDown   (object sender, MouseEventArgs e                  )  {
   /*-------------------------------------------------------------------------------*/
   /*-------------------------------------------------------------------------------*/
   DataGridViewRow oRow = null                                                   ;  //
   //                                                                               -----------------------------------
   CL.TraceEvent()                                                               ;  //
   //                                                                               -----------------------------------
   if (myDGV.HitTest(e.X, e.Y).RowIndex < 0) { return ;                          }  //
   //                                                                               -----------------------------------
   if(e.Button == MouseButtons.Right)                                            {  // Right click on cell
      myDGV.ClearSelection()                                                     ;  //
      oRow = myDGV.Rows[myDGV.HitTest(e.X, e.Y).RowIndex]                        ;  //
      oRow.Selected = true                                                       ;  //
      switch(myCDT)                                                              {  //
         case "STEP" : myRcmStep(oRow)  ; break                                  ;  //
         case "VALUE": myRcmValue(oRow) ; break                                  ;  //
      }                                                                             //
   }                                                                                //
   //                                                                               -----------------------------------
}
#endregion
#region ********** PRIVATE RightClickMenu *******************************************
private void myRcmStep         (DataGridViewRow oRow                             )  {
   /*-------------------------------------------------------------------------------*/
   /*-------------------------------------------------------------------------------*/
   ToolStripMenuItem oItm = null                                                 ;  // Menuitem
   string            sNme = ""                                                   ;  // Generic name string
   //                                                                               -----------------------------------
   myRCM = new ContextMenuStrip()                                                ;  // Create menu
   myRCM.ItemClicked += myRcm_ItemClicked                                        ;  //
   //                                                                               -----------------------------------
   sNme = oRow.Cells[3].Value.ToString()                                         ;  // Add delete selected setp option
   oItm = new ToolStripMenuItem("Delete step [" + sNme + "]")                    ;  //
   oItm.Name = "STEP_DEL"                                                        ;  //
   oItm.Tag  = oRow.Cells[0].Value.ToString()                                    ;  //
   myRCM.Items.AddRange(new ToolStripItem[] { oItm })                            ;  //
   //                                                                               -----------------------------------
   foreach(DataRow R in myTpl.TableTemplate.Rows)                                {  // Add new step option
      sNme = R["NAME"].ToString()                                                ;  //
      oItm = new ToolStripMenuItem("Add step [" + sNme + "]")                    ;  //
      oItm.Name = "STEP_ADD"                                                     ;  //
      oItm.Tag  = R["NAME"].ToString()                                           ;  //
      myRCM.Items.AddRange(new ToolStripItem[] { oItm })                         ;  //
   }                                                                                //
   //                                                                               -----------------------------------
   myDGV.ContextMenuStrip = myRCM                                                ;  // Active menu
   //                                                                               -----------------------------------
}
private void myRcmValue        (DataGridViewRow oRow                             )  {
   /*-------------------------------------------------------------------------------*/
   /*-------------------------------------------------------------------------------*/
}
private void myRcm_ItemClicked (object sender, ToolStripItemClickedEventArgs e   )  {
   /*-------------------------------------------------------------------------------*/
   /*-------------------------------------------------------------------------------*/
   //                                                                               -----------------------------------
   CL.TraceEvent()                                                               ;  //
   //                                                                               -----------------------------------
   switch (e.ClickedItem.Name.ToUpper())                                         {  //
      case "STEP_DEL" : myDstStepDel(e.ClickedItem.Tag.ToString())   ; break     ;  //
      case "STEP_ADD" : myDstStepAdd(e.ClickedItem.Tag.ToString())   ; break     ;  //
   }                                                                                //
   //                                                                               -----------------------------------
}
#endregion
#region ********** PRIVATE PS1            *******************************************
private void myPS1Make (string sFile = "")                                          {
   /*----------------------------------------------------------------------------*/
   /*----------------------------------------------------------------------------*/
   string                 sTph = myTpl.Path                                   ;  //
   string                 sTxt = ""                                           ;  //
   string                 sFle = ""                                           ;  //
   System.IO.StreamReader oSrd = null                                         ;  //
   System.IO.StreamWriter oSwr = null                                         ;  //
   //                                                                            -----------------------------------
   sTxt += Environment.NewLine                                                ;  // Add templates function
   sTxt += "#region       HEAD           ###################################" ;  //
   sTxt += "################################################################" ;  //
   sTxt += Environment.NewLine                                                ;  //
   sFle = sTph + "\\" + myFHD                                                 ;  //
   CL.Trace("Add Header file [" + sFle + "]")                                 ;  //
   oSrd = new System.IO.StreamReader(sFle)                                    ;  //
   sTxt += oSrd.ReadToEnd() + Environment.NewLine                             ;  //
   sTxt += Environment.NewLine                                                ;  //
   sTxt += "#endregion    HEAD           ###################################" ;  //
   sTxt += "################################################################" ;  //
   /*
   //                                                                            -----------------------------------
   sTxt += Environment.NewLine                                                ;  // Add templates function
   sTxt += "#region       TEMPLATE       ###################################" ;  //
   sTxt += "################################################################" ;  //
   sTxt += Environment.NewLine                                                ;  //
   foreach (DataRow R in myDST.Tables["TEMPLATE"].Rows)                       {  //
      sFle = sTph + "\\" + R["SOURCE"].ToString()                             ;  //
      if (System.IO.File.Exists(sFle))                                        {  //
         CL.Trace("Add template file [" + sFle + "]")                         ;  //
         oSrd = new System.IO.StreamReader(sFle)                              ;  //
         sTxt += "function " + R["NAME"].ToString() + " {"                    ;  //
         sTxt += Environment.NewLine                                          ;  //
         sTxt += oSrd.ReadToEnd() + Environment.NewLine                       ;  //
         sTxt += "}" + Environment.NewLine                                    ;  //
      }                                                                          //
   }                                                                             //
   sTxt += Environment.NewLine                                                ;  //
   sTxt += "#endregion    TEMPLATE       ###################################" ;  //
   sTxt += "################################################################" ;  //
   //                                                                            -----------------------------------
   */
   sTxt += Environment.NewLine                                                ;  // Add Footer
   sTxt += "#region       MAIN           ###################################" ;  //
   sTxt += "################################################################" ;  //
   sTxt += Environment.NewLine                                                ;  //
   sFle = sTph + "\\" + myFMN                                                 ;  //
   CL.Trace("Add footer file [" + sFle + "]")                                 ;  //
   oSrd = new System.IO.StreamReader(sFle)                                    ;  //
   sTxt += oSrd.ReadToEnd()                                                   ;  //
   sTxt += Environment.NewLine                                                ;  //
   sTxt += "#endregion    MAIN           ###################################" ;  //
   sTxt += "################################################################" ;  //
   //                                                                            -----------------------------------
   CL.Trace("Write script file [" + sFile + "]")                              ;  // Write script file
   if (System.IO.File.Exists(sFile)  ) { System.IO.File.Delete(sFile) ;       }  //
   oSwr = new System.IO.StreamWriter(sFile, true)                             ;  //
   oSwr.WriteLine(sTxt)                                                       ;  //
   oSwr.Close()                                                               ;  //
   //                                                                            -----------------------------------
}
#endregion
}
}
