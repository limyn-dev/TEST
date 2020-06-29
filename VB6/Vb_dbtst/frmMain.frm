VERSION 5.00
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "MSHFLXGD.OCX"
Begin VB.Form frmMain 
   Caption         =   "Form1"
   ClientHeight    =   6735
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9765
   LinkTopic       =   "Form1"
   ScaleHeight     =   6735
   ScaleWidth      =   9765
   StartUpPosition =   3  'Windows Default
   Begin MSHierarchicalFlexGridLib.MSHFlexGrid hfg 
      Height          =   4935
      Left            =   600
      TabIndex        =   0
      Top             =   720
      Width           =   8295
      _ExtentX        =   14631
      _ExtentY        =   8705
      _Version        =   393216
      _NumberOfBands  =   1
      _Band(0).Cols   =   2
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

'------------------------------------------------------------------------------
'  Initialisation, cloture de la forme
'==============================================================================
Private Sub Form_Initialize()

   ' Connection sur la DB
   M_Db.dbOpen
   
   ' Initialisation de grille
   With hfg
      Set .DataSource = M_Db.tbl
       .Rows = 10
      .Refresh
      .ColData 2
   End With
   
End Sub
'------------------------------------------------------------------------------
Private Sub Form_Terminate()

   ' Déconnexion de la DB
   M_Db.dbClose
   
End Sub
