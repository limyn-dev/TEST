VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Begin VB.Form ForWnd 
   Appearance      =   0  'Flat
   BackColor       =   &H80000004&
   Caption         =   "XXXXXXXXXXXXXXX"
   ClientHeight    =   7716
   ClientLeft      =   48
   ClientTop       =   384
   ClientWidth     =   10560
   FillColor       =   &H80000000&
   ForeColor       =   &H8000000F&
   LinkTopic       =   "Form1"
   Moveable        =   0   'False
   ScaleHeight     =   7716
   ScaleMode       =   0  'User
   ScaleWidth      =   10560
   StartUpPosition =   2  'CenterScreen
   Begin RichTextLib.RichTextBox rtxWnd 
      Height          =   2772
      Left            =   6120
      TabIndex        =   4
      Top             =   720
      Width           =   4332
      _ExtentX        =   7641
      _ExtentY        =   4890
      _Version        =   393217
      RightMargin     =   5
      TextRTF         =   $"main.frx":0000
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   9.6
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.PictureBox pctTempo 
      Appearance      =   0  'Flat
      BackColor       =   &H80000001&
      BorderStyle     =   0  'None
      FillColor       =   &H000000FF&
      FillStyle       =   5  'Downward Diagonal
      ForeColor       =   &H00C0C0C0&
      Height          =   132
      Left            =   120
      ScaleHeight     =   132
      ScaleWidth      =   15012
      TabIndex        =   3
      Top             =   11520
      Width           =   15012
   End
   Begin MSComctlLib.ListView lsvPro 
      Height          =   3972
      Left            =   6120
      TabIndex        =   2
      Top             =   3600
      Width           =   4332
      _ExtentX        =   7641
      _ExtentY        =   7006
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   0
   End
   Begin VB.CommandButton cmdUpdWnd 
      Caption         =   "Update"
      Height          =   372
      Left            =   240
      TabIndex        =   1
      Top             =   240
      Width           =   1452
   End
   Begin MSComctlLib.TreeView trvWnd 
      Height          =   6852
      Left            =   120
      TabIndex        =   0
      Top             =   720
      Width           =   5892
      _ExtentX        =   10393
      _ExtentY        =   12086
      _Version        =   393217
      Style           =   7
      Appearance      =   1
   End
End
Attribute VB_Name = "ForWnd"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit



'§§§§§§§§§§§§§§§§§§§§§§§§§ EVENEMENTS DU FORMULAIRE §§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Intialisation du formulaire
'==============================================================================
Private Sub Form_Load()

   Set ModwND.pros = lsvPro
   Set ModwND.wnds = trvWnd
   Set ModwND.wndv = rtxWnd
   ModwND.trvIni
   
   formOpen
End Sub

'------------------------------------------------------------------------------
' Clique sur le boutton de mise à jour
'==============================================================================
Private Sub cmdUpdWnd_Click()
   formClose
   
   ModwND.trvIni
   
   formOpen
End Sub

'------------------------------------------------------------------------------
' Séléction d'une propriété dans la listview
'==============================================================================
Private Sub lsvPro_ItemClick(ByVal Item As MSComctlLib.ListItem)
   Dim hdata As Long
   
   hdata = CLng(Item.SubItems(2))
   ModwND.proVal hdata
End Sub

'------------------------------------------------------------------------------
' Séléction d'une des windows du treeview
'==============================================================================
Private Sub trvWnd_NodeClick(ByVal Node As MSComctlLib.Node)
   formClose
   
   ' Ajout des enfants de la windows séléctionnés
   ModwND.trvAdd trvWnd, Node.Key
   
   ' Mise à jour des valeurs de la vindows
   ModwND.txtSet Node.Key

   ' Mise à jour de la listeview des propriétés
   ModwND.proSet Node.Key
   
   formOpen
End Sub

'------------------------------------------------------------------------------
'
'==============================================================================
Sub formOpen()
   
   With ForWnd
      .BackColor = 5
      .Caption = ""
      .Refresh
   End With
   
End Sub
Sub formClose()

   With ForWnd
      .BackColor = 1
      .Caption = "EN COURS"
      .Refresh
   End With
   
   
End Sub
