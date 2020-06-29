VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form forEntite 
   Caption         =   "Vues"
   ClientHeight    =   10668
   ClientLeft      =   132
   ClientTop       =   168
   ClientWidth     =   11808
   LinkTopic       =   "Form1"
   ScaleHeight     =   10668
   ScaleWidth      =   11808
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame fraCpcEnt 
      Caption         =   "Composants de l'entité"
      Height          =   5532
      Left            =   5520
      TabIndex        =   9
      Top             =   4680
      Width           =   6252
      Begin MSComctlLib.TreeView trvCpc 
         Height          =   5172
         Left            =   120
         TabIndex        =   10
         Top             =   240
         Width           =   6012
         _ExtentX        =   10605
         _ExtentY        =   9123
         _Version        =   393217
         Style           =   7
         Appearance      =   1
      End
   End
   Begin MSComctlLib.Toolbar tlbMain 
      Align           =   1  'Align Top
      Height          =   420
      Left            =   0
      Negotiate       =   -1  'True
      TabIndex        =   8
      Top             =   0
      Width           =   11808
      _ExtentX        =   20828
      _ExtentY        =   741
      ButtonWidth     =   699
      ButtonHeight    =   699
      AllowCustomize  =   0   'False
      Appearance      =   1
      Style           =   1
      _Version        =   393216
      BorderStyle     =   1
      Begin MSComctlLib.ImageList imlTlb 
         Left            =   120
         Top             =   240
         _ExtentX        =   995
         _ExtentY        =   995
         BackColor       =   -2147483643
         MaskColor       =   12632256
         _Version        =   393216
      End
   End
   Begin MSComctlLib.StatusBar stbEnt 
      Align           =   2  'Align Bottom
      Height          =   372
      Left            =   0
      TabIndex        =   7
      Top             =   10296
      Width           =   11808
      _ExtentX        =   20828
      _ExtentY        =   656
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ImageList imlTpe 
      Left            =   720
      Top             =   240
      _ExtentX        =   804
      _ExtentY        =   804
      BackColor       =   -2147483643
      ImageWidth      =   24
      ImageHeight     =   24
      MaskColor       =   12632256
      _Version        =   393216
   End
   Begin VB.Frame fraAtrEnt 
      Caption         =   "Attributs de l'entité"
      Height          =   3852
      Left            =   5520
      TabIndex        =   1
      Top             =   720
      Width           =   6252
      Begin VB.TextBox txtMaster 
         Appearance      =   0  'Flat
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.6
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   250
         Index           =   0
         Left            =   3120
         TabIndex        =   2
         Top             =   360
         Visible         =   0   'False
         Width           =   3000
      End
      Begin VB.Label lblMaster 
         Alignment       =   1  'Right Justify
         BackColor       =   &H80000005&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.6
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   252
         Index           =   0
         Left            =   120
         TabIndex        =   3
         Top             =   360
         Visible         =   0   'False
         Width           =   3000
      End
   End
   Begin VB.Frame fraLstCpo 
      Caption         =   "Liste des composants"
      Height          =   9492
      Left            =   0
      TabIndex        =   0
      Top             =   720
      Width           =   5445
      Begin MSComctlLib.TreeView trvCpo 
         Height          =   8652
         Left            =   120
         TabIndex        =   6
         Top             =   720
         Width           =   5172
         _ExtentX        =   9123
         _ExtentY        =   15261
         _Version        =   393217
         Style           =   7
         Appearance      =   1
      End
      Begin VB.ComboBox cboTpeViw 
         Height          =   288
         Left            =   1200
         TabIndex        =   4
         Top             =   300
         Width           =   4056
      End
      Begin VB.Label Label2 
         Caption         =   "Type de vue"
         Height          =   288
         Left            =   120
         TabIndex        =   5
         Top             =   300
         Width           =   996
      End
   End
   Begin VB.Shape Shape1 
      Height          =   132
      Left            =   4440
      Top             =   10560
      Width           =   852
   End
End
Attribute VB_Name = "forEntite"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

' Constentes de position des objets graphiques
Const FRATOP = 250   ' Début des frames
Const FRADST = 100   ' Distance entre les contrôles d'une frame
Const FRABTM = 100   ' Marge du bas des frame
Const FORTOP = 500   ' Début du formulaire
Const FORBTM = 200   ' Marge du bas du formulaire
Const FORDST = 100   ' Distance entre les contrôles d'un formulaire
Const LBLSZE = 300   ' Hauteur des labels et textbox des attributs
Const CBOSZE = 288   ' Taille de la combobox des type


Public ent As New C_Entite   ' Entite du composant séléctionné



'*************************** Evenement sur la toolbar *************************

'------------------------------------------------------------------------------
' Ajout d'un composant
'==============================================================================
Private Sub TlbMain_ButtonClick(ByVal Button As MSComctlLib.Button)
   Dim cpo As New C_Composant
   
   ' Initialisation du composant
   cpo.CpoId = ent.entId
   
   Select Case Button.Index
   
      ' Création du nouveau composant
      Case 1
         forComposant.Show
         
      ' Suppression du composant
      Case 2
         cpo.CpoId = ent.entId
         cpo.cpoDel
         setFor
      
      ' Edition du composant sélectionné
      Case 3
         forComposant.cpo.CpoId = cpo.CpoId
         forComposant.Show
         
      ' Edition du type de l'entité
      Case 4
         forType.tpe.tpeId = cpo.tpeId
         forType.Show
         
      ' Création de la fiche
      Case 5
         setFch
         
   End Select
   
   ' Désallocation
   Set cpo = Nothing
   
End Sub



'§§§§§§§§§§§ EVENEMENTS SUR LE TREEVIEW DR LA LISTE DES COMPOSANT §§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Mise a jour de l'entité affichée en fonction de la selection du trv
'==============================================================================
Private Sub trvcpo_NodeClick(ByVal Node As Node)
   Dim cpo As New C_Composant
   
   ' Initialisation de l'entité
   ent.entId = ModTrv.key_Cpo(Node.Key)

   ' Affichage des attributs des composants de l'entité
   cpo.CpoId = ent.entId
   fraAtrEnt.Caption = "Attributs de : " & cpo.CpoDsc
   ent.atrAffiche lblMaster, txtMaster
   
   ' Mise à jour de l'apparence du formulaire
   dimFor ent.AtrNbr
   
   ' Affichage des composant contenus dans l'entité
   fraCpcEnt.Caption = "Contenu de : " & cpo.CpoDsc
   trvCpc.Nodes.Clear
   trvCpc.Nodes.Add , , Node.Key, Node.Text, Node.Image
   ModTrv.addCpc trvCpc, Node.Key
   
   ' Ajout des noeuds des supports de l'entité
   ModTrv.addCps trvCpo, Node.Key
   
   ' Désallocation
   Set cpo = Nothing
   
End Sub



'§§§§§§§§§§§ EVENEMENTS SUR LE TREEVIEW DES COMPOSANTS DE CONTENUS §§§§§§§§§§§§

'------------------------------------------------------------------------------
' Mise a jour des composants contenus dans l'entité
'==============================================================================
Private Sub trvCpc_NodeClick(ByVal Node As MSComctlLib.Node)

   ModTrv.addCpc trvCpc, Node.Key
   trvCpc.Nodes.Item(Node.Index).Expanded = True
   
End Sub

'§§§§§§§§§§§§§§§§§§§§ Evenement sur la combobox des types §§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Mise a jour du trv en fonction du type selectionné
'==============================================================================
Private Sub cboTpeViw_Click()
  
   ' Initialisation du formulaire
   setFor
   
End Sub



'§§§§§§§§§§§§§§§§§§§§§§§§ Evenement sur le formulaire §§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Chargement du formulaire
'==============================================================================
Private Sub Form_Load()
   Dim lstCpo As New C_LstCpo
   
   ' Initialisation de la connection
   ModDtb.dbSetCon
   
   ' Initialisation des imageListes
   ModIml.iniIcoTpe imlTpe
   ModIml.iniIcoTlb imlTlb
   
   ' Initialisation de la toolbar
   ModTlb.initialise tlbMain, imlTlb
   ModTlb.btnAdd tlbMain, tbrDefault, "", "Ajout d'un composant", 1
   ModTlb.btnAdd tlbMain, tbrDefault, "", "Suppression du composant", 2
   ModTlb.btnAdd tlbMain, tbrDefault, "", "Edition du composant", 3
   'ModTlb.btnAdd tlbMain, tbrDefault, "", "Ajout d'un type", 4
   'ModTlb.btnAdd tlbMain, tbrDefault, "", "Suppression du type", 5
   ModTlb.btnAdd tlbMain, tbrDefault, "", "Edition du type", 6
   ModTlb.btnAdd tlbMain, tbrDefault, "", "Création d'une fiche", 7
   
   ' Initialisation du tree view
   ModTrv.initialise trvCpo, imlTpe
   ModTrv.initialise trvCpc, imlTpe
   
   ' Initialisation de la cbo des types
   ModDtb.tpeCbo cboTpeViw
   cboTpeViw.ListIndex = 1
      
End Sub

'------------------------------------------------------------------------------
' Déchargement du formilaire
'==============================================================================
Private Sub Form_Unload(Cancel As Integer)
   
   ' Désallocation de l'entité
   ent.entId = 0
   Set ent = Nothing
   
   ' Fermeture de la connexion
   ModDtb.dbDelCon
   
End Sub



'§§§§§§§§§§§§§§§§§§§§§§§§ Evenement sur le formulaire §§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Mise é jour du formulaire en fonction du type de composant séléctioné
'==============================================================================
Sub setFor()
   Dim tpeId As Long
   
   ' Recherche du type selectionné
   With cboTpeViw
      tpeId = .ItemData(.ListIndex)
   End With
   
   ' Mise à jour du treeview des composants
   trvCpo.Nodes.Clear
   ModTrv.addCpoTpe trvCpo, tpeId
   
End Sub



'§§§§§§§§§§§§§§§§§§§§§§§§§ OUTILS SUR LE FORMULAIRE §§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Dimentionnement du formualaire en fonction du nombre d'attribut affichés
'==============================================================================
Private Sub dimFor(nbrAtr As Integer)
   Dim posTop As Long
   
   ' Dimention des contrôles
   fraAtrEnt.Height = FRATOP + nbrAtr * LBLSZE + (nbrAtr - 1) * FRADST + FRABTM
   fraLstCpo.Height = fraAtrEnt.Height + FORDST + fraCpcEnt.Height
   
   cboTpeViw.Top = FRATOP
   
   trvCpo.Height = fraLstCpo.Height - FRATOP - CBOSZE - FRADST - FRABTM
   trvCpo.Top = FRATOP + CBOSZE + FRADST
   
   trvCpc.Height = fraCpcEnt.Height - FRATOP - FRABTM
   trvCpc.Top = FRATOP
   
   forEntite.Height = FORTOP + tlbMain.Height + FORDST + fraLstCpo.Height + FORDST + stbEnt.Height
   
   ' Position des contrôles
   posTop = tlbMain.Height + FORDST
   fraLstCpo.Top = posTop
   fraAtrEnt.Top = posTop
      
   posTop = posTop + fraAtrEnt.Height + FORDST
   fraCpcEnt.Top = posTop
   
End Sub



'§§§§§§§§§§§§§§§§§§§§§§§§§§§§ OUTILS DE LA FICHE §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Création de la fiche de l'entité
'==============================================================================
Private Sub setFch()
   Dim lne As Integer
   Dim cpo As New C_Composant
   Dim cps As New C_Composant
   Dim tps As New C_Type
   
   ' Ouverture du document
   ModWrd.docIni
   
   With ent
   
      ' Initialisation du composant
      cpo.CpoId = ent.entId
      
      ' Valorisation des données de l'entité
      ModWrd.dtaAdd cpo.CpoDsc, cpo.TpeNom
      
      ' Création de tableau des attributs
      For lne = 1 To .AtrNbr
   
         ' Ajout de la ligne
         ModWrd.atrAdd .AtrNom(lne), .AtrVal(lne)
         
      Next lne
   
      ' Création du tableau des support
      For lne = 1 To cpo.CpsNbr
      
         ' Initialisation du composant support
         cps.CpoId = cpo.cpsId(lne)
         
         ' Initialisation du type
         tps.tpeId = cps.tpeId
         
         ' Ajout de la ligne
         ModWrd.SupAdd cps.CpoDsc, tps.TpeNom
         
      Next lne
      
      ' Fermeture du rapport
      ModWrd.docCls .AtrVal(1)
   
   End With
   
   Set cpo = Nothing
   Set cps = Nothing
   Set tps = Nothing
   
End Sub


