VERSION 5.00
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "SHDOCVW.dll"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Begin VB.Form frmDoc 
   Caption         =   "Form1"
   ClientHeight    =   4488
   ClientLeft      =   48
   ClientTop       =   324
   ClientWidth     =   4836
   LinkTopic       =   "Form1"
   ScaleHeight     =   4488
   ScaleWidth      =   4836
   StartUpPosition =   3  'Windows Default
   Begin RichTextLib.RichTextBox rtbDtl 
      Height          =   1212
      Left            =   2400
      TabIndex        =   4
      Top             =   2640
      Width           =   1812
      _ExtentX        =   3203
      _ExtentY        =   2142
      _Version        =   393217
      Enabled         =   -1  'True
      ScrollBars      =   3
      TextRTF         =   $"frmDoc.frx":0000
   End
   Begin VB.CommandButton btnViw 
      Caption         =   "Next view"
      Height          =   252
      Left            =   3000
      TabIndex        =   3
      Top             =   480
      Width           =   1092
   End
   Begin VB.TextBox txtAdr 
      Appearance      =   0  'Flat
      BorderStyle     =   0  'None
      Height          =   288
      Left            =   240
      TabIndex        =   1
      Top             =   480
      Width           =   2652
   End
   Begin MSComctlLib.TreeView trvDoc 
      Height          =   1452
      Left            =   2280
      TabIndex        =   0
      Top             =   960
      Width           =   1812
      _ExtentX        =   3203
      _ExtentY        =   2562
      _Version        =   393217
      Style           =   7
      Appearance      =   0
   End
   Begin SHDocVwCtl.WebBrowser wbbDoc 
      Height          =   2892
      Left            =   240
      TabIndex        =   2
      Top             =   960
      Width           =   1932
      ExtentX         =   3408
      ExtentY         =   5101
      ViewMode        =   0
      Offline         =   0
      Silent          =   0
      RegisterAsBrowser=   0
      RegisterAsDropTarget=   1
      AutoArrange     =   0   'False
      NoClientEdge    =   0   'False
      AlignLeft       =   0   'False
      NoWebView       =   0   'False
      HideFileNames   =   0   'False
      SingleClick     =   0   'False
      SingleSelection =   0   'False
      NoFolders       =   0   'False
      Transparent     =   0   'False
      ViewID          =   "{0057D0E0-3573-11CF-AE69-08002B2E1262}"
      Location        =   "http:///"
   End
End
Attribute VB_Name = "frmDoc"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit



' Marges
Const V_SEP = 50  ' Séparation vérticale des élément
Const H_SEP = 50  ' Séparation horizontale des élément
Const V_MRG = 100 ' Marge verticatle
Const H_MRG = 400 ' Marge horizontale



' Type de vue
Const VIW_BRS = 1
Const VIW_TRE = 2
Const VIW_BRS_TRE = 3
Const VIW_BRS_TRE_DTL = 4
Const VIW_MIN = VIW_BRS
Const VIW_MAX = VIW_BRS_TRE_DTL



' Vue courante
Private myView



' Initialisation de la form
'______________________________________________________________________________________________________________________
Private Sub Form_Load()

   ' Initialisation du type d'affichage
   myView = VIW_BRS
   
   ' Initialisation du wbbDoc
   wbbDoc.Navigate "about:blanc"
   
   ' Initialisation du wbbElm
   Me.rtbDtl.Text = ""
   
End Sub



' Changement de vue
'______________________________________________________________________________________________________________________
Private Sub btnViw_Click()
   
   ' Changement de vue
   If myView < VIW_MAX Then
      myView = myView + 1
   Else
      myView = VIW_MIN
   End If
   
   ' Mise à jour de l'affichage
   Arrange
   
End Sub



' Changement de la taille de la fenêtre
'______________________________________________________________________________________________________________________
Private Sub Form_Resize()
   
   ' Mise à jour de l'affichage
   Arrange
   
End Sub




' Navigation
'______________________________________________________________________________________________________________________
Private Sub txtAdr_Validate(Cancel As Boolean)
   
   ' chargement du document dans le wbbDoc
   wbbDoc.Navigate2 Me.txtAdr.Text
   
End Sub



' Détaile du noeud
'______________________________________________________________________________________________________________________
Private Sub trvDoc_NodeClick(ByVal Node As MSComctlLib.Node)
   Dim oDoc As HTMLDocument: Set oDoc = wbbDoc.Document
   
   ' Mise à jour des détail du noeud
   mdlDHTML.LoadRtbElm oDoc.All.Item(Node.Key), Me.rtbDtl
   
End Sub



' Document chargé dans le brooser
'______________________________________________________________________________________________________________________
Private Sub wbbDoc_DocumentComplete(ByVal pDisp As Object, URL As Variant)
   
   ' Initialisation du treeview
   trvDoc.Nodes.Clear
   trvDoc.Nodes.Add , , "r", txtAdr.Text
   
   ' Chargement des noeuds du document
   mdlDHTML.LoadChild trvDoc, "r", wbbDoc.Document.body.children
   
End Sub



'/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////0



' Position des éléments sur la feuille
'______________________________________________________________________________________________________________________
Private Sub Arrange()

   ' Position de la barre d'adresse
   With Me.txtAdr
      .Width = Me.Width - 3 * V_SEP - V_MRG - btnViw.Width
      .Top = H_SEP
      .Left = V_SEP
   End With
         
   ' Position du boutton
   With Me.btnViw
      .Height = Me.txtAdr.Height
      .Top = Me.txtAdr.Top
      .Left = V_SEP + txtAdr.Width + V_SEP
   End With
   
   ' Position du browser
   ArrangeWbbDoc
   
   ' Position du treeview
   ArrangeTrvDoc
   
   ' Position du détail des éléments
   ArrangeRtbDtl
   
End Sub



' Position du browser
'______________________________________________________________________________________________________________________
Private Sub ArrangeWbbDoc()
   With Me.wbbDoc
      Select Case myView
                  
         ' Brooser seul
         Case VIW_BRS
            .Width = Me.Width - 2 * V_SEP - V_MRG
            .Height = Me.Height - 3 * H_SEP - H_MRG - Me.txtAdr.Height
            .Top = Me.txtAdr.Top + Me.txtAdr.Height + H_SEP
            .Left = Me.txtAdr.Left
         
         ' Browser + treeview
         Case VIW_BRS_TRE, VIW_BRS_TRE_DTL
            .Width = (Me.Width - 3 * V_SEP - V_MRG) / 2
            .Height = Me.Height - 3 * H_SEP - H_MRG - Me.txtAdr.Height
            .Top = Me.txtAdr.Top + Me.txtAdr.Height + H_SEP
            .Left = Me.txtAdr.Left
      
         ' Autre cas
         Case Else
            .Width = 0
            .Height = 0
      
      End Select
   End With
End Sub



' Position du treview
'______________________________________________________________________________________________________________________
Private Sub ArrangeTrvDoc()
   With Me.trvDoc
      Select Case myView
      
         ' Treeview uniquement
         Case VIW_TRE
            .Visible = True
            .Width = Me.Width - 2 * V_SEP - V_MRG
            .Height = Me.Height - 3 * H_SEP - H_MRG - Me.txtAdr.Height
            .Top = Me.txtAdr.Top + Me.txtAdr.Height + H_SEP
            .Left = Me.txtAdr.Left
         
         ' Browser et treeview
         Case VIW_BRS_TRE
            .Visible = True
            .Width = Me.wbbDoc.Width
            .Height = Me.wbbDoc.Height
            .Top = Me.wbbDoc.Top
            .Left = Me.wbbDoc.Left + Me.wbbDoc.Width + V_SEP
      
         ' Les trois panneau
         Case VIW_BRS_TRE_DTL
            .Visible = True
            .Width = Me.wbbDoc.Width
            .Height = (Me.Height - 4 * H_SEP - H_MRG - Me.txtAdr.Height) / 2
            .Top = Me.wbbDoc.Top
            .Left = Me.wbbDoc.Left + Me.wbbDoc.Width + V_SEP
      
         ' Autres
         Case Else
            .Width = 0
            .Height = 0

            
      End Select
   End With
End Sub



' Position de wbbElm
'______________________________________________________________________________________________________________________
Private Sub ArrangeRtbDtl()
   With Me.rtbDtl
      Select Case myView
      
         ' Affichage des trois panel
         Case VIW_BRS_TRE_DTL
            .Visible = True
            .Width = Me.trvDoc.Width
            .Height = Me.trvDoc.Height
            .Top = Me.trvDoc.Top + Me.trvDoc.Height + H_SEP
            .Left = Me.trvDoc.Left
            
         ' Autres
         Case Else
            .Width = 0
            .Height = 0
            
      End Select
   End With
End Sub





