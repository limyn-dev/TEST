Add-Type -AssemblyName System.Windows.Forms
#
# ********** GLOBAL ***************************************************************************************************
#
[object] $script:FRM = $null
[object] $script:DGV = $null
[object] $script:TBL = $null
#
# ********** FUNCTIONS ************************************************************************************************
#
function DATA_Init   {

   [object] $C = $null
   [object] $R = $null

   $script:TBL = New-Object System.Data.DataTable
   $C = New-Object System.Data.DataColumn 'NAME',([string])
   $script:TBL.Columns.Add($C)
   $C = New-Object System.Data.DataColumn 'DATA',([string])
   $script:TBL.Columns.Add($C)

   $R = $script:TBL.NewRow()
   $R.'NAME' = 'Name_01'
   $R.'DATA' = 'Data_01'
   $script:TBL.Rows.Add($R)

   $R = $script:TBL.NewRow()
   $R.'NAME' = 'Name_02'
   $R.'DATA' = 'Data_02'
   $script:TBL.Rows.Add($R)

   $R = $script:TBL.NewRow()
   $R.'NAME' = 'Name_03'
   $R.'DATA' = 'Data_03'
   $script:TBL.Rows.Add($R)
   
}
function UI_Init     {

   [object] $S = $null
   [object] $P = $null

   $script:FRM = New-Object system.Windows.Forms.Form
   $script:FRM.Text = "Form"
   $script:FRM.TopMost = $true
   $script:FRM.Width = 651
   $script:FRM.Height = 362

   $S = New-Object System.Drawing.Size
   $S.Width = 492
   $S.Height = 308
   $P = New-Object System.Drawing.Point
   $P.X = 13
   $P.Y = 48
   $script:DGV                 = New-Object System.Windows.Forms.DataGrid
   $script:DGV.Size            = $S
   $script:DGV.Location        = $P
   $script:DGV.HeaderForeColor = [System.Drawing.Color]::FromArgb(255,0,0,0)
   $script:DGV.Name            = "dataGrid1"
   $script:DGV.DataMember      = ""
   $script:DGV.TabIndex        = 0
   $script:DGV.DataSource      = $script:TBL
   $script:DGV.DataBindings.DefaultDataSourceUpdateMode = 0
   $script:FRM.Controls.Add($script:DGV)


}
#
# ********** ENTRY POINT **********************************************************************************************
#

DATA_Init

UI_Init

[void]$script:FRM.ShowDialog()
$script:FRM.Dispose()
#
# ********** EOF ******************************************************************************************************
