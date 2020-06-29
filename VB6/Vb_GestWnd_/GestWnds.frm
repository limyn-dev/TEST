VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "COMCTL32.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmMaster 
   Caption         =   "frmMaster"
   ClientHeight    =   10545
   ClientLeft      =   60
   ClientTop       =   375
   ClientWidth     =   14280
   LinkTopic       =   "Form1"
   ScaleHeight     =   10545
   ScaleWidth      =   14280
   StartUpPosition =   3  'Windows Default
   Begin MSComctlLib.ImageList imgLstLsv 
      Left            =   120
      Top             =   9960
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      MaskColor       =   12632256
      _Version        =   393216
   End
   Begin ComctlLib.TreeView trvWndShd 
      Height          =   10215
      Left            =   8520
      TabIndex        =   1
      Top             =   240
      Width           =   5655
      _ExtentX        =   9975
      _ExtentY        =   18018
      _Version        =   327682
      Style           =   7
      Appearance      =   1
   End
   Begin MSComctlLib.ListView lsvWndTop 
      Height          =   10215
      Left            =   120
      TabIndex        =   0
      Top             =   240
      Width           =   8295
      _ExtentX        =   14631
      _ExtentY        =   18018
      View            =   2
      Arrange         =   1
      LabelEdit       =   1
      Sorted          =   -1  'True
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      FullRowSelect   =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   0
   End
   Begin ComctlLib.ImageList imgLstTrv 
      Left            =   720
      Top             =   9960
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   18
      ImageHeight     =   18
      MaskColor       =   12632256
      _Version        =   327682
      BeginProperty Images {0713E8C2-850A-101B-AFC0-4210102A8DA7} 
         NumListImages   =   1
         BeginProperty ListImage1 {0713E8C3-850A-101B-AFC0-4210102A8DA7} 
            Picture         =   "GestWnds.frx":0000
            Key             =   "img1"
         EndProperty
      EndProperty
   End
End
Attribute VB_Name = "frmMaster"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

'------------------------------------------------------------------------------
' Chargement du formulaire
'==============================================================================
Private Sub Form_Load()
    Dim numWnd As Integer
    Dim nomWnd As String
    Dim nomcols() As String
    
    ' Initialisation de la liste view
    ModLsv.initial
    
    ' Création des colonnes
    ModLsv.addCol lsvWndTop, "Colonne1"
    ModLsv.addCol lsvWndTop, "Colonne2"
    ModLsv.addCol lsvWndTop, "Colonne3"
    
    
    
    
    ' Mise à jour de la liste de fenêtre
    'ModApi.setHdlWndTop
    
    ' chargement de la listview
    'For numWnd = 1 To UBound(ModApi.lstHdlWndTop)
    
        ' Recherche du nom de la fenêtre
        'nomWnd = ModApi.fndNomWnd(ModApi.lstHdlWndTop(numWnd))
        
       
    
    'Next numWnd
    
End Sub

'------------------------------------------------------------------------------
' Séléction d'une fenêtre dans la listview
'==============================================================================
Private Sub lsvWndTop_ItemClick(ByVal Item As MSComctlLib.ListItem)
    Dim hdlWnd As Long
    
    ' Reset du trv
    trvWndShd.Nodes.Clear
    
    ' recherche du hdl
    hdlWnd = CleHdl(Item.Key)
    
    ' Insértion du noeud dans le treeview
    trvWndShd.Nodes.Add , tvwFirst, Item.Key, ModApi.fndNomWnd(hdlWnd)
        
    ' Chargement du treeview avec les fenêtre enfants
    addWndShd trvWndShd, CleHdl(Item.Key)

End Sub

'------------------------------------------------------------------------------
' Ajout des fenêtres enfant dans le treeview
'==============================================================================
Sub addWndShd(ByRef trv As ComctlLib.TreeView, clePere As Long)
    Dim numWnd As Integer
    Dim nomNod As String
    Dim lstNod() As Long
    
    ' Mise à jour de la liste des fenêtre enfant
    ModApi.setHdlWndShd clePere
    
    ' Chargement du treeview avec les fenêtre enfants
    ReDim lstNod(0)
    For numWnd = 1 To UBound(ModApi.lstHdlWndShd)
    
        ' Saisie du hdl de la fenêtre
        ReDim lstNod(numWnd)
        lstNod(numWnd) = ModApi.lstHdlWndShd(numWnd)
        
        ' Ajout de la fenêtre dans le trv
        nomNod = ModApi.fndNomWnd(lstNod(numWnd))
        trv.Nodes.Add hdlCle(clePere), tvwChild, hdlCle(lstNod(numWnd)), nomNod
        
    Next numWnd
    
    ' Ajout des fenêtres enfant
    For numWnd = 1 To UBound(lstNod)
        addWndShd trv, lstNod(numWnd)
    Next numWnd
    
End Sub








Private Sub Text1_Change(Index As Integer)

End Sub
