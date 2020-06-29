VERSION 5.00
Begin VB.Form frmOrganisme 
   Caption         =   "Organismes Externes"
   ClientHeight    =   2190
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5940
   LinkTopic       =   "Form1"
   ScaleHeight     =   2190
   ScaleWidth      =   5940
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnCancel 
      Caption         =   "Annuler"
      Height          =   350
      Left            =   4800
      TabIndex        =   10
      Top             =   600
      Width           =   1000
   End
   Begin VB.CommandButton btnRecord 
      Caption         =   "Enregistrer"
      Height          =   350
      Left            =   4800
      TabIndex        =   9
      Top             =   200
      Width           =   1000
   End
   Begin VB.Frame fraOrg 
      Caption         =   "Organisme"
      Height          =   1900
      Left            =   100
      TabIndex        =   0
      Top             =   100
      Width           =   4575
      Begin VB.TextBox txtTel 
         Appearance      =   0  'Flat
         Height          =   315
         Left            =   800
         TabIndex        =   8
         Top             =   1450
         Width           =   3500
      End
      Begin VB.TextBox txtAdresse 
         Appearance      =   0  'Flat
         Height          =   315
         Left            =   800
         TabIndex        =   7
         Top             =   1050
         Width           =   3500
      End
      Begin VB.TextBox txtNom 
         Appearance      =   0  'Flat
         Height          =   315
         Left            =   800
         TabIndex        =   6
         Top             =   650
         Width           =   3500
      End
      Begin VB.ComboBox cboTypeOrganisme 
         Appearance      =   0  'Flat
         Height          =   315
         Left            =   800
         TabIndex        =   3
         Top             =   250
         Width           =   3500
      End
      Begin VB.Label lblTel 
         Appearance      =   0  'Flat
         BackColor       =   &H80000004&
         Caption         =   "Tel"
         ForeColor       =   &H80000008&
         Height          =   315
         Left            =   100
         TabIndex        =   5
         Top             =   1450
         Width           =   700
      End
      Begin VB.Label lblAdresse 
         Appearance      =   0  'Flat
         BackColor       =   &H80000004&
         Caption         =   "Adresse"
         ForeColor       =   &H80000008&
         Height          =   315
         Left            =   100
         TabIndex        =   4
         Top             =   1050
         Width           =   705
      End
      Begin VB.Label lblNom 
         Appearance      =   0  'Flat
         BackColor       =   &H80000004&
         Caption         =   "Nom"
         ForeColor       =   &H80000008&
         Height          =   315
         Left            =   100
         TabIndex        =   2
         Top             =   650
         Width           =   705
      End
      Begin VB.Label lblTypeOrganisme 
         Appearance      =   0  'Flat
         BackColor       =   &H80000004&
         Caption         =   "Type"
         ForeColor       =   &H80000008&
         Height          =   315
         Left            =   100
         TabIndex        =   1
         Top             =   250
         Width           =   705
      End
   End
End
Attribute VB_Name = "frmOrganisme"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Description = "User interface pour la gestion des organismes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"399EA10A0032"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Form"
'User interface pour la gestion des organismes
Option Explicit



'##ModelId=39A6E4700384
Public iUpDate As Boolean
'##ModelId=39A6E47100B5
Public myOrg As COrganisme




'******************************************************************************


' Instanciation du formulaire
'------------------------------------------------------------------------------
'##ModelId=39A6E4710122
Private Sub Form_Initialize()
Attribute Form_Initialize.VB_Description = " Instanciation du formulaire\r\n------------------------------------------------------------------------------"
    Set myOrg = New COrganisme
End Sub

' Désinstanciation du formulaire
'------------------------------------------------------------------------------
'##ModelId=39A6E47101C2
Private Sub Form_Terminate()
Attribute Form_Terminate.VB_Description = " Désinstanciation du formulaire\r\n------------------------------------------------------------------------------"
    Set myOrg = Nothing
End Sub

' Ouverture du formualire (show)
'------------------------------------------------------------------------------
'##ModelId=39A6E471029E
Private Sub Form_Load()
Attribute Form_Load.VB_Description = " Ouverture du formualire (show)\r\n------------------------------------------------------------------------------"
    setTpo
    If iUpDate Then
        With myOrg
            txtNom.Text = .nom
            txtAdresse.Text = .Adresse
            txtTel.Text = .Tel
            'cboVille
        End With
    Else
        txtNom.Text = ""
        txtAdresse.Text = ""
        txtTel.Text = ""
    End If
End Sub

' Fermeture du formulaire (hide)
'------------------------------------------------------------------------------
'##ModelId=39A6E4710348
Private Sub Form_Unload(Cancel As Integer)
Attribute Form_Unload.VB_Description = " Fermeture du formulaire (hide)\r\n------------------------------------------------------------------------------"
End Sub

' Initialisation de la combo des types d'organismes
'------------------------------------------------------------------------------
'##ModelId=39A6E47200DC
Private Sub setTpo()
Attribute setTpo.VB_Description = " Initialisation de la combo des types d'organismes\r\n------------------------------------------------------------------------------"
    Dim tpo As CTypeOrganisme
    Dim tps As CTypesOrganisme
    Set tps = tbltpo.ReadAll
    With cboTypeOrganisme
        .Clear
        For Each tpo In tps
            .AddItem tpo.Designation
            .ItemData(.NewIndex) = tpo.Id
        Next
    End With
    Set tps = Nothing
End Sub

 ' Enregistrement des changements
 '------------------------------------------------------------------------------
 '##ModelId=39A6E47201B8
 Private Sub btnRecord_Click()
Attribute btnRecord_Click.VB_Description = " Enregistrement des changements\r\n------------------------------------------------------------------------------"
    If iUpDate Then
        If tblOrg.Modify(myOrg) Then
            MsgBox "Modification effectuée."
        Else
            MsgBox "Erreur lors de la Modification."
        End If
    Else
        If tblOrg.Create(myOrg) Then
            MsgBox "Createion effectuée."
        Else
            MsgBox "Erreur lors de l'Createion."
        End If
    End If
    Me.Hide
End Sub

' Annulation
'------------------------------------------------------------------------------
'##ModelId=39A6E4720262
Private Sub btnCancel_Click()
Attribute btnCancel_Click.VB_Description = " Annulation\r\n------------------------------------------------------------------------------"
    Me.Hide
End Sub

' Modification des valeur de l'organisme
'------------------------------------------------------------------------------
'##ModelId=39A6E472033E
Private Sub txtNom_Validate(Cancel As Boolean)
Attribute txtNom_Validate.VB_Description = " Modification des valeur de l'organisme\r\n------------------------------------------------------------------------------"
    myOrg.nom = txtNom.Text
End Sub
'------------------------------------------------------------------------------
'##ModelId=39A6E47300D2
Private Sub txtAdresse_Validate(Cancel As Boolean)
Attribute txtAdresse_Validate.VB_Description = "------------------------------------------------------------------------------"
    myOrg.Adresse = txtAdresse.Text
End Sub
'------------------------------------------------------------------------------
'##ModelId=39A6E473024E
Private Sub txtTel_Validate(Cancel As Boolean)
Attribute txtTel_Validate.VB_Description = "------------------------------------------------------------------------------"
    myOrg.Tel = txtTel.Text
End Sub
'------------------------------------------------------------------------------
'##ModelId=39A6E4730398
Private Sub cboTypeOrganisme_Validate(Cancel As Boolean)
Attribute cboTypeOrganisme_Validate.VB_Description = "------------------------------------------------------------------------------"
    Dim idx As Long
    With mdlMain.tbltpo
        idx = cboTypeOrganisme.ListIndex
        If idx > 0 Then
            Set myOrg.TypeOrganisme = Nothing
            Set myOrg.TypeOrganisme = .ReadByTpoId(cboTypeOrganisme.ItemData(idx))
        End If
    End With
End Sub
