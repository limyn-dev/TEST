VERSION 5.00
Begin VB.Form forEdtRef 
   ClientHeight    =   4440
   ClientLeft      =   48
   ClientTop       =   384
   ClientWidth     =   5724
   LinkTopic       =   "Form1"
   ScaleHeight     =   4440
   ScaleWidth      =   5724
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame Frame2 
      Height          =   4092
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   5412
      Begin VB.TextBox Text1 
         Height          =   288
         Left            =   2760
         TabIndex        =   6
         Top             =   360
         Width           =   2412
      End
      Begin VB.ComboBox Combo1 
         Height          =   288
         Left            =   240
         TabIndex        =   5
         Top             =   360
         Width           =   2412
      End
      Begin VB.ListBox lstPropose 
         Height          =   2736
         Left            =   240
         TabIndex        =   4
         Top             =   720
         Width           =   2412
      End
      Begin VB.ListBox lstSelect 
         Height          =   2736
         Left            =   2760
         TabIndex        =   3
         Top             =   720
         Width           =   2412
      End
      Begin VB.CommandButton btnRmv 
         Caption         =   "<"
         Height          =   252
         Index           =   0
         Left            =   2040
         TabIndex        =   2
         Top             =   3600
         Width           =   612
      End
      Begin VB.CommandButton btnAdd 
         Caption         =   ">"
         Height          =   252
         Index           =   1
         Left            =   2760
         TabIndex        =   1
         Top             =   3600
         Width           =   612
      End
   End
End
Attribute VB_Name = "forEdtRef"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

