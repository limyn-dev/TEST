VERSION 5.00
Begin VB.Form frmClient 
   Caption         =   "Clients"
   ClientHeight    =   6825
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   9720
   LinkTopic       =   "Form1"
   ScaleHeight     =   6825
   ScaleWidth      =   9720
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   495
      Left            =   6960
      TabIndex        =   6
      Top             =   4560
      Width           =   1695
   End
   Begin VB.TextBox Text1 
      DataField       =   "Société"
      DataSource      =   "Data1"
      Height          =   300
      Index           =   4
      Left            =   4080
      TabIndex        =   5
      Text            =   "Text1"
      Top             =   2160
      Width           =   2000
   End
   Begin VB.TextBox Text1 
      DataField       =   "Contact"
      DataSource      =   "Data1"
      Height          =   300
      Index           =   3
      Left            =   4080
      TabIndex        =   4
      Text            =   "Text1"
      Top             =   2760
      Width           =   2000
   End
   Begin VB.TextBox Text1 
      DataField       =   "Adresse"
      DataSource      =   "Data1"
      Height          =   300
      Index           =   2
      Left            =   4080
      TabIndex        =   3
      Text            =   "Text1"
      Top             =   3360
      Width           =   2000
   End
   Begin VB.TextBox Text1 
      DataField       =   "Code client"
      DataSource      =   "Data1"
      Height          =   300
      Index           =   0
      Left            =   4080
      TabIndex        =   2
      Text            =   "Text1"
      Top             =   1560
      Width           =   2000
   End
   Begin VB.Data Data1 
      Caption         =   "Data1"
      Connect         =   "Access"
      DatabaseName    =   ""
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      Exclusive       =   0   'False
      Height          =   615
      Left            =   4800
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   "Clients"
      Top             =   600
      Width           =   2535
   End
   Begin VB.ListBox List1 
      DataField       =   "Code client"
      DataMember      =   "Clients"
      DataSource      =   "dtaEnv"
      Height          =   3960
      Left            =   480
      TabIndex        =   1
      Top             =   1320
      Width           =   3255
   End
   Begin VB.ComboBox Combo1 
      DataField       =   "Société"
      DataMember      =   "Clients"
      DataSource      =   "dtaEnv"
      Height          =   315
      ItemData        =   "frmClient.frx":0000
      Left            =   360
      List            =   "frmClient.frx":0002
      TabIndex        =   0
      Text            =   "Combo1"
      Top             =   360
      Width           =   3735
   End
End
Attribute VB_Name = "frmClient"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim tblCli As ADODB.Recordset


'------------------------------------------------------------------------------
' Initialisation, férmeture de la forme
'==============================================================================
Private Sub Form_Initialize()

   ' Initialisation de la list des clients
   With dtaEnv.rstblClients
      While Not .EOF
         List1.AddItem .Fields(1).Value
         .MoveNext
      Wend
   End With
   
   With dtaEnv.rsTousLesClients
      While Not .EOF
         Combo1.AddItem .Fields(1).Value
         .MoveNext
      Wend
   End With
   
End Sub
'------------------------------------------------------------------------------
Private Sub Form_Terminate()

End Sub

Private Sub Command1_Click()
   
   Data1
End Sub

