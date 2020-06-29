VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "Mscomctl.ocx"
Begin VB.Form forEntite 
   Caption         =   "Vues"
   ClientHeight    =   7695
   ClientLeft      =   135
   ClientTop       =   165
   ClientWidth     =   11805
   LinkTopic       =   "Form1"
   ScaleHeight     =   7695
   ScaleWidth      =   11805
   StartUpPosition =   2  'CenterScreen
   Begin MSComctlLib.Toolbar tlbMain 
      Align           =   1  'Align Top
      Height          =   420
      Left            =   0
      Negotiate       =   -1  'True
      TabIndex        =   8
      Top             =   0
      Width           =   11805
      _ExtentX        =   20823
      _ExtentY        =   741
      ButtonWidth     =   609
      ButtonHeight    =   582
      Appearance      =   1
      TextAlignment   =   1
      _Version        =   393216
      Begin MSComctlLib.ImageList imlTlb 
         Left            =   120
         Top             =   240
         _ExtentX        =   1005
         _ExtentY        =   1005
         BackColor       =   -2147483643
         MaskColor       =   12632256
         _Version        =   393216
      End
   End
   Begin MSComctlLib.StatusBar stbEntite 
      Align           =   2  'Align Bottom
      Height          =   375
      Left            =   0
      TabIndex        =   7
      Top             =   7320
      Width           =   11805
      _ExtentX        =   20823
      _ExtentY        =   661
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ImageList imlTpe 
      Left            =   120
      Top             =   6360
      _ExtentX        =   794
      _ExtentY        =   794
      BackColor       =   -2147483643
      ImageWidth      =   24
      ImageHeight     =   24
      MaskColor       =   12632256
      _Version        =   393216
   End
   Begin VB.Frame Frame1 
      Caption         =   "Détails"
      Height          =   6492
      Left            =   5520
      TabIndex        =   1
      Top             =   720
      Width           =   6252
      Begin VB.TextBox txtMaster 
         Appearance      =   0  'Flat
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
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
            Size            =   9.75
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
   Begin VB.Frame frmMaster 
      Caption         =   "Vue"
      Height          =   6492
      Left            =   0
      TabIndex        =   0
      Top             =   720
      Width           =   5445
      Begin MSComctlLib.TreeView trvCpo 
         Height          =   5412
         Left            =   240
         TabIndex        =   6
         Top             =   840
         Width           =   4932
         _ExtentX        =   8705
         _ExtentY        =   9551
         _Version        =   393217
         Style           =   7
         Appearance      =   1
      End
      Begin VB.ComboBox cboTpeViw 
         Height          =   315
         Left            =   1100
         TabIndex        =   4
         Top             =   300
         Width           =   4290
      End
      Begin VB.Label Label2 
         Caption         =   "Type de vue"
         Height          =   288
         Left            =   100
         TabIndex        =   5
         Top             =   300
         Width           =   1000
      End
   End
End
Attribute VB_Name = "forEntite"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Public ent As New C_Entite


'§§§§§§§§§§§§§§§§§§§§§§§§ Evenement sur la toolbar §§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Ajout d'un composant
'==============================================================================
Private Sub Tlb_ButtonClick(ByVal Button As MSComctlLib.Button)
   
   MsgBox Button.Key
   
End Sub

'------------------------------------------------------------------------------
' Séléction du type de composant à ajouter
'==============================================================================
Private Sub Tlb_ButtonMenuClick(ByVal ButtonMenu As MSComctlLib.ButtonMenu)

    tlb.Buttons(1).Key = ButtonMenu.Key
    

End Sub



'§§§§§§§§§§§§§§§§§§§§§§§§§ Evenement sur le treeview §§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Mise a jour de l'entité affichée en fonction de la selection du trv
'==============================================================================
Private Sub trvcpo_NodeClick(ByVal Node As Node)
   
   ' Initialisation de l'entité
   ent.EntId = ModTrv.key_Cpo(Node.Key)

   ' Affichage des attributs des composants de l'entité
   ent.atrAffiche lblMaster, txtMaster
   
   ' Ajout des noeuds des supports de l'entité
   ModTrv.addCpoLnk trvCpo, Node.Key
   
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
   ModTlb.btnAdd tlbMain, tbrDropdown, "Ajouter un composant", 1
   ModTlb.btnAdd tlbMain, tbrDefault, "Supprimer le composant", 2
   ModTlb.btnAdd tlbMain, tbrDefault, "Editer le composant", 3
   'ModTlb.btnAdd tlbMain, tbrDefault, "Ajouter un type", 4
   'ModTlb.btnAdd tlbMain, tbrDefault, "Supprimer le type", 5
   'ModTlb.btnAdd tlbMain, tbrDefault, "Editer le type", 6
   
   ' Initialisation du boutton des type de composant
   
   
   ' Initialisation du tree view
   ModTrv.initialise trvCpo, imlTpe
   
   ' Initialisation de la cbo des types
   ModDtb.cpoTpeCbo cboTpeViw
      
End Sub

'------------------------------------------------------------------------------
' Déchargement du formilaire
'==============================================================================
Private Sub Form_Unload(Cancel As Integer)
   
   ' Désallocation de l'entité
   ent.EntId = 0
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
   
   ' Reset du trv
   trvCpo.Nodes.Clear
   
   ' Mise à jour
   ModTrv.addCpoTpe trvCpo, tpeId
   
End Sub



