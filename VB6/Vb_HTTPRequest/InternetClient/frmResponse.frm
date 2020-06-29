VERSION 5.00
Begin VB.Form frmResponse 
   Caption         =   "Response"
   ClientHeight    =   5790
   ClientLeft      =   3120
   ClientTop       =   1935
   ClientWidth     =   7230
   LinkTopic       =   "Form1"
   ScaleHeight     =   5790
   ScaleWidth      =   7230
   Begin VB.CommandButton cmdDone 
      Cancel          =   -1  'True
      Caption         =   "&Done"
      Default         =   -1  'True
      Height          =   495
      Left            =   3060
      TabIndex        =   2
      Top             =   5235
      Width           =   1125
   End
   Begin VB.TextBox txtResult 
      Height          =   4365
      Left            =   240
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   1
      Text            =   "frmResponse.frx":0000
      Top             =   705
      Width           =   6690
   End
   Begin VB.Label lblResponse 
      AutoSize        =   -1  'True
      Caption         =   "RESPONSE FROM SERVER"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   1965
      TabIndex        =   0
      Top             =   375
      Width           =   2415
   End
End
Attribute VB_Name = "frmResponse"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdDone_Click()
Unload Me
End Sub

Private Sub Form_Load()
FormCenter Me
End Sub
