VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form forComposant 
   Caption         =   "Support de l'entit�"
   ClientHeight    =   9108
   ClientLeft      =   48
   ClientTop       =   396
   ClientWidth     =   9456
   LinkTopic       =   "Form1"
   ScaleHeight     =   9108
   ScaleWidth      =   9456
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame fraDtaCpo 
      Caption         =   "Carat�ristiques"
      Height          =   732
      Left            =   0
      TabIndex        =   9
      Top             =   0
      Width           =   9372
      Begin VB.CommandButton cmdAddCpo 
         Caption         =   "Cr�er le composant"
         Height          =   372
         Left            =   6840
         TabIndex        =   17
         Top             =   240
         Width           =   2172
      End
      Begin VB.ComboBox cboTpeCpo 
         Appearance      =   0  'Flat
         Height          =   288
         Left            =   1680
         TabIndex        =   15
         Text            =   "Combo1"
         Top             =   240
         Width           =   4692
      End
      Begin VB.Label Label2 
         Caption         =   "Type du composant"
         Height          =   252
         Left            =   120
         TabIndex        =   16
         Top             =   240
         Width           =   1572
      End
   End
   Begin VB.Frame fraLnkCpo 
      Caption         =   "Liens"
      Height          =   3612
      Left            =   0
      TabIndex        =   6
      Top             =   840
      Width           =   3012
      Begin VB.Frame fraTpeLnk 
         Caption         =   "Types de liens"
         Height          =   852
         Left            =   120
         TabIndex        =   12
         Top             =   240
         Width           =   2772
         Begin VB.OptionButton optTlk 
            Caption         =   "Composants de R�f�rences"
            Height          =   252
            Index           =   1
            Left            =   120
            TabIndex        =   14
            Top             =   240
            Width           =   2532
         End
         Begin VB.OptionButton optTlk 
            Caption         =   "Composants supports"
            Height          =   252
            Index           =   2
            Left            =   120
            TabIndex        =   13
            Top             =   480
            Width           =   2532
         End
      End
      Begin VB.Frame fraTpeCpo 
         Caption         =   "Types des composants"
         Height          =   2412
         Left            =   120
         TabIndex        =   10
         Top             =   1080
         Width           =   2772
         Begin VB.CheckBox chkTpe 
            Height          =   255
            Index           =   0
            Left            =   120
            TabIndex        =   11
            Top             =   240
            Visible         =   0   'False
            Width           =   2532
         End
      End
   End
   Begin MSComctlLib.ImageList imlTpe 
      Left            =   0
      Top             =   0
      _ExtentX        =   804
      _ExtentY        =   804
      BackColor       =   -2147483643
      ImageWidth      =   24
      ImageHeight     =   24
      MaskColor       =   12632256
      _Version        =   393216
   End
   Begin VB.Frame fraAtrCpo 
      Caption         =   "Attributs"
      Height          =   3612
      Left            =   3120
      TabIndex        =   0
      Top             =   840
      Width           =   6285
      Begin VB.CommandButton cmdSetAtr 
         Caption         =   "Modifier"
         Height          =   372
         Left            =   5160
         TabIndex        =   18
         Top             =   3120
         Width           =   972
      End
      Begin VB.TextBox txtAtr 
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
            Size            =   9.6
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
   Begin VB.Frame fraCpoLnk 
      Caption         =   "Composants li�s"
      Height          =   4575
      Left            =   0
      TabIndex        =   3
      Top             =   4440
      Width           =   9375
      Begin MSComctlLib.ListView lsv 
         Height          =   3852
         Index           =   0
         Left            =   120
         TabIndex        =   4
         Top             =   600
         Width           =   4548
         _ExtentX        =   8022
         _ExtentY        =   6795
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
      Begin MSComctlLib.ListView lsv 
         Height          =   3852
         Index           =   1
         Left            =   4680
         TabIndex        =   5
         Top             =   600
         Width           =   4536
         _ExtentX        =   8001
         _ExtentY        =   6795
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
            Size            =   9.6
            Charset         =   0
            Weight          =   400
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   372
         Index           =   1
         Left            =   4680
         TabIndex        =   8
         Top             =   240
         Width           =   4572
      End
      Begin VB.Label lblLsvCpo 
         Alignment       =   2  'Center
         Caption         =   "Composant li�s"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.6
            Charset         =   0
            Weight          =   400
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   372
         Index           =   0
         Left            =   120
         TabIndex        =   7
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
 
' Instance du composant edit�
Public cpo As New C_Composant

Private tpeLnk As T_Tlk    ' Type de lien actuellement s�l�ctionn� (r�f�rence ou support)
Private cleCpo As String   ' Clef du composant d�plac�
Private idxLsv As Integer  ' num�ro du composant dans la liste view
Private noEvent As Boolean ' Blocage des action sur les evenement
Private lneAtr As Integer  ' Ligne ddernier attribut modifier



'************** EVENEMENTS DU BOUTTON DE CREATION DE COMPOSANT ****************

'------------------------------------------------------------------------------
' Cr�ation du composant et mise � jour du formulaire
'==============================================================================
Private Sub cmdAddCpo_Click()

   ' Cr�ation du composant
   With cboTpeCpo
      cpo.CpoAdd .ItemData(.ListIndex)
   End With
   
   ' D�sactivation de la s�l�ction du type
   cboTpeCpo.Enabled = False
   cmdAddCpo.Visible = False
   
   ' Activation du formulaire
   fraCpoLnk.Enabled = True
   fraLnkCpo.Enabled = True
   fraAtrCpo.Enabled = True
   
   ' S�l�ction du type de lien
   optTlk(LNKCPR).Value = True
   
   ' Mise � jour du formulaire
   setFor
   
End Sub



'************************* EVENEMENTS DES ATTRIBUTS ***************************

'------------------------------------------------------------------------------
' Mise � jour du index de la ligne de l'attribut modifi�
'==============================================================================
Private Sub txtAtr_Change(Index As Integer)

   lneAtr = Index
   
End Sub
'------------------------------------------------------------------------------
' Modification de l'attribut
'==============================================================================
Private Sub cmdSetAtr_Click()

   ' Mise � jour de la valeur de l'attribut du composant
   If Not noEvent Then cpo.AtrVal(lneAtr) = txtAtr(lneAtr).Text
   
End Sub
Private Sub txtAtr_Validate(Index As Integer, Cancel As Boolean)

   ' Mise � jour de la valeur de l'attribut du composant
   If Not noEvent Then cpo.AtrVal(lneAtr) = txtAtr(lneAtr).Text
   
End Sub



'************************* EVENEMENTS DES lISTEVIEW ***************************

'------------------------------------------------------------------------------
' S�l�ction du composant
'==============================================================================
Private Sub lsv_ItemClick(Index As Integer, ByVal Item As MSComctlLib.ListItem)

   ' S�l�ction du composant
   cleCpo = Item.Key
   idxLsv = Index
   
End Sub

'------------------------------------------------------------------------------
' D�but du drag and drop
'==============================================================================
Private Sub lsv_MouseMove(Index As Integer, Button As Integer, Shift As Integer, x As Single, y As Single) '

   ' Contr�le si op�ration de drag
   If Button = vbLeftButton Then
    
      ' Affichage du drag
      lsv(Index).DragIcon = lsv(idxLsv).SelectedItem.CreateDragImage

      ' Cr�ation de l'op�ration drag
      lsv(Index).Drag vbBeginDrag
      
      ' MsgBox "composant d�plac� " & cleCpo

  End If

End Sub

'------------------------------------------------------------------------------
' Arriv�e � la d�stiation (relachement du bouton de la souris)
'==============================================================================
Private Sub lsv_DragDrop(Index As Integer, Source As Control, x As Single, y As Single)
         
         
   ' Ajout ou suppression d'un lien sur un composant de r�f�rence
   If tpeLnk = LNKCPR Then
      
      ' Contr�le si ajout ou suppression du lien sur un composant de r�f�rence
      If idxLsv = 1 And Index = 0 Then
      
         ' Ajout du lien de r�f�rence sur le composant
         cpo.cprAdd ModLsv.cle_id(cleCpo)
      
      ElseIf idxLsv = 1 And Index = 0 Then
      
         ' Suppression du lien de r�f�rence sur le composant
         cpo.cprDel ModLsv.cle_id(cleCpo)
      
      End If
      
      ' Rechargement des listeview avec les composant de r�f�rence
      lsvSetCpr
      
   ' Ajout ou suppression du lien sur des composants support
   Else
            
      ' Ajout du lien sur le composant support
      If idxLsv = 1 And Index = 0 Then
         cpo.CpsAdd ModLsv.cle_id(cleCpo)
      
      ' Suppression du lien sur le composant support
      ElseIf idxLsv = 0 And Index = 1 Then
         cpo.CpsDel ModLsv.cle_id(cleCpo)
      
      End If
      
      ' Rechargement des listeview avec les composants supports
      lsvSetCps
      
   End If
      
End Sub



'**************** EVENEMENTS DE LA CHECKBOX DES TYPES AFFICHE *****************

'------------------------------------------------------------------------------
' Modification de la s�l�ction des types de la chekbox chkTpe
'==============================================================================
Private Sub chkTpe_Click(Index As Integer)
   
   ' Mise � jour des listeview
   If tpeLnk = LNKCPR Then
      lsvSetCpr
   Else
      lsvSetCps
   End If

End Sub



'************** EVENEMENTS DES OPTION BOUTTONS DU TYPE DE LIEN ****************

'------------------------------------------------------------------------------
' Modification du formulaire en fonction du type de lien s�l�ction�
'==============================================================================
Private Sub optTlk_Click(Index As Integer)

   ' Mise � jour du formulaire
   If Not noEvent Then
      tpeLnk = CLng(Index)
      setFor
   End If

End Sub



'************************* EVENEMENTS DU FORMULAIRE ***************************

'------------------------------------------------------------------------------
' Chargement du formulaire
'==============================================================================
Private Sub Form_Load()
   Dim numAtr As Integer
   
   ' blocage des evenemments
   noEvent = True
   
   ' Initialisation de l'image liste des listeView
   ModIml.iniIcoTpe imlTpe
      
   ' Initialisation des listeview
   lsvIni
      
   ' Initialisation des bouttons options du type de lien
   optTlk(LNKCPR).Value = True
   tpeLnk = LNKCPR
   
   ' Contr�le si nouveau composant
   If cpo.CpoId > 0 Then
   
      ' Blocage du changement de type
      cboTpeCpo.Text = cpo.TpeNom
      cboTpeCpo.Enabled = False
      cmdAddCpo.Enabled = False
      
      ' Modification du titre du formulaire
      Caption = cpo.TpeNom & ": " & cpo.CpoDsc & " (" & CStr(cpo.CpoId) & ")"
      
      ' Initalisation de la checkbox des type et des listeview
      setFor
   
   Else
   
      ' D�sactivation des propri�t�s du composant
      fraAtrCpo.Enabled = False
      fraLnkCpo.Enabled = False
      fraCpoLnk.Enabled = False
      
      ' Chargement de la combobox des types
      ModDtb.tpeCbo cboTpeCpo
   
   End If
   
   ' D�blocage des evenements
   noEvent = False
   
End Sub

'------------------------------------------------------------------------------
' D�chargement du formulaire
'==============================================================================
Private Sub Form_Unload(Cancel As Integer)

   ' Lib�ration du composant
   Set cpo = Nothing
   
   ' Mise � jour du composant dans le formulaire appelant
   forEntite.setFor
   
End Sub



'���������������������������������� OUTILS DU FORMULAIRE ������������������������������������

'------------------------------------------------------------------------------
' Modification du formulaire en fonction du type de liens s�l�ction�
'==============================================================================
Private Sub setFor()

   ' Mise � jour des attributs
   atrSet
   
   If tpeLnk = LNKCPR Then
      
      ' Mise � jour de formulaire avec les composants de r�f�rences
      chkSetTpr
      lsvSetCpr
      
   Else
      
      ' Mise � jour de formulaire avec les composants supports
      chkSetTps
      lsvSetCps
         
   End If
   
End Sub



'����������������������������� OUTILS DES TYPES �������������������������������

'------------------------------------------------------------------------------
' Affichage des boutons options pour la s�l�ction des type de r�f�rance
'==============================================================================
Public Sub chkSetTpr()
   Dim tpe As New C_Type
   Dim tpr As New C_Type
   Dim numTpr As Integer
   
   ' Initialisation des checkBox
   ModChk.iniChk chkTpe
   
   ' Initialisation du type
   tpe.tpeId = cpo.tpeId
   
   ' Initialisation des checkBox
   ModChk.addChk chkTpe, tpe.TprNbr
   
   ' Affichage du nom des types dans les checkBox
   For numTpr = 1 To tpe.TprNbr
      
      ' Initialisation du type de r�f�rence
      tpr.tpeId = tpe.tprId(numTpr)
      
      ' Mise � jour de la checkbox
      ModChk.setChk chkTpe, numTpr, tpr.TpeNom
      
   Next numTpr
     
   ' D�sallocation
   Set tpe = Nothing
   Set tpr = Nothing
   
End Sub

'------------------------------------------------------------------------------
' Affichage des boutons options pour la s�l�ction des types supports
'==============================================================================
Public Sub chkSetTps()
   Dim tpe As New C_Type
   Dim tps As New C_Type
   Dim numTps As Integer
   
   ' Initialisation des checkBox
   ModChk.iniChk chkTpe
   
   ' Instanciation du type
   tpe.tpeId = cpo.tpeId
   
   ' Initialisation des checkBox
   ModChk.addChk chkTpe, tpe.TpsNbr
   
   ' Affichage du nom des types dans les checkBox
   For numTps = 1 To tpe.TpsNbr
      
      ' Initialisation du type support
      tps.tpeId = tpe.TpsId(numTps)
      
      ' Mise � jour de la checkbox
      ModChk.setChk chkTpe, numTps, tps.TpeNom
      
   Next numTps
     
   ' D�sallocation
   Set tpe = Nothing
   Set tps = Nothing
   
End Sub

'------------------------------------------------------------------------------
' Contr�le si le type de r�f�rance est s�l�ction� dans la checkBox des types
'==============================================================================
Private Function chkTprOk(tprId As Long) As Boolean
   Dim numChk As Integer
      
   ' Initialisation de la fonction
   chkTprOk = False
   
   ' Parcourt des checkBox
   Do
         
      numChk = numChk + 1
         
      ' contr�l si le type correspondant � la checkbox est celui recherch�
      If cpo.tprId(numChk) = tprId Then
         
         ' Mise � jour de la fonction
         If chkTpe(numChk).Value = 1 Then chkTprOk = True
            
         'Sortie de la recherche
         Exit Do
            
      End If
         
   Loop While numChk < chkTpe.Count - 1
      
End Function

'------------------------------------------------------------------------------
' Contr�le si le type support est s�l�ction� dans la checkBox des types
'==============================================================================
Private Function chkTpsOk(TpsId As Long) As Boolean
   Dim numChk As Integer
      
   ' Initialisation de la fonction
   chkTpsOk = False
   
   ' Parcourt des checkbox
   Do
         
      numChk = numChk + 1
         
      ' contr�l si le type correspondant � la checkbox est celui recherch�
      If cpo.TpsId(numChk) = TpsId Then
         
         ' Mise � jour de la fonction
         If chkTpe(numChk).Value = 1 Then chkTpsOk = True
            
         'Sortie de la recherche
         Exit Do
            
      End If
         
   Loop While numChk < chkTpe.Count - 1
      
End Function



'��������������������������� OUTILS DES ATTRIBUTS �����������������������������

'------------------------------------------------------------------------------
' Affichage des attributs du composant
'==============================================================================
Private Sub atrSet()
   Dim numAtr As Integer
   
   ' Cr�ation des labels et textBox
   ModLbl.AtrIni lblAtr, txtAtr, cpo.AtrNbr
   
   ' Ins�rtion des valeurs
   For numAtr = 1 To cpo.AtrNbr
   
      lblAtr.Item(numAtr).Caption = cpo.AtrNom(numAtr) & " :    "
      txtAtr.Item(numAtr).Text = cpo.AtrVal(numAtr)
      
   Next numAtr
   
End Sub



'������������������������ OUTILS DES COMPOSANTS LIES ��������������������������

'------------------------------------------------------------------------------
' Charge une listeview avec les composants de r�f�rances d'un composant
'==============================================================================
Private Sub lsvSetCpr()
   Dim cpr As New C_Composant
   Dim numCpr As Integer
   Dim numTpe As Integer
   Dim cle As String
   
   ' Reset des lsvCpo
   reset lsv(0)
   reset lsv(1)
   
   ' Chargement des composants de r�f�rance
   For numCpr = 1 To cpo.CprNbr
         
      ' Initialisation du composant
      cpr.CpoId = cpo.cprId(numCpr)
         
      ' Contr�le si le composant doit �tre afficher
      If chkTprOk(cpr.tpeId) Then
         
         ' Calcul de la cle
         cle = ModLsv.id_Cle(cpr.CpoId)
         
         ' Ins�rtion du cpo dans les listeview
         lsv(0).ListItems.Add , cle, cpr.CpoDsc, , CInt(cpr.tpeId)
         lsv(1).ListItems.Add , cle, cpr.CpoDsc, , CInt(cpr.tpeId)
      
         ' Ajout du type du composant dans le deuxi�me colonne
         lsv(0).ListItems.Item(cle).SubItems(1) = cpr.TpeNom
         lsv(1).ListItems.Item(cle).SubItems(1) = cpr.TpeNom
            
      End If
         
   Next numCpr
   
   ' D�sallocation
   Set cpr = Nothing
      
   ' chargement des composant possibles pour chaque type de r�f�rance
   For numTpe = 1 To cpo.TprNbr
      
      ' Ajout des composants du type
      If chkTprOk(cpo.tprId(numTpe)) Then
         lsvSetCpo cpo.tprId(numTpe)
      End If
         
   Next numTpe
         
End Sub

'------------------------------------------------------------------------------
' Charge une listeview avec les composants supports d'un composant
'==============================================================================
Public Sub lsvSetCps()
   Dim cps As New C_Composant
   Dim numCps As Integer
   Dim numTpe As Integer
   Dim cle As String
   
   ' Reset des lsvCpo
   reset lsv(0)
   reset lsv(1)
   
   ' Chargement des composants de r�f�rance du composant
   For numCps = 1 To cpo.CpsNbr
         
      ' Contr�le si le composant doit �tre afficher
      If chkTpsOk(cpo.CpsTpeId(numCps)) Then
         
         ' Initialisation du composant
         cps.CpoId = cpo.cpsId(numCps)
         
         ' Calcul de la cle
         cle = ModLsv.id_Cle(cps.CpoId)
         
         ' Ins�rtion du cpo dans les listeview
         lsv(0).ListItems.Add , cle, cps.CpoDsc, , CInt(cps.tpeId)
         lsv(1).ListItems.Add , cle, cps.CpoDsc, , CInt(cps.tpeId)
      
         ' Ajout du type du composant dans le deuxi�me colonne
         lsv(0).ListItems.Item(cle).SubItems(1) = cps.TpeNom
         lsv(1).ListItems.Item(cle).SubItems(1) = cps.TpeNom
            
      End If
         
   Next numCps
   
   ' D�sallocation
   Set cps = Nothing
      
   ' chargement des composant possibles pour chaque type support
   For numTpe = 1 To cpo.TpsNbr
      If chkTpsOk(cpo.TpsId(numTpe)) Then lsvSetCpo cpo.TpsId(numTpe)
   Next numTpe
      
End Sub

'------------------------------------------------------------------------------
' Ajout des composants de m�me type dans la listeview
'==============================================================================
Private Sub lsvSetCpo(ByVal tpeId As Long)
   Dim newCpo As New C_Composant
   Dim lstCpo As New C_LstCpo
   Dim numCpo As Integer
   Dim cle As String
   Dim imgIdx As Integer
   
   ' Initialisation de la list des composants du type
   lstCpo.LstTpeId = tpeId
   
   ' Calcul de l'index de limage dans l'image liste
   imgIdx = ModIml.id_idx(lsv(1).Icons, tpeId)
   
   ' Ins�rtion des composants de la list dans la lsv
   For numCpo = 1 To lstCpo.CpoNbr
      
         ' Calcul de la cle
         cle = ModLsv.id_Cle(lstCpo.CpoNum(numCpo).CpoId)
         
         ' Ins�rtion des composant dans la listeview des composants � ajouter
         On Error GoTo CpoExiste
         lsv(1).ListItems.Add , cle, lstCpo.CpoNum(numCpo).CpoDsc, , imgIdx
      
cpoNxt:

   Next numCpo
   
Exit Sub
   
' Suppression du cpo car il a �t� ins�rer lors du chargement des composants li�s
CpoExiste:
   
   ' Suppression du composant
   With lsv(1).ListItems
      .Remove .Item(cle).Index
   End With
   
   ' Composant suivant
   GoTo cpoNxt

End Sub

'------------------------------------------------------------------------------
' Initialisation des listeView
'==============================================================================
Private Sub lsvIni()
   Dim numLsv As Integer
   
   For numLsv = 0 To 1
   
      With lsv(numLsv)
   
         ' Mode d'affichage rapport
         .View = lvwReport
      
         ' Liste des icones
         .Icons = imlTpe
         .SmallIcons = imlTpe
      
         ' Cr�ation des colonnes
         .ColumnHeaders.Add , , "Composants"
         .ColumnHeaders.Add , , "Types"
      
      End With
      
   Next numLsv
      
End Sub






