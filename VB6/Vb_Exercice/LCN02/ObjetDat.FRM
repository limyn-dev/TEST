VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3990
   ClientLeft      =   1095
   ClientTop       =   1515
   ClientWidth     =   7365
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   3990
   ScaleWidth      =   7365
   Begin VB.TextBox Text1 
      DataField       =   "OrganizationName"
      DataSource      =   "Data1"
      Height          =   375
      Left            =   2640
      TabIndex        =   0
      Text            =   "Text1"
      Top             =   2520
      Width           =   2175
   End
   Begin VB.Data Data1 
      Caption         =   "Shops.mdb"
      Connect         =   "Access"
      DatabaseName    =   "C:\Vb\Exercice\Lcn02\Shops.mdb"
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      Exclusive       =   0   'False
      Height          =   300
      Left            =   2640
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   "Customers"
      Top             =   3000
      Width           =   2175
   End
   Begin VB.Label Label1 
      Caption         =   "Nom"
      Height          =   375
      Left            =   1440
      TabIndex        =   1
      Top             =   2520
      Width           =   1095
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

