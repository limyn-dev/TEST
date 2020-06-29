VERSION 5.00
Begin VB.Form frmLogon 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Enter Program Password"
   ClientHeight    =   1605
   ClientLeft      =   1755
   ClientTop       =   3525
   ClientWidth     =   6015
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   1605
   ScaleWidth      =   6015
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Enabled         =   0   'False
      Height          =   375
      Left            =   4680
      TabIndex        =   5
      Top             =   600
      Width           =   1215
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      Height          =   375
      Left            =   4680
      TabIndex        =   6
      Top             =   1080
      Width           =   1215
   End
   Begin VB.TextBox txtUserName 
      Height          =   285
      Left            =   1920
      TabIndex        =   2
      Top             =   600
      Width           =   2415
   End
   Begin VB.TextBox txtPassword 
      Height          =   285
      IMEMode         =   3  'DISABLE
      Left            =   1920
      PasswordChar    =   "*"
      TabIndex        =   4
      Top             =   960
      Width           =   2415
   End
   Begin VB.Image imgLogo 
      Height          =   480
      Left            =   240
      Picture         =   "frmLogon.frx":0000
      Top             =   360
      Width           =   480
   End
   Begin VB.Label lblPassword 
      Caption         =   "&Password"
      Height          =   255
      Left            =   1080
      TabIndex        =   3
      Top             =   960
      Width           =   735
   End
   Begin VB.Label lblUserName 
      Caption         =   "&User Name"
      Height          =   255
      Left            =   1080
      TabIndex        =   1
      Top             =   600
      Width           =   855
   End
   Begin VB.Label lblInstructions 
      Caption         =   "Type your name and password to log on."
      Height          =   255
      Left            =   1080
      TabIndex        =   0
      Top             =   240
      Width           =   3255
   End
End
Attribute VB_Name = "frmLogon"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public gblnCancel As Boolean

Private Sub cmdCancel_Click()
    gblnCancel = True
    Unload frmLogon
End Sub

Private Sub cmdOK_Click()
    MsgBox "User Name = " & txtUserName.Text & _
        ", Password = " & txtPassword.Text
    gblnCancel = False
    frmLogon.Hide
End Sub

Private Sub imgLogo_Click()
    imgLogo.Picture = LoadPicture("face03.ico")
End Sub

Private Sub txtPassword_Change()
    If txtUserName.Text <> "" And txtPassword <> "" Then
        cmdOK.Enabled = True
    End If

End Sub

Private Sub txtUserName_Change()
    If txtUserName.Text <> "" And txtPassword <> "" Then
        cmdOK.Enabled = True
    End If
End Sub
