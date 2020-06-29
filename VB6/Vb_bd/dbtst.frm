VERSION 5.00
Object = "{F0D2F211-CCB0-11D0-A316-00AA00688B10}#1.0#0"; "MSDATLST.OCX"
Object = "{0ECD9B60-23AA-11D0-B351-00A0C9055D8E}#6.0#0"; "mshflxgd.ocx"
Begin VB.Form frmScanDb 
   Caption         =   "Form1"
   ClientHeight    =   8385
   ClientLeft      =   45
   ClientTop       =   390
   ClientWidth     =   8820
   LinkTopic       =   "Form1"
   ScaleHeight     =   8385
   ScaleWidth      =   8820
   StartUpPosition =   3  'Windows Default
   Begin VB.ComboBox cboLstFld 
      Height          =   288
      Left            =   6960
      TabIndex        =   13
      Text            =   "Combo1"
      Top             =   360
      Width           =   1692
   End
   Begin VB.CommandButton btnAfficherfld 
      Caption         =   "Liste du champ"
      Height          =   492
      Left            =   6960
      TabIndex        =   12
      Top             =   4680
      Width           =   1692
   End
   Begin MSDataListLib.DataList dtlAfficheFld 
      Height          =   3888
      Left            =   6960
      TabIndex        =   11
      Top             =   720
      Width           =   1692
      _ExtentX        =   2990
      _ExtentY        =   6641
      _Version        =   393216
   End
   Begin VB.ComboBox cboTpeTbl 
      Height          =   288
      Left            =   1440
      TabIndex        =   10
      Text            =   "Combo1"
      Top             =   360
      Width           =   1332
   End
   Begin VB.CommandButton btnVewPrc 
      Caption         =   "Afficher la commande de procedure"
      Height          =   492
      Left            =   120
      TabIndex        =   9
      Top             =   7560
      Width           =   1812
   End
   Begin VB.CommandButton btnVewTbl 
      Caption         =   "Afficher la table"
      Height          =   492
      Left            =   240
      TabIndex        =   8
      Top             =   4680
      Width           =   1812
   End
   Begin VB.CommandButton btnAddPrc 
      Caption         =   "ajouter une procedure"
      Height          =   492
      Left            =   2040
      TabIndex        =   7
      Top             =   7560
      Width           =   1692
   End
   Begin MSHierarchicalFlexGridLib.MSHFlexGrid hfgAfficherRst 
      Height          =   3852
      Left            =   240
      TabIndex        =   6
      Top             =   720
      Width           =   6612
      _ExtentX        =   11668
      _ExtentY        =   6800
      _Version        =   393216
      Rows            =   3
      AllowUserResizing=   3
      _NumberOfBands  =   1
      _Band(0).Cols   =   2
   End
   Begin VB.CommandButton btnRunCmd 
      Caption         =   "Executer la commande"
      Height          =   492
      Left            =   3840
      TabIndex        =   5
      Top             =   7560
      Width           =   1932
   End
   Begin VB.TextBox txtOutTxt 
      Height          =   1575
      Left            =   120
      MultiLine       =   -1  'True
      TabIndex        =   4
      Top             =   5880
      Width           =   6732
   End
   Begin VB.ComboBox cboLstPrc 
      Height          =   288
      Left            =   1920
      TabIndex        =   2
      Text            =   "Combo1"
      Top             =   5520
      Width           =   2892
   End
   Begin VB.ComboBox cboLstTbl 
      Height          =   288
      Left            =   2760
      TabIndex        =   0
      Text            =   "Combo1"
      Top             =   360
      Width           =   2892
   End
   Begin VB.Label lblLstPrc 
      Caption         =   "Liste des procédures"
      Height          =   252
      Left            =   120
      TabIndex        =   3
      Top             =   5520
      Width           =   1692
   End
   Begin VB.Label lblLstTbl 
      Caption         =   "Liste des tables"
      Height          =   252
      Left            =   240
      TabIndex        =   1
      Top             =   360
      Width           =   1332
   End
End
Attribute VB_Name = "frmScanDb"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Const NOMDB = "data\Comptoir.mdb"
Const NOMDB2 = "Data\UsrData2.mdb"
Const DBTST = "Data\dbtst.mdb"

Dim con As ADODB.Connection

'******************************************************************************
' Actions des bouttons
'==============================================================================
Private Sub btnAddPrc_Click()

   'Ajout de la command
   Call db_prc.ajouterPrc(con, InputBox("Nom de la commande"), txtOutTxt.Text)

End Sub

Private Sub btnAfficherfld_Click()

   ' Mise à jour de la dtc
   Call db_Tbl.loadDtlFld(con, cboLstTbl.Text, cboLstFld.Text, dtlAfficheFld)
   
End Sub

Private Sub btnRunCmd_Click()

   ' Saisie des paramètre des procédures
   Dim params() As Variant
   Dim iPrm As Long
   For iPrm = 1 To db_prc.foundNbrPrm(con, cboLstPrc.Text)
        ReDim Preserve params(iPrm)
        params(iPrm) = InputBox("Valeur du paramètre" & CStr(iPrm))
   Next iPrm
   
   ' Execution de la commande de la procedure
   Call db_prc.loadHfgPrc(con, cboLstPrc.Text, params, hfgAfficherRst)
   
End Sub

Private Sub btnVewPrc_Click()

  ' Affichage de la commande de la procedure séléctionnée
    txtOutTxt.Text = db_prc.foundTxtPrc(con, cboLstPrc.Text)
    
End Sub

Private Sub btnVewTbl_Click()

   ' Recherche du type de table
   Dim tpeTbl As T_TpeTbl
   tpeTbl = cboTpeTbl.ListIndex + 1
   
   ' Chargement du hfg avec les données de la table séléctionnée
   Call db_Tbl.loadHfgTbl(con, cboLstTbl.Text, hfgAfficherRst)
   
   ' Mise à jour de la cbo des fld
   Call db_Tbl.loadCboLstFld(con, cboLstTbl.Text, cboLstFld)

End Sub


Private Sub cboTpeTbl_LostFocus()

   ' Initialisation de la combobox des nom des tables
   Call db_Tbl.loadCboLstTbl(con, cboTpeTbl.ListIndex, cboLstTbl)

End Sub

'------------------------------------------------------------------------------
' Chargement et déchargement de la forme
'==============================================================================
Private Sub Form_Load()
   
   ' Connection sur la DB
   Set con = db_con.ouvrirJet(NOMDB, "", "")
   
   ' Initialisation de la combo des types des tables
   With cboTpeTbl
      .Clear
      .AddItem ("Tous")
      .AddItem ("Standard")
      .AddItem ("System")
      .AddItem ("Global")
   End With
      
   ' Initialisation de la combobox des nom des tables
   cboLstTbl.Clear
   Call db_Tbl.loadCboLstTbl(con, TBLSTD, cboLstTbl)
   
   ' Initialisation de la combobox des nom des Procedues
   cboLstPrc.Clear
   Call db_prc.loadCboLstPrc(con, cboLstPrc)
   
   ' Initialisation de la grille
   With hfgAfficherRst
   End With
 
End Sub

Private Sub Form_Unload(Cancel As Integer)

    ' Fermeture de la connection
    Call fermerCon(con)
    
    ' Suppression du rst de la datagrid


End Sub

