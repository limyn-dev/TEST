using System               ;
using System.Data          ;
using System.Windows.Forms ;

namespace CHK
{
public class CTemplates 
{
#region ********** MEMBERS                ********************************************
private const string           myDBF = "Templates.xml"                           ;  // Template DB file

private       string           myPTH = ""                                        ;  // Current path
private       DataSet          myDST = null                                      ;  // Templates DataSet
private       TreeView         myTRV = null                                      ;  // Treeview
private       DataGridView     myDGV = null                                      ;  // DataGridView
private       ContextMenuStrip myRCM = null                                      ;  // Right click menu
private       bool             myDTC = false                                     ;  // Data changed flag
private       string           myCDT = ""                                        ;  // Current displaed table
#endregion
#region ********** CONSTRUCTOR            ********************************************
public CTemplates(string sPath, TreeView oTreeview, DataGridView oDataGridView) { 
   /*-------------------------------------------------------------------------------*/
   /*-------------------------------------------------------------------------------*/
   //                                                                               -----------------------------------
   myPTH  = sPath                                                                ;  // Current path
   myDstInitialize()                                                             ;  // Open DB file
   myTrvInitialize(oTreeview)                                                    ;  // Initialze TRV
   myDgvInitialize(oDataGridView)                                                ;  // Initialize DGV
   //                                                                               -----------------------------------
   myTrvLoad()                                                                   ;  // Load treview
   //                                                                               -----------------------------------
}
#endregion
#region ********** SETTER/GETTER          ********************************************
public string    Path          { get { return myPTH                    ; } }   
public DataTable TableTemplate { get { return myDST.Tables["TEMPLATE"] ; } }   
public DataTable TableVariable { get { return myDST.Tables["VARIABLE"] ; } }   
#endregion 
#region ********** PUBLIC                 ********************************************
public void ScriptMake (string sScriptPath = "") { myScriptMake(sScriptPath) ; }
public void Save       ()                        { myDstSave()               ; }
#endregion 
#region ********** PRIVATE DataSet        ********************************************
private void myDstInitialize      ()                                                {
   /*-------------------------------------------------------------------------------*/
   /*-------------------------------------------------------------------------------*/
   string sFle = myPTH + "\\" + myDBF                                            ;  //
   //                                                                               -----------------------------------
   myDST = new DataSet("TEMPLATES")                                              ;  //
   //                                                                               -----------------------------------
   // sFle = System.IO.Path.GetDirectoryName(Application.ExecutablePath)      ;  //
   // sFle += "\\ElementsSchema.xml"                                          ;  //
   // Lg(" - Open [" + sFle + "]")                                            ;  //
   // myDST.ReadXmlSchema(sFle)                                               ;  //    Read schema
   //                                                                               -----------------------------------
   CL.Trace(" - Open [" + sFle + "]")                                            ;  // Open DB file
   myDST.ReadXml(sFle)                                                           ;  //
   //                                                                               -----------------------------------
   foreach(DataTable T in myDST.Tables)                                          {  // Set data events handlers
      T.RowChanged  += new DataRowChangeEventHandler(myDstTable_RowChange)       ;  //
      T.RowDeleted  += new DataRowChangeEventHandler(myDstTable_RowChange)       ;  //
      T.TableNewRow += new DataTableNewRowEventHandler(myDstTable_NewRow)        ;  //
   }                                                                                //
   //                                                                               -----------------------------------
}
private void myDstSave            ()                                                {
   /*-------------------------------------------------------------------------------*/
   /*-------------------------------------------------------------------------------*/
   string            sFle = myPTH + "\\" + myDBF                                 ;  //
   string            sMsg = "Save template change ?"                             ;  //
   int               nVer = 0                                                    ;  //
   MessageBoxButtons oMsb = MessageBoxButtons.YesNo                              ;  //
   //                                                                               -----------------------------------
   if (myDTC)                                                                    {  // Save DB to file
      if (MessageBox.Show(sMsg, "Save", oMsb) == DialogResult.Yes)               {  //
         nVer = System.Convert.ToInt32(myPGet("TEMPLATE_VERSION"))               ;  //
         myPSet("TEMPLATE_VERSION", (nVer+1).ToString())                         ;  //
         CL.Trace("Save file [" + sFle + "]")                                    ;  //
         myDST.WriteXml(sFle)                                                    ;  //
      }                                                                             //
   }                                                                                //
   //                                                                               -----------------------------------
}
private void myDstTable_RowChange (object sender, DataRowChangeEventArgs e)         {
   //                                                                            -----------------------------------
   CL.TraceEvent()                                                            ;  //
   myDTC = true                                                               ;  //
   //                                                                            -----------------------------------
}
private void myDstTable_NewRow    (object sender, DataTableNewRowEventArgs e)       {        
   CL.TraceEvent()                                                            ;  //
   //                                                                            -----------------------------------
   myDTC = true                                                               ;  // Flag data changed
   //                                                                            -----------------------------------
}
#endregion 
#region ********** PRIVATE TreeView       ********************************************
private void myTrvInitialize (TreeView oTreeview)                                   {
   /*-------------------------------------------------------------------------------*/
   /*-------------------------------------------------------------------------------*/      
   myTRV = oTreeview                                                             ;  // Init TreeView
   //                                                                               -----------------------------------
   myTRV.AfterSelect += new TreeViewEventHandler(this.myTrv_Select)               ;  // Set Handlers
   //                                                                               -----------------------------------   
}
private void myTrvLoad       ()                                                     {
   /*-------------------------------------------------------------------------------*/
   /*-------------------------------------------------------------------------------*/
   string   sEid = ""                                                            ;  //
   string   sNme = ""                                                            ;  //
   TreeNode oTnd = null                                                          ;  //
   DataView oViw = null                                                          ;  //
   //                                                                               -----------------------------------
   CL.Trace("Initialize treeview")                                               ;  // Initialize treeview
   myTRV.Nodes.Clear()                                                           ;  //
   myTRV.BeginUpdate()                                                           ;  //
   oTnd = myTRV.Nodes.Add("ROOT", "Templates")                                   ;  //
   oViw = myDST.Tables["TEMPLATE"].DefaultView                                   ;  //
   oViw.Sort = "NAME ASC"                                                        ;  //
   foreach(DataRow R in oViw.ToTable().Rows)                                     {  //
      sEid  = R["NAME"].ToString()                                               ;  //
      sNme  = R["CATEGORY"].ToString() + " - "                                   ;  //
      sNme += R["OBJECT"].ToString()   + " - "                                   ;  //
      sNme += R["ACTION"].ToString()                                             ;  //
      CL.Trace("Add node [" + sEid + "][" + sNme + "]")                          ;  //
      oTnd.Nodes.Add(sEid, sNme)                                                 ;  //
   }                                                                                //
   myTRV.EndUpdate()                                                             ;  //
   //                                                                               -----------------------------------
   myTRV.ExpandAll()                                                             ;  //
   //                                                                               -----------------------------------
   }
private void myTrv_Select    (object sender, TreeViewEventArgs e)                   {
   //                                                                               -----------------------------------
   CL.TraceEvent()                                                               ;  //
   //                                                                               -----------------------------------         
   if (myTRV.SelectedNode != null)                                               {  //
      switch (myTRV.SelectedNode.Level)                                          {  //
         case 0 : myDgvLoadTemplate()                       ; break              ;  //
         case 1 : myDgvLoadVariable(myTRV.SelectedNode.Name); break              ;  //
      }                                                                             //
   }                                                                                //
   //                                                                               -----------------------------------
}
#endregion 
#region ********** PRIVATE DataGridView   ********************************************
private void myDgvInitialize     (DataGridView oDataGridView                     )  {
   /*-------------------------------------------------------------------------------*/
   /*-------------------------------------------------------------------------------*/
   myDGV = oDataGridView                                                         ;  // Init DataGridView
   //                                                                               -----------------------------------
   myDGV.AutoGenerateColumns = true                                              ;  //
   myDGV.DataSource          = myDST                                             ;  //
   //                                                                               -----------------------------------
   myDGV.RowsAdded        += new DataGridViewRowsAddedEventHandler(myDgv_RowsAdded)   ; // Set event handlers
   myDGV.CellValueChanged += new DataGridViewCellEventHandler     (myDgv_CellChanged) ; //
   myDGV.MouseDown        += new MouseEventHandler                (myDgv_MouseDown)   ; //
   //                                                                               -----------------------------------
}
private void myDgvLoadTemplate   ()                                                 {
   /*-------------------------------------------------------------------------------*/
   /*-------------------------------------------------------------------------------*/
   DataView oViw = myDST.Tables["TEMPLATE"].DefaultView                          ;  //
   //                                                                               -----------------------------------
   CL.Trace("Load template")                                                     ;  // Bind data
   myDGV.DataSource = oViw                                                       ;  //
   myCDT = "TEMPLATE"                                                            ;  //
   //                                                                               -----------------------------------
   myDGV.Columns["CATEGORY"].DisplayIndex = 0                                    ;  // Columns order
   myDGV.Columns["OBJECT"].DisplayIndex   = 1                                    ;  //
   myDGV.Columns["ACTION"].DisplayIndex   = 2                                    ;  //
   myDGV.Columns["NAME"].DisplayIndex     = 3                                    ;  //
   myDGV.Columns["SOURCE"].DisplayIndex   = 4                                    ;  //
   //                                                                               -----------------------------------
   foreach (DataGridViewColumn C in myDGV.Columns)                               {  // Autofit columns
      C.AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells                   ;  //
   }                                                                                //
   //                                                                               -----------------------------------
}
private void myDgvLoadVariable   (string sTemplate = ""                          )  {
   /*-------------------------------------------------------------------------------*/
   /*-------------------------------------------------------------------------------*/
   DataView oViw = myDST.Tables["VARIABLE"].DefaultView                          ;  //
   //                                                                               -----------------------------------
   CL.Trace("Loading variables related to template [sTemplate]")                 ;  //
   oViw.RowFilter =  "TEMPLATE='" + sTemplate + "'"                              ;  //
   myDGV.DataSource = oViw                                                       ;  //
   myCDT = "VARIABLE"                                                            ;  //
   //                                                                               -----------------------------------
   myDGV.Columns["TEMPLATE"].DisplayIndex = 0                                    ;  //
   myDGV.Columns["NAME"].DisplayIndex     = 1                                    ;  //
   myDGV.Columns["DEFAULT"].DisplayIndex  = 2                                    ;  //
   //                                                                               -----------------------------------
   foreach (DataGridViewColumn C in myDGV.Columns)                               {  // Autofit columns
      C.AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells                   ;  //
   }                                                                                //
   //                                                                               -----------------------------------
}
private void myDgvDeleteSelected (                                               )  {
   /*-------------------------------------------------------------------------------*/
   /*-------------------------------------------------------------------------------*/
   int nIdx = myDGV.SelectedRows[0].Index                                        ;  //
   //                                                                               -----------------------------------
   CL.Trace("Remove row [" + nIdx + "]")                                         ;  //
   myDGV.Rows.RemoveAt(nIdx)                                                     ;  //
   //                                                                               -----------------------------------
}
private void myDgv_RowsAdded     (object sender, DataGridViewRowsAddedEventArgs e)  {
   //                                                                            -----------------------------------
   CL.TraceEvent()                                                            ;  //
   //                                                                            -----------------------------------
}
private void myDgv_CellChanged   (object sender, DataGridViewCellEventArgs e     )  {
   //                                                                            -----------------------------------
   CL.TraceEvent()                                                            ;  //
   //                                                                            -----------------------------------
   if (myTRV.SelectedNode.Level == 0)                                         { 
      myTrvLoad()                                                             ; 
   }                        
   //                                                                            -----------------------------------
}
private void myDgv_MouseDown     (object sender, MouseEventArgs e                )  {
   /*----------------------------------------------------------------------------*/
   /*----------------------------------------------------------------------------*/
   int nRow = myDGV.HitTest(e.X, e.Y).RowIndex                                   ;  //
   //                                                                               -----------------------------------
   CL.TraceEvent()                                                               ;  //
   //                                                                               -----------------------------------
   if(e.Button == MouseButtons.Right)                                            {  // Right click on cell
      myDGV.ClearSelection()                                                     ;  //
      myDGV.Rows[nRow].Selected = true                                           ;  //
      switch(myCDT)                                                              {  //
         case "TEMPLATE": myRcmTemplate(nRow) ; break                            ;  //
         case "VARIABLE": myRcmVariable(nRow) ; break                            ;  //
      }                                                                             //
   }                                                                                //
   //                                                                               -----------------------------------
}
#endregion
#region ********** PRIVATE RightClickMenu ********************************************
private void myRcmTemplate     (int nRowIndex = 0)                                  {
   /*-------------------------------------------------------------------------------*/
   /*-------------------------------------------------------------------------------*/
   ToolStripMenuItem oItm = null                                                 ;  //
   //                                                                               -----------------------------------
   myRCM = new ContextMenuStrip()                                                ;  //
   myRCM.ItemClicked += myRcm_ItemClicked                                        ;  //
   oItm = new ToolStripMenuItem("Delete record [" + nRowIndex + "]")             ;  //
   oItm.Name = "TEMPLATE_DELETE"                                                 ;  //
   myRCM.Items.AddRange(new ToolStripItem[] { oItm })                            ;  //
   myDGV.ContextMenuStrip = myRCM                                                ;  //
   //                                                                               -----------------------------------
}
private void myRcmVariable     (int nRowIndex = 0)                                  {
   /*-------------------------------------------------------------------------------*/
   /*-------------------------------------------------------------------------------*/
   ToolStripMenuItem oItm = null                                                 ;  //
   //                                                                               -----------------------------------
   myRCM = new ContextMenuStrip()                                                ;  //
   myRCM.ItemClicked += myRcm_ItemClicked                                        ;  //
   oItm = new ToolStripMenuItem("Delete variable [" + nRowIndex + "]")           ;  //
   oItm.Name = "VARIABLE_DELETE"                                                 ;  //
   myRCM.Items.AddRange(new ToolStripItem[] { oItm })                            ;  //
   myDGV.ContextMenuStrip = myRCM                                                ;  //
   //                                                                               -----------------------------------
}
private void myRcm_ItemClicked (object sender, ToolStripItemClickedEventArgs e)     {
   /*-------------------------------------------------------------------------------*/
   /*-------------------------------------------------------------------------------*/
   CL.TraceEvent()                                                               ;  //
   //                                                                               -----------------------------------
   switch (e.ClickedItem.Name)                                                   {  //
      case "TEMPLATE_DELETE" : myDgvDeleteSelected() ; break                     ;  //
   }                                                                                //
   //                                                                               -----------------------------------
}
#endregion 
#region ********** PRIVATE                ********************************************
private string myPGet            (string sName = ""           )                     {
   string sVal = ""                                                           ;  //
   //                                                                            --------------------------------------
   foreach(DataRow R in myDST.Tables["PROPERTY"].Rows )                       {  //
      if (R["NAME"].ToString().ToUpper() == sName.ToUpper())                  {  //
         sVal = R["VALUE"].ToString()                                         ;  //
         break                                                                ;  //
      }                                                                          //
   }                                                                             //
   //                                                                            --------------------------------------
   return sVal ;                                                                 //
}
private void   myPSet            (string sName, string sValue )                     {
   //                                                                            --------------------------------------
   foreach(DataRow R in myDST.Tables["PROPERTY"].Rows )                       {  //
      if (R["NAME"].ToString().ToUpper() == sName.ToUpper())                  {  //
         R["VALUE"] = sValue                                                  ;  //
         break                                                                ;  //
      }                                                                          //
   }                                                                             //
   //                                                                            --------------------------------------
}
#endregion 
}
}
