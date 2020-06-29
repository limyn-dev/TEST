VERSION 5.00
Begin VB.Form frmPersonne 
   Caption         =   "Personne"
   ClientHeight    =   7110
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7275
   LinkTopic       =   "Form1"
   ScaleHeight     =   7110
   ScaleWidth      =   7275
   StartUpPosition =   3  'Windows Default
End
Attribute VB_Name = "frmPersonne"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

' Position des contrôles
Private Const CTRL_TOP = 2000
Private Const CTRL_HEIGHT = 315
Private Const CTRL_LEFT = 100

' Etats du formulaire
Private Const STATE_SELFAM = 0  ' En attente de séléction d'une famille
Private Const STATE_EDTFAM = 1  ' Edition de la famille ou séléction de la personne
Private Const STATE_EDTPRS = 2  ' Edition de la personne et de la famille

' Tables
Public TblFam As CTblFam
Public TblPrs As CTblPrs
Public TblCat As CTblCat

' Membres
Private state As Integer








'******************************************************************************



' Chargement du formulaire
'------------------------------------------------------------------------------
Private Sub Form_Load()
    Dim cat As Integer
    
    ' Mise à jour des checkbox des catégories
    cat = TblCat.chkLoad(chkCat, CTRL_TOP, CTRL_LEFT, CTRL_HEIGHT)
    
    ' Mise à jour de la taille de la frame
    If cat > 7 Then
        fraFam.Height = CTRL_TOP + CTRL_HEIGHT * cat
    Else
        fraFam.Height = CTRL_TOP + 2200
    End If
    
    ' Mise à jour de la taille de la forme
    Me.Height = fraFam.Height + 700
    
    ' Mise à jour de l'état du formulaire
    state = STATE_SELFAM: setState
    
End Sub

' Mise en forme du formulaire
'------------------------------------------------------------------------------
Private Sub setState()
    Dim cat As Integer
    
    Select Case state
    
        Case STATE_SELFAM ' en attente de séléction d'une famille
    
            ' Gestion des champs
            lstNom.Enabled = True: lstNom.Clear
            cboPrn.Enabled = False: cboPrn.Clear
            txtNai.Enabled = False: txtNai.Text = ""
            txtAdr.Enabled = False: txtAdr.Text = ""
            txtNpa.Enabled = False: txtNpa.Text = ""
            txtCty.Enabled = False: txtCty.Text = ""
            TblFam.LoadLst lstNom
            
            ' Gestion des checkbox
            For cat = 1 To chkCat.Count
                chkCat(cat - 1).Enabled = False: chkCat(cat - 1).Value = 0
            Next cat
            
            ' Désactivation des bouttons
            btnNewFam.Enabled = True
            btnNewPrs.Enabled = False
            btnSave.Enabled = False
            btnClear.Enabled = False
            btnClose.Enabled = True
            
        Case STATE_EDTFAM
        
            ' Blocage des champs inutilisés
            cboPrn.Enabled = True
            txtNai.Enabled = False: txtNai.Text = ""
            txtAdr.Enabled = True
            txtNpa.Enabled = True
            txtCty.Enabled = True
            
            ' Gestion des checkbox
            For cat = 1 To chkCat.Count
                chkCat(cat - 1).Enabled = False: chkCat(cat - 1).Value = 0
            Next cat
            
            ' Désactivation des bouttons
            btnNewFam.Enabled = True
            btnNewPrs.Enabled = True
            btnSave.Enabled = True
            btnClear.Enabled = True
            btnClose.Enabled = True
            
        Case STATE_EDTPRS
        
            ' Blocage des champs inutilisés
            cboPrn.Enabled = True
            txtNai.Enabled = True
            txtAdr.Enabled = True
            txtNpa.Enabled = True
            txtCty.Enabled = True
            
            ' Gestion des checkbox
            For cat = 1 To chkCat.Count
                chkCat(cat - 1).Enabled = True
            Next cat
            
            ' Désactivation des bouttons
            btnNewFam.Enabled = True
            btnNewPrs.Enabled = True
            btnSave.Enabled = True
            btnClear.Enabled = True
            btnClose.Enabled = True
            
    End Select
    
End Sub

' Pression des bouttons
'------------------------------------------------------------------------------
Private Sub btnClear_Click()
    state = STATE_SELFAM: setState
End Sub

' Notification de modification
'------------------------------------------------------------------------------
Private Sub chkCat_Validate(Index As Integer, Cancel As Boolean)
End Sub
Private Sub txtPrn_Validate(Cancel As Boolean)
End Sub

' Sélection d'une famille
'------------------------------------------------------------------------------
Private Sub lstnom_Validate(Cancel As Boolean)
    MsgBox "Validate"
    If lstNom.ListIndex >= 0 Then
        If state = STATE_SELFAM Then
            state = STATE_EDTFAM: setState
            dtaFamLoad
            TblPrs.LoadCbo cboPrn, lstNom.ItemData(lstNom.ListIndex)
        End If
    End If
End Sub
Private Sub lstNom_ItemCheck(Item As Integer)
    MsgBox "lstNom_ItemCheck"
End Sub
Private Sub lstnom_Change()
    MsgBox "Change"
End Sub
Private Sub lstnom_DropDown()
    MsgBox "DropDown"
End Sub
Private Sub lstnom_LostFocus()
    MsgBox "LostFocus"
End Sub

' Sélection d'une personne
'------------------------------------------------------------------------------
Private Sub cboPrn_Validate(Cancel As Boolean)
    If cboPrn.ListIndex >= 0 Then
        If state = STATE_EDTFAM Then
            state = STATE_EDTPRS: setState
            dtaPrsLoad
        End If
    End If
End Sub

' Chargement desdonnée de la famille
'------------------------------------------------------------------------------
Private Sub dtaFamClear()
    txtAdr.Text = ""
    txtNpa.Text = ""
    txtCty.Text = ""
    fraFam.Caption = "Famille"
    Me.Refresh
End Sub
Private Sub dtaFamLoad()
    Dim fam As CFamille
    
    With lstNom
        TblFam.GotoId .ItemData(.ListIndex)
        Set fam = TblFam.Current
    End With
    With fam
        txtAdr.Text = .Adresse
        txtNpa.Text = .Npa
        txtCty.Text = .Ville
        fraFam.Caption = "Famille " & " (" & CStr(.Id) & ")"
    End With
    Set fam = Nothing
End Sub
Private Sub dtafamSave()
    If setFam Then
        MsgBox "Enregistrer les modification de la famille", vbQuestion
        setFam = False
    End If
End Sub

' Chargement des données de la personne
'------------------------------------------------------------------------------
Private Sub dtaPrsClear()
    Dim cat As Integer
    cboPrn.Clear
    txtNai.Text = ""
    For cat = 0 To chkCat.Count - 1
        chkCat(cat).Value = 0
    Next cat
End Sub
Private Sub dtaPrsLoad()
    Dim prs As CPersonne
    Dim cat As Integer
    With cboPrn
        TblPrs.GotoId .ItemData(.ListIndex)
        Set prs = TblPrs.Current
    End With
    With prs
        txtNai.Text = CStr(.Naissance)
        For cat = 1 To .CatCount
            If .CatValue(cat - 1) = True Then
                chkCat(cat - 1).Value = 1
            Else
                chkCat(cat - 1).Value = 0
            End If
        Next cat
    End With
    Set prs = Nothing
End Sub
Private Sub dtaPrsSave()
    If setPrs Then
        MsgBox "Enregistrer les modification de la personne"
        setPrs = False
    End If
End Sub

