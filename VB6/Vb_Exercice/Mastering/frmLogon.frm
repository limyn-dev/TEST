VERSION 5.00
Begin VB.Form frmLogon 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Enter Program Password"
   ClientHeight    =   3195
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   2  'CenterScreen
   Begin VB.PictureBox imgLogo 
      Height          =   375
      Left            =   3720
      Picture         =   "frmLogon.frx":0000
      ScaleHeight     =   315
      ScaleWidth      =   555
      TabIndex        =   7
      Top             =   240
      Width           =   615
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      Height          =   375
      Left            =   2880
      TabIndex        =   6
      Top             =   2640
      Width           =   1455
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Enabled         =   0   'False
      Height          =   375
      Left            =   1080
      TabIndex        =   5
      Top             =   2640
      Width           =   1455
   End
   Begin VB.TextBox txtPassword 
      Height          =   285
      IMEMode         =   3  'DISABLE
      Left            =   2040
      PasswordChar    =   "*"
      TabIndex        =   4
      Top             =   1800
      Width           =   2055
   End
   Begin VB.TextBox txtUserName 
      Height          =   285
      Left            =   2040
      TabIndex        =   3
      Top             =   960
      Width           =   2055
   End
   Begin VB.Label lblPassword 
      Caption         =   "&Password"
      Height          =   495
      Left            =   240
      TabIndex        =   2
      Top             =   1680
      Width           =   1455
   End
   Begin VB.Label lblUserName 
      Caption         =   "&User Name"
      Height          =   495
      Left            =   240
      TabIndex        =   1
      Top             =   960
      Width           =   1455
   End
   Begin VB.Label lblinstruction 
      Caption         =   "Type your name and password to log on"
      Height          =   495
      Left            =   240
      TabIndex        =   0
      Top             =   120
      Width           =   2895
   End
End
Attribute VB_Name = "frmLogon"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub cmdCancel_Click()
    MsgBox "This is the Cancel button"
    End
End Sub

Private Sub cmdOK_Click()
    MsgBox "User Name = " & txtUserName.Text & _
            ", Password = " & txtPassword.Text
    Unload frmLogon
End Sub



Private Sub imgLogo_Click()
    imgLogo.Picture = LoadPicture("D:\Labs\lab02\Solution\Face03.ico")
End Sub

Private Sub txtPassword_Change()
    If txtUserName.Text <> "" And txtPassword.Text <> "" Then
        cmdOK.Enabled = True
    Else
        cmdOK.Enabled = False
    End If
End Sub


Private Sub txtUserName_Change()
    If txtUserName.Text <> "" And txtPassword.Text <> "" Then
        cmdOK.Enabled = True
    Else
        cmdOK.Enabled = False
    End If
End Sub

