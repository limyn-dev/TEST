VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmMain 
   Caption         =   "Membres"
   ClientHeight    =   5790
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   10185
   LinkTopic       =   "Form1"
   ScaleHeight     =   5790
   ScaleWidth      =   10185
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame3 
      Caption         =   "Frame3"
      Height          =   2115
      Left            =   4000
      TabIndex        =   5
      Top             =   3360
      Width           =   6000
   End
   Begin VB.Frame Frame2 
      Caption         =   "Frame2"
      Height          =   1590
      Left            =   4000
      TabIndex        =   4
      Top             =   1680
      Width           =   6000
   End
   Begin VB.Frame Frame1 
      Caption         =   "Frame1"
      Height          =   1380
      Left            =   4000
      TabIndex        =   1
      Top             =   210
      Width           =   6000
      Begin VB.TextBox txts 
         Appearance      =   0  'Flat
         Height          =   300
         Index           =   0
         Left            =   2000
         TabIndex        =   2
         Top             =   315
         Width           =   4000
      End
      Begin VB.Label lbls 
         Appearance      =   0  'Flat
         BackColor       =   &H80000004&
         ForeColor       =   &H80000008&
         Height          =   300
         Left            =   105
         TabIndex        =   3
         Top             =   315
         Width           =   1995
      End
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   105
      Top             =   5250
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      MaskColor       =   12632256
      _Version        =   393216
   End
   Begin MSComctlLib.TreeView trvMain 
      Height          =   5265
      Left            =   100
      TabIndex        =   0
      Top             =   210
      Width           =   3800
      _ExtentX        =   6694
      _ExtentY        =   9287
      _Version        =   393217
      Style           =   7
      Appearance      =   0
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit



'******************************************************************************


' Gestion de l'instance
'-----------------------------------------------------------------------------
Private Sub Form_Activate()
End Sub
Private Sub Form_Initialize()
End Sub
Private Sub Form_Load()
End Sub
Private Sub Form_Terminate()
End Sub

' Gestion du treeview
'-----------------------------------------------------------------------------


' Mise à jour du formulaire
'-----------------------------------------------------------------------------
Private Sub setFormFam(fam As CFamille)
End Sub
Private Sub setFormPrs(fam As CFamille, prs As CPersonne)
End Sub

