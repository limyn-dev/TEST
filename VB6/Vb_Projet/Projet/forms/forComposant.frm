VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "Mscomctl.ocx"
Begin VB.Form forComposant 
   Caption         =   "Support de l'entité"
   ClientHeight    =   8205
   ClientLeft      =   45
   ClientTop       =   390
   ClientWidth     =   9645
   LinkTopic       =   "Form1"
   ScaleHeight     =   8205
   ScaleWidth      =   9645
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame fraLnkCpo 
      Caption         =   "Liens"
      Height          =   852
      Left            =   120
      TabIndex        =   8
      Top             =   120
      Width           =   3012
      Begin VB.OptionButton OptTpeLnk 
         Caption         =   "Composants supports"
         Height          =   252
         Index           =   2
         Left            =   120
         TabIndex        =   10
         Top             =   480
         Width           =   1932
      End
      Begin VB.OptionButton OptTpeLnk 
         Caption         =   "Composants de Références"
         Height          =   252
         Index           =   1
         Left            =   120
         TabIndex        =   9
         Top             =   240
         Width           =   2652
      End
   End
   Begin VB.Frame fraTpe 
      Caption         =   "Types"
      Height          =   2412
      Left            =   120
      TabIndex        =   6
      Top             =   960
      Width           =   3015
      Begin VB.CheckBox chkTpe 
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   7
         Top             =   240
         Visible         =   0   'False
         Width           =   2655
      End
   End
   Begin MSComctlLib.ImageList imlTpe 
      Left            =   0
      Top             =   0
      _ExtentX        =   794
      _ExtentY        =   794
      BackColor       =   -2147483643
      ImageWidth      =   24
      ImageHeight     =   24
      MaskColor       =   12632256
      _Version        =   393216
   End
   Begin VB.Frame fraAtr 
      Caption         =   "Attributs"
      Height          =   3252
      Left            =   3240
      TabIndex        =   0
      Top             =   120
      Width           =   6285
      Begin VB.TextBox txtAtr 
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
         Left            =   3142
         TabIndex        =   1
         Top             =   240
         Visible         =   0   'False
         Width           =   3042
      End
      Begin VB.Label lblAtr 
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
         Height          =   255
         Index           =   0
         Left            =   105
         TabIndex        =   2
         Top             =   240
         Visible         =   0   'False
         Width           =   3045
      End
   End
   Begin VB.Frame fraLnk 
      Caption         =   "Composants liés"
      Height          =   4575
      Left            =   120
      TabIndex        =   3
      Top             =   3480
      Width           =   9375
      Begin MSComctlLib.ListView lsvCpo 
         Height          =   3852
         Index           =   0
         Left            =   120
         TabIndex        =   4
         Top             =   600
         Width           =   4548
         _ExtentX        =   8017
         _ExtentY        =   6800
         LabelEdit       =   1
         MultiSelect     =   -1  'True
         LabelWrap       =   -1  'True
         HideSelection   =   0   'False
         AllowReorder    =   -1  'True
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         HotTracking     =   -1  'True
         HoverSelection  =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         NumItems        =   0
      End
      Begin MSComctlLib.ListView lsvCpo 
         Height          =   3852
         Index           =   1
         Left            =   4680
         TabIndex        =   5
         Top             =   600
         Width           =   4536
         _ExtentX        =   7990
         _ExtentY        =   6800
         View            =   1
         LabelWrap       =   0   'False
         HideSelection   =   0   'False
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         NumItems        =   0
      End
      Begin VB.Label lblLsvCpo 
         Alignment       =   2  'Center
         Caption         =   "autres composants"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   372
         Index           =   1
         Left            =   4680
         TabIndex        =   12
         Top             =   240
         Width           =   4572
      End
      Begin VB.Label lblLsvCpo 
         Alignment       =   2  'Center
         Caption         =   "Composant liés"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   400
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   372
         Index           =   0
         Left            =   120
         TabIndex        =   11
         Top             =   240
         Width           =   4572
      End
   End
End
Attribute VB_Name = "forComposant"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
 
' Instance du composant edité
Public cpo As New C_Composant

' Gestion du drag and drop
Dim cleCpo As String       ' Clef du composant déplacé
Dim idxLsv As Integer      ' numéro du composant dans la liste view

Private noEvent As Boolean



'§§§§§§§§§§§§§§§§§§§§§§§§§§ EVENEMENTS DES TXTATR §§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Modification de l'attribut
'==============================================================================
Private Sub txtAtr_Validate(Index As Integer, Cancel As Boolean)

   ' Mise à jour de la valeur de l'attribut du composant
   If Not noEvent Then cpo.AtrVal(Index) = txtAtr(Index).Text
    
End Sub



'§§§§§§§§§§§§§§§§§§§§§§§§§§ EVENEMENTS DES LSVCPO §§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Séléction du composant
'==============================================================================
Private Sub lsvCpo_ItemClick(Index As Integer, ByVal Item As MSComctlLib.ListItem)

   ' Séléction du composant
   cleCpo = Item.Key
   idxLsv = Index
   
End Sub

'------------------------------------------------------------------------------
' Début du drag and drop
'==============================================================================
Private Sub lsvCpo_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single) '

   ' Contrôle si opération de drag
   If Button = vbLeftButton Then
    
      ' Affichage du drag
      lsvCpo(Index).DragIcon = lsvCpo(idxLsv).SelectedItem.CreateDragImage

      ' Création de l'opération drag
      lsvCpo(Index).Drag vbBeginDrag
      
      ' MsgBox "composant déplacé " & cleCpo

  End If

End Sub

'------------------------------------------------------------------------------
' Arrivée à la déstiation (relachement du bouton de la souris)
'==============================================================================
Private Sub lsvCpo_DragDrop(Index As Integer, Source As Control, X As Single, Y As Single)
         
   ' Contrôle si ajout ou suppression ducomposant
   If idxLsv = 1 And Index = 0 Then
      
      ' Ajout du composant
      If Index = 0 Then cpoAdd cleCpo
      
   ElseIf idxLsv = 0 And Index = 1 Then
   
      ' Suppression du composant
      If Index = 0 Then cpoDel cleCpo
      
   End If
   
End Sub

'Private Sub lsvCpo_DragOver(Index As Integer, Source As Control, x As Single, y As Single, State As Integer)'
'
'   If indrag = True Then
'
'      ' Set DropHighlight to the mouse's coordinates.
'      Set lsvCpo(Index).DropHighlight = lsvCpo(Index).HitTest(x, y)
'
'   End If
'
'End Sub



'§§§§§§§§§§§§§§§§§§§§§§§§§ EVENEMENTS DU OPTLNKCPO §§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Modification du formulaire en fonction du type de lien séléctioné
'==============================================================================
Private Sub opttpelnk_Click(Index As Integer)

   ' Mise à jour du formulaire
   TpeLnkSet CLng(Index)

End Sub



'§§§§§§§§§§§§§§§§§§§§§§§§§ EVENEMENTS DU FORMULAIRE §§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Chargement du formulaire
'==============================================================================
Private Sub Form_Load()
   Dim numAtr As Integer
   
   ' blocage des evenemments
   noEvent = True
   
   ' Initialisation de l'image liste des listeView
   ModIml.initialise imlTpe
   
   ' Initialisation des listeview
   lsvIni
 
   ' Modification du titre du formulaire
   Caption = cpo.TpeNom & ": " & cpo.CpoDsc & " (" & CStr(cpo.CpoId) & ")"
   
   ' Initialisation des bouttons options du type de lien
   optTpeLnk(LNKCPR).Value = True
   
   ' Initalisation du formulaire
   TpeLnkSet (LNKCPR)
   
   ' Chargement des attributs du composant
   atrSet
   
   ' Déblocage des evenements
   noEvent = False
   
End Sub

'------------------------------------------------------------------------------
' Déchargement du formulaire
'==============================================================================
Private Sub Form_Unload(Cancel As Integer)

   ' Libération du composant
   Set cpo = Nothing
   
   ' Mise à jour du composant dans le formulaire appelant
   forEntite.setFor
   
End Sub



'§§§§§§§§§§§§§§§§§§§§§§§§§§§ EVENEMENTS DU CHKTPE §§§§§§§§§§§§§§§§§§§§§§§§§§§§§

Private Sub chkTpe_Click(Index As Integer)
   
   ' Mise à jour des listeview
   Select Case TpeLnkFnd
      Case LNKCPR
         lsvSetCpr
      Case LNKCPS
         lsvSetCps
   End Select

End Sub



'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ OUTILS §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Création du lien avec le coposant
'==============================================================================
Private Sub cpoAdd(cle As String)

   ' Ajout du lien sur le composant
   If TpeLnkFnd = LNKCPR Then
      
      ' Ajout du lien sur le composant
      cpo.cprAdd ModLsv.key_Cpo(cle)
      
      ' Rechargement des listeview
      lsvSetCpr
      
   Else
      
      ' Ajout du lien sur le composant support
      cpo.CpsAdd ModLsv.key_Cpo(cle)
      
      ' Rechargement des listeview
      lsvSetCps
      
   End If
         
      
End Sub

'------------------------------------------------------------------------------
' Suppression du lien avec le composant
'==============================================================================
Private Sub cpoDel(cle As String)

   ' Contrôle du type de lien
   If TpeLnkFnd = LNKCPR Then
      
      ' Suppression du lien sur le composant
      cpo.cprDel ModLsv.key_Cpo(cle)
      
      ' Rechargement des listeview
      lsvSetCpr
      
   'Else
      'cpo.cpsId = cpoId
   End If
   
End Sub

'------------------------------------------------------------------------------
' Modification du formulaire en fonction du type de liens séléctioné
'==============================================================================
Private Sub TpeLnkSet(Optional tpeLnk As T_Tlk = 0)

   ' Recherche du type de lien séléctionné
   If tpeLnk = NOTDEF Then tpeLnk = TpeLnkFnd()
   
   ' Mise à jour du formulaire
   Select Case tpeLnk
      
      Case LNKCPR ' Composant de référance
      
         ' Mise à jour de la checkBox des types du composant
         ModChk.chkSetTpr cpo.tpeId, chkTpe
         
         ' Mise à jour des listeview des composants liés
         lsvSetCpr
         
      Case LNKCPS ' Composant supports
      
         ' Mise à jour de la checkBox des types du composant
         ModChk.chkSetTps cpo.tpeId, chkTpe
         
         ' Mise à jour des listeview des composants liés
         lsvSetCps
         
   End Select
   
End Sub

'------------------------------------------------------------------------------
' Recherche le type de lien séléctionné
'==============================================================================
Private Function TpeLnkFnd() As T_Tlk
   Dim numOpt As Integer
   Dim nbrOpt As Integer
   
   nbrOpt = optTpeLnk.Count
   
   ' Recherche le bouton option activé
   Do
      numOpt = numOpt + 1
      If optTpeLnk(numOpt) = True Then Exit Do
   Loop While numOpt < nbrOpt
   
   TpeLnkFnd = numOpt
   
End Function

'------------------------------------------------------------------------------
' Charge une listeview avec les composants de référances
'==============================================================================
Public Sub lsvSetCpr()
   Dim numTpe As Integer
   Dim numCpo As Integer
   
   ' Reset des lsvCpo
   ModLsv.reset lsvCpo(0)
   ModLsv.reset lsvCpo(1)
   
   ' Chargement des composants de référance
   For numCpo = 1 To cpo.CprNbr
         
      ' Contrôle si le composant doit être afficher
      If setTprOk(cpo.cprTpeId(numCpo)) Then
         
         ' insértion du composant dans les deux listeview
         ModLsv.cpoAdd lsvCpo(0), cpo.cprId(numCpo)
         ModLsv.cpoAdd lsvCpo(1), cpo.cprId(numCpo)
            
      End If
         
   Next numCpo
      
   ' chargement des composant possibles pour chaque type de référance
   For numTpe = 1 To cpo.TprNbr
      
      ' Ajout des composants du type
      If setTprOk(cpo.tprId(numTpe)) Then
         lsvSetCpo cpo.tprId(numTpe)
      End If
         
   Next numTpe
         
End Sub

'------------------------------------------------------------------------------
' Charge une listeview avec les composants supports
'==============================================================================
Public Sub lsvSetCps()
   Dim numTpe As Integer
   Dim numCpo As Integer
   
   ' Reset des lsvCpo
   ModLsv.reset lsvCpo(0)
   ModLsv.reset lsvCpo(1)
   
   ' Chargement des composants supports
   For numCpo = 1 To cpo.CpsNbr
      
      ' Contrôle si le composant doit être afficher
      If setTpsOk(cpo.CpsTpeId(numCpo)) Then
         
         ' Insértion du composant dans les deux listeview
         ModLsv.cpoAdd lsvCpo(0), cpo.cpsId(numCpo)
         ModLsv.cpoAdd lsvCpo(1), cpo.cpsId(numCpo)
            
      End If
      
   Next numCpo
      
   ' chargement des composant possibles pour chaque type de référance
   For numTpe = 1 To cpo.TpsNbr
      
      ' Ajout des composants du type
      If setTpsOk(cpo.TpsId(numTpe)) Then
         lsvSetCpo cpo.TpsId(numTpe)
      End If
         
   Next numTpe
      
End Sub

'------------------------------------------------------------------------------
' Mise de liste des composants par type
'==============================================================================
Private Sub lsvSetCpo(ByVal tpeId As Long)
   Dim lstCpo As New C_LstCpo
   Dim numCpo As Integer
   
   ' Initialisation de la list des composants
   lstCpo.tpeId = tpeId
   
   ' Insértion des composants de la list dans la lsv
   For numCpo = 1 To lstCpo.CpoNbr
   
      ' Insértion des composant dans la lsvCpo(1)
      On Error GoTo CpoExiste
      ModLsv.cpoAdd lsvCpo(1), lstCpo.CpoId(numCpo)
   
cpoNxt:

   Next numCpo
   
Exit Sub
   
' Suppression du cpo car il a été insérer lors du chargement de la lsvCpo(0)
CpoExiste:
   
   ' Suppression du composant
   ModLsv.cpoDel lsvCpo(1), lstCpo.CpoId(numCpo)
   
   ' Composant suivant
   GoTo cpoNxt

End Sub

'------------------------------------------------------------------------------
' Contrôle si le type de référance est séléctioné dans la checkBox des types
'==============================================================================
Private Function setTprOk(tprId As Long)
   Dim numChk As Integer
      
   ' Parcourt des types supports
   Do
         
      numChk = numChk + 1
         
      ' contrôl si le type est celui de la checkbox
      If cpo.tprId(numChk) = tprId Then
         
         ' Mise à jour de la fonction
         If chkTpe(numChk).Value = 1 Then setTprOk = True
            
         'Sortie de la recherche
         Exit Do
            
      End If
         
   Loop While numChk < chkTpe.Count - 1
      
End Function

'------------------------------------------------------------------------------
' Contrôle si le type support est séléctioné dans la checkBox des types
'==============================================================================
Private Function setTpsOk(TpsId As Long)
   Dim numChk As Integer
      
   ' Parcourt des types supports
   Do
         
      numChk = numChk + 1
         
      ' contrôl si le type est celui de la checkbox
      If cpo.TpsId(numChk) = TpsId Then
         
         ' Mise à jour de la fonction
         If chkTpe(numChk).Value = 1 Then setTpsOk = True
            
         'Sortie de la recherche
         Exit Do
            
      End If
         
   Loop While numChk < chkTpe.Count - 1
      
End Function

'------------------------------------------------------------------------------
' Initialisation des listeView
'==============================================================================
Private Sub lsvIni()
   Dim nomsCol(2) As String
   Dim numLsv As Integer

   ' liste des noms des colonnes
   nomsCol(1) = "Composant"
   nomsCol(2) = "Type"
   
   ' Initialisation des listeView
   For numLsv = 0 To 1
      ModLsv.initialise lsvCpo(numLsv), imlTpe, nomsCol
   Next numLsv
   
End Sub

'------------------------------------------------------------------------------
' Affichage des attributs du composant
'==============================================================================
Private Sub atrSet()
   Dim numAtr As Integer
   
   ' Création des labels et textBox
   ModLbl.AtrIni lblAtr, txtAtr, cpo.AtrNbr
   
   ' Insértion des valeurs
   For numAtr = 1 To cpo.AtrNbr
   
      lblAtr.Item(numAtr).Caption = cpo.AtrNom(numAtr)
      txtAtr.Item(numAtr).Text = cpo.AtrVal(numAtr)
      
   Next numAtr
   
End Sub


