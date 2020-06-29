VERSION 5.00
Begin VB.Form forEdtEnt 
   Caption         =   "Etition de l'entité"
   ClientHeight    =   7410
   ClientLeft      =   45
   ClientTop       =   390
   ClientWidth     =   7710
   LinkTopic       =   "Form1"
   ScaleHeight     =   7410
   ScaleWidth      =   7710
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame fraSupport 
      Caption         =   "Supports"
      Height          =   4095
      Left            =   120
      TabIndex        =   3
      Top             =   2880
      Width           =   7455
      Begin VB.Frame fraTpeSup 
         Caption         =   "Types de supports"
         Height          =   3495
         Left            =   120
         TabIndex        =   6
         Top             =   240
         Width           =   2295
         Begin VB.OptionButton optTpeSup 
            Height          =   375
            Index           =   0
            Left            =   120
            TabIndex        =   7
            Top             =   240
            Visible         =   0   'False
            Width           =   2055
         End
      End
      Begin VB.ListBox lstTpeSel 
         Height          =   3375
         Index           =   1
         Left            =   4920
         TabIndex        =   5
         Top             =   360
         Width           =   2295
      End
      Begin VB.ListBox lstTpeDsp 
         Height          =   3375
         Index           =   0
         Left            =   2520
         TabIndex        =   4
         Top             =   360
         Width           =   2295
      End
   End
   Begin VB.Frame fraEntite 
      Caption         =   "Entité"
      Height          =   2655
      Index           =   0
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   7455
      Begin VB.TextBox txtAtributs 
         Appearance      =   0  'Flat
         BorderStyle     =   0  'None
         Height          =   300
         Index           =   0
         Left            =   3840
         TabIndex        =   2
         Top             =   360
         Width           =   3375
      End
      Begin VB.Label lblAtributs 
         BackColor       =   &H80000005&
         Height          =   300
         Index           =   0
         Left            =   120
         TabIndex        =   1
         Top             =   360
         Width           =   3735
      End
   End
End
Attribute VB_Name = "forEdtEnt"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim entite As C_Entite


Private Sub Form_Load()

   entite
End Sub
