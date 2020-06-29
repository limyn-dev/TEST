VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form frmMain 
   Caption         =   "Form1"
   ClientHeight    =   4207
   ClientLeft      =   35
   ClientTop       =   294
   ClientWidth     =   6853
   LinkTopic       =   "Form1"
   ScaleHeight     =   4207
   ScaleWidth      =   6853
   StartUpPosition =   3  'Windows Default
   Begin MSComctlLib.ImageList imgMain 
      Left            =   0
      Top             =   3920
      _ExtentX        =   503
      _ExtentY        =   503
      BackColor       =   -2147483643
      MaskColor       =   12632256
      _Version        =   393216
   End
   Begin MSComctlLib.ListView lsvMain 
      Height          =   3829
      Left            =   2646
      TabIndex        =   1
      Top             =   196
      Width           =   4417
      _ExtentX        =   7792
      _ExtentY        =   6760
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   0
   End
   Begin MSComctlLib.TreeView trvMain 
      Height          =   3829
      Left            =   98
      TabIndex        =   0
      Top             =   196
      Width           =   2555
      _ExtentX        =   4511
      _ExtentY        =   6760
      _Version        =   393217
      Style           =   7
      Appearance      =   1
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
