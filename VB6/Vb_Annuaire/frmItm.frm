VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "SHDOCVW.DLL"
Begin VB.Form frmItm 
   Caption         =   "Form1"
   ClientHeight    =   7860
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   12300
   LinkTopic       =   "Form1"
   ScaleHeight     =   7860
   ScaleWidth      =   12300
   StartUpPosition =   3  'Windows Default
   Begin SHDocVwCtl.WebBrowser wbbItm 
      Height          =   7365
      Left            =   5985
      TabIndex        =   1
      Top             =   210
      Width           =   6105
      ExtentX         =   10769
      ExtentY         =   12991
      ViewMode        =   0
      Offline         =   0
      Silent          =   0
      RegisterAsBrowser=   0
      RegisterAsDropTarget=   1
      AutoArrange     =   0   'False
      NoClientEdge    =   0   'False
      AlignLeft       =   0   'False
      ViewID          =   "{0057D0E0-3573-11CF-AE69-08002B2E1262}"
      Location        =   ""
   End
   Begin MSComctlLib.TreeView trvCat 
      Height          =   7572
      Left            =   240
      TabIndex        =   0
      Top             =   120
      Width           =   5652
      _ExtentX        =   9948
      _ExtentY        =   13361
      _Version        =   393217
      Style           =   7
      Appearance      =   1
   End
End
Attribute VB_Name = "frmItm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit



Const TRE_ID_INITIAL = 1



Private defaultTreID As Long



' Chargement de la form
'______________________________________________________________________________________________________________________
Private Sub Form_Load()

   ' Initialisation de l'arbre par défaut
   defaultTreID = TRE_ID_INITIAL
   
   ' Initialisation du treeview
   dtaTre.TrvInit trvCat, defaultTreID
   
   ' Initialisation du wbb
   wbbItm.Navigate2 "about:blanc"
   
End Sub



' Click sur le noeud du treeview
'______________________________________________________________________________________________________________________
Private Sub trvCat_NodeClick(ByVal Node As MSComctlLib.Node)

   ' Ajout des sous-noeuds dans l'arbre
   If Node.Children = 0 Then dtaTre.TrvAddSub trvCat, Node.Key, defaultTreID
   
   ' Mise à jour de items
   
   With dtaItm
      .ItmCatSelect Node.Key
      wbbItm.document.body.innerHTML = ""
      wbbItm.document.body.innerHTML = .ItmCatToHtml
   End With
   
End Sub
