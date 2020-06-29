VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form forType 
   Caption         =   "Support de l'entité"
   ClientHeight    =   7464
   ClientLeft      =   48
   ClientTop       =   396
   ClientWidth     =   7320
   LinkTopic       =   "Form1"
   ScaleHeight     =   7464
   ScaleWidth      =   7320
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame fraAtr 
      Caption         =   "Attributs du type"
      Height          =   3012
      Left            =   4320
      TabIndex        =   19
      Top             =   120
      Width           =   2850
      Begin VB.CommandButton cmdAtrAdd 
         Caption         =   "Modifier"
         Height          =   372
         Index           =   2
         Left            =   1900
         TabIndex        =   30
         Top             =   2520
         Width           =   850
      End
      Begin VB.CommandButton cmdAtrAdd 
         Caption         =   "Supprimer"
         Height          =   372
         Index           =   1
         Left            =   1000
         TabIndex        =   28
         Top             =   2520
         Width           =   850
      End
      Begin VB.CommandButton cmdAtrAdd 
         Caption         =   "Ajouter"
         Height          =   372
         Index           =   0
         Left            =   100
         TabIndex        =   27
         Top             =   2520
         Width           =   850
      End
      Begin VB.TextBox txtAtrNom 
         Height          =   372
         Left            =   100
         TabIndex        =   26
         Text            =   "Text3"
         Top             =   240
         Width           =   2650
      End
      Begin MSComctlLib.Slider sldAtr 
         Height          =   1692
         Left            =   120
         TabIndex        =   25
         Top             =   720
         Width           =   492
         _ExtentX        =   868
         _ExtentY        =   2985
         _Version        =   393216
         Orientation     =   1
      End
      Begin VB.Frame fraAtrTpe 
         Caption         =   "Type de l'attribut"
         Height          =   1572
         Left            =   960
         TabIndex        =   20
         Top             =   720
         Width           =   1692
         Begin VB.OptionButton optAtrTpe 
            Caption         =   "Flag"
            Height          =   300
            Index           =   4
            Left            =   120
            TabIndex        =   29
            Top             =   1200
            Width           =   1500
         End
         Begin VB.OptionButton optAtrTpe 
            Caption         =   "Date"
            Height          =   300
            Index           =   3
            Left            =   120
            TabIndex        =   24
            Top             =   960
            Width           =   1500
         End
         Begin VB.OptionButton optAtrTpe 
            Caption         =   "Nombre réel"
            Height          =   300
            Index           =   2
            Left            =   120
            TabIndex        =   23
            Top             =   720
            Width           =   1500
         End
         Begin VB.OptionButton optAtrTpe 
            Caption         =   "Nombre entier"
            Height          =   300
            Index           =   1
            Left            =   120
            TabIndex        =   22
            Top             =   480
            Width           =   1500
         End
         Begin VB.OptionButton optAtrTpe 
            Caption         =   "Texte"
            Height          =   300
            Index           =   0
            Left            =   120
            TabIndex        =   21
            Top             =   240
            Width           =   1500
         End
      End
   End
   Begin VB.Frame fraDtaTpe 
      Caption         =   "Données du type"
      Height          =   3012
      Left            =   120
      TabIndex        =   5
      Top             =   120
      Width           =   4092
      Begin VB.ComboBox cboTpe 
         Height          =   288
         Left            =   120
         TabIndex        =   31
         Text            =   "Combo1"
         Top             =   480
         Width           =   3852
      End
      Begin VB.Frame fraTpe 
         Caption         =   "Particularités"
         Height          =   1212
         Left            =   120
         TabIndex        =   13
         Top             =   1680
         Width           =   1812
         Begin VB.CheckBox chkDtaIs 
            Caption         =   "Type associatif (support unique)"
            Height          =   495
            Index           =   1
            Left            =   120
            TabIndex        =   15
            Top             =   480
            Width           =   1600
         End
         Begin VB.CheckBox chkDtaIs 
            Caption         =   "Type de référance"
            Height          =   255
            Index           =   0
            Left            =   120
            TabIndex        =   14
            Top             =   240
            Width           =   1600
         End
      End
      Begin VB.TextBox txtDtaIco 
         Height          =   375
         Left            =   120
         TabIndex        =   12
         Text            =   "Text1"
         Top             =   1080
         Width           =   3852
      End
      Begin VB.Frame frmLvlTpe 
         Caption         =   "Niveau"
         Height          =   1215
         Left            =   2040
         TabIndex        =   7
         Top             =   1680
         Width           =   1932
         Begin VB.OptionButton optDtaLvl 
            Caption         =   "Données (niveau 3)"
            Height          =   255
            Index           =   3
            Left            =   120
            TabIndex        =   10
            Top             =   240
            Width           =   1700
         End
         Begin VB.OptionButton optDtaLvl 
            Caption         =   "Logique (niveau 2)"
            Height          =   255
            Index           =   2
            Left            =   120
            TabIndex        =   9
            Top             =   480
            Width           =   1700
         End
         Begin VB.OptionButton optDtaLvl 
            Caption         =   "Physique  (niveau 1)"
            Height          =   255
            Index           =   1
            Left            =   120
            TabIndex        =   8
            Top             =   720
            Width           =   1700
         End
      End
      Begin VB.Label lblIcoTpe 
         Caption         =   "Fichier icone"
         Height          =   372
         Left            =   120
         TabIndex        =   11
         Top             =   840
         Width           =   3852
      End
      Begin VB.Label lblNomTpe 
         Caption         =   "Nom du type"
         Height          =   372
         Index           =   0
         Left            =   120
         TabIndex        =   6
         Top             =   240
         Width           =   3852
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
   Begin VB.Frame fraLnk 
      Caption         =   "Types liés"
      Height          =   4092
      Left            =   120
      TabIndex        =   0
      Top             =   3240
      Width           =   7092
      Begin VB.Frame fraCatLnk 
         Caption         =   "Catégorie"
         Height          =   615
         Left            =   240
         TabIndex        =   16
         Top             =   240
         Width           =   6732
         Begin VB.OptionButton optTlk 
            Caption         =   "Type supports"
            Height          =   252
            Index           =   4
            Left            =   2280
            TabIndex        =   18
            Top             =   240
            Width           =   1932
         End
         Begin VB.OptionButton optTlk 
            Caption         =   "Types de Références"
            Height          =   252
            Index           =   3
            Left            =   120
            TabIndex        =   17
            Top             =   240
            Width           =   1932
         End
      End
      Begin MSComctlLib.ListView lsv 
         Height          =   2652
         Index           =   0
         Left            =   240
         TabIndex        =   1
         Top             =   1320
         Width           =   3240
         _ExtentX        =   5715
         _ExtentY        =   4678
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
         Height          =   2652
         Index           =   1
         Left            =   3720
         TabIndex        =   2
         Top             =   1320
         Width           =   3240
         _ExtentX        =   5715
         _ExtentY        =   4678
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
         Caption         =   "Autres types"
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
         Left            =   3480
         TabIndex        =   4
         Top             =   960
         Width           =   3012
      End
      Begin VB.Label lblLsvCpo 
         Alignment       =   2  'Center
         Caption         =   "Types liés"
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
         Left            =   240
         TabIndex        =   3
         Top             =   960
         Width           =   3012
      End
   End
End
Attribute VB_Name = "forType"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
 
' Instance du composant edité
Public tpe As New C_Type

' Gestion du drag and drop
Dim cleTpe As String  ' Clef du composant déplacé
Dim idxLsv As Integer ' Index de la listeview
Dim nomAtr As String  ' Ancien nom de l'attribut en cas de changement
Dim lnkTpe As T_Tlk   ' Type de lien affiché dans le formulaire

Private noEvent As Boolean




'************************ EVENEMENTS SUR LES DONNEES **************************

'------------------------------------------------------------------------------
' Mise à jour du formualire
'==============================================================================
Private Sub cboTpe_Change()
  setFor
End Sub
Private Sub cboTpe_Click()
   setFor
End Sub






'*********************** EVENEMENTS SUR LES ATTRIBUTS *************************

'------------------------------------------------------------------------------
' Séléction de l'attribut
'==============================================================================
Private Sub sldAtr_Change()

   ' Mise à jour de l'attribut
   atrSet
   
End Sub

'------------------------------------------------------------------------------
' Modification d'un attribut
'==============================================================================
Private Sub cmdAtrAdd_Click(Index As Integer)
   
   Select Case Index
   
      Case 0
         ' Création de l'attribut
         tpe.atrAdd txtAtrNom.Text, tpeSelect
      
      Case 1
         ' Suppression de l'attribut
         If sldAtr.Value > 0 Then tpe.AtrDel txtAtrNom.Text
   
      Case 2
         ' Modification du nom de l'attribut
         If sldAtr.Value > 0 Then tpe.atrSet nomAtr, txtAtrNom.Text
         
   End Select
   
   AtrIni
   
End Sub

'------------------------------------------------------------------------------
' Edition du nom d'un attribut
'==============================================================================
Private Sub txtAtrNom_GotFocus()

   nomAtr = txtAtrNom.Text
   
End Sub



'************************ EVENEMENTS DES TYPES LIES ***************************

'------------------------------------------------------------------------------
' Séléction du composant
'==============================================================================
Private Sub lsv_ItemClick(Index As Integer, ByVal Item As MSComctlLib.ListItem)

   ' Séléction du composant
   cleTpe = Item.Key
   idxLsv = Index
   
End Sub

'------------------------------------------------------------------------------
' Début du drag and drop
'==============================================================================
Private Sub lsv_MouseMove(Index As Integer, Button As Integer, Shift As Integer, x As Single, y As Single) '

   ' Contrôle si opération de drag
   If Button = vbLeftButton Then
    
      ' Affichage du drag
      lsv(Index).DragIcon = lsv(idxLsv).SelectedItem.CreateDragImage

      ' Création de l'opération drag
      lsv(Index).Drag vbBeginDrag
      
      ' MsgBox "composant déplacé " & cleCpo

  End If

End Sub

'------------------------------------------------------------------------------
' Arrivée à la déstiation (relachement du bouton de la souris)
'==============================================================================
Private Sub lsv_DragDrop(Index As Integer, Source As Control, x As Single, y As Single)
   Dim tpeId As Long
   
   ' Calcul du type du composant déplacé
   tpeId = ModLsv.cle_id(cleTpe)
   
   ' Modification du type
   With tpe
   
      ' Ajout suppression des types de référance
      If lnkTpe = LNKTPR Then
         If idxLsv = 1 And Index = 0 Then
      
            ' Ajout du type de référence
            .TprAdd tpeId
      
         ElseIf idxLsv = 0 And Index = 1 Then
   
            ' Suppression du type de référence
            .TprDel tpeId
      
         End If
      
      ' Ajout suppression des types support
      Else
         If idxLsv = 1 And Index = 0 Then
      
            ' Ajout du type support
            .TpsAdd tpeId
      
         ElseIf idxLsv = 0 And Index = 1 Then
   
            ' Suppression du type support
            .TpsDel tpeId
      
         End If
         
      End If
      
   End With
   
End Sub

'------------------------------------------------------------------------------
' Modification de l'affichage des types liés
'==============================================================================
Private Sub optTlk_Click(Index As Integer)

   If Index = LNKTPR Then
      lnkTpe = LNKTPR
   Else
      lnkTpe = LNKTPS
   End If
   
   ' Mise à jour du formulaire
   setFor
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
   
   ' Initialisation de la cbo des types
   ModDtb.tpeCbo cboTpe
   cboTpe.ListIndex = 1
   
   ' Initialisation du type de lien
   lnkTpe = LNKTPR
   
   ' Mise à jour du formulaire
   setFor
   
   ' Déblocage des evenements
   noEvent = False
   
End Sub

'------------------------------------------------------------------------------
' Déchargement du formulaire
'==============================================================================
Private Sub Form_Unload(Cancel As Integer)

   ' Libération du composant
   Set tpe = Nothing
    
End Sub



'§§§§§§§§§§§§§§§§§§§§§§§§§§§§ OUTILS DU FORMULARE §§§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Mise à jour du formulaire en fonction du type séléctionné dans la combobox
'==============================================================================
Private Sub setFor()

   ' initialisation des liste view
   ModLsv.reset lsv(0)
   ModLsv.reset lsv(1)
   
    ' Initialisation du type
   With cboTpe
      tpe.tpeId = .ItemData(.ListIndex)
   End With
   
   ' Chargement  des valeurs du type
   dtaSet
   
   ' Initialisation des attributs du type
   AtrIni
   
   ' Initialisation des type liés
   lsvSet
   

End Sub



'§§§§§§§§§§§§§§§§§§§§§§§§§ OUTILS DE DONNEES DU TYPE §§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Initialisation de la combo des types
'==============================================================================
Private Sub dtaCboIni()
   
   ' Initialisation
   ModDtb.tpeCbo cpotpe
   
End Sub

'------------------------------------------------------------------------------
' Chargement des données du type
'==============================================================================
Private Sub dtaSet()

   With tpe
   
      ' Nom du type
      ' txtDtaNom.Text = .TpeNom
   
      ' Icone
      txtDtaIco = .TpeIco
      
      ' Type de référance
      If .IsRef Then
         chkDtaIs(0).Value = 1
      Else
         chkDtaIs(0).Value = 0
      End If
      
      ' Type associatif
       If .IsAsf Then
         chkDtaIs(1).Value = 1
      Else
         chkDtaIs(1).Value = 0
      End If
      
      ' Niveaux
      optDtaLvl(.TpeLvl).Value = True
      
   End With
      
End Sub



'§§§§§§§§§§§§§§§§§§§§§§§ OUTILS DES ATTRIBUTS DU TYPE §§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Initialisation des attribut
'==============================================================================
Private Sub AtrIni()

   ' Initialisation du slider
   If tpe.AtrNbr > 0 Then
   
      With sldAtr
         .Min = 0
         .Max = tpe.AtrNbr
         .TickFrequency = 1
         .SelectRange = False
         .Value = 1
      End With
   
   Else
      
      sldAtr.Enabled = False
      
   End If
   
   ' Initialisation du premier attribut
   atrSet
   
End Sub

'------------------------------------------------------------------------------
' Mise à jour des contrôles des attributs en fonction de la séléction
'==============================================================================
Private Sub atrSet()
   Dim numAtr As Integer
   
   ' Recherche l'attribut séléctionné
   numAtr = sldAtr.Value
   
   With tpe
      
      ' Mise à jour du nom
      txtAtrNom.Text = .AtrNom(numAtr)
      If numAtr = 0 Then
         txtAtrNom.Enabled = False
      Else
         txtAtrNom.Enabled = True
      End If
      
      ' Mise à jour du type
      atrTpeSet .atrTpe(numAtr)
      
   End With
      
End Sub

'------------------------------------------------------------------------------
' Mise à jour des bouttons option du type de l'attribut
'==============================================================================
Private Sub atrTpeSet(atrTpe As ADOX.DataTypeEnum)

   Select Case atrTpe

      ' Les chaines de caractère
      ' adBSTR Une chaîne de caractères qui se termine par zéro (Unicode) (DBTYPE_BSTR).
      ' adChar Une valeur de type String (DBTYPE_STR).
      Case adBSTR, adChar, 202
         optAtrTpe(0).Value = True
      
      ' Les entiers
      ' adTinyInt          Un nombre entier signé d'1 octet (DBTYPE_I1).
      ' adUnsignedTinyInt  Un nombre entier non signé d'1 octet (DBTYPE_UI1).
      ' adSmallInt         Un nombre entier signé de 2 octets (DBTYPE_I2).
      ' adUnsignedSmallInt Un nombre entier non signé de 2 octets (DBTYPE_UI2).
      ' adInteger          Un nombre entier signé de 4 octets (DBTYPE_I4).
      ' adUnsignedInt      Un nombre entier non signé de 4 octets (DBTYPE_UI4).
      ' adBigInt           Un nombre entier signé de 8 octets (DBTYPE_I8).
      ' adUnsignedBigInt   Un nombre entier non signé de 8 octets (DBTYPE_UI8).
      Case adTinyInt, adUnsignedTinyInt, adSmallInt, adUnsignedSmallInt, _
           adInteger, adUnsignedInt, adBigInt, adUnsignedBigInt, 5
         optAtrTpe(1).Value = True
         
      ' Les réels
      ' adCurrency   Une valeur de devise (DBTYPE_CY). Une devise est un nombre à décimales fixes avec quatre chiffres après la virgule. Il est stocké dans un nombre entier signé de 8 octets, mis à l'échelle par 10 000.
      ' adDecimal    Une valeur numérique exacte avec une précision et une échelle fixe (DBTYPE_DECIMAL).
      ' adDouble     Une valeur à virgule flottante en double précision (DBTYPE_R8).
      ' adNumeric    Une valeur numérique exacte avec une précision et une échelle fixe (DBTYPE_NUMERIC).
      ' adSingle     Une valeur à virgule flottante en simple précision (DBTYPE_R4).
      Case adCurrency, adDecimal, adDouble, adNumeric, adSingle
         optAtrTpe(2).Value = True
                  
      ' Les Dates
      ' adDate          Une valeur de type Date (DBTYPE_DATE). Une date est stockée en tant que nombre double, la partie entière étant composée du nombre de jours à compter du 30 décembre 1899, et la fraction correspondant à la fraction d'un jour.
      ' adDBDate        Une valeur de date (aaaammjj) (DBTYPE_DBDATE).
      ' adDBTime        Une valeur d'heure (hhmmss) (DBTYPE_DBTIME).
      ' adDBTimeStamp   Un horodatage (aaaammjjhhmmss plus une fraction en 9 chiffres) (DBTYPE_DBTIMESTAMP).
      Case adDate, adDBDate, Date, adDBTime, adDBTimeStamp
         optAtrTpe(3).Value = True
         
      ' Les Boolean
      ' adBinary  Une valeur binaire (DBTYPE_BYTES).
      ' adBoolean Une valeur booléenne (DBTYPE_BOOL).
      Case adBinary, adBoolean
         optAtrTpe(4).Value = True
   
   End Select
      
End Sub

'------------------------------------------------------------------------------
' Renvoie le type de l'attribut séléctionné dans les option bouttons
'==============================================================================
Function tpeSelect() As ADOX.DataTypeEnum
   Dim numOpt As Integer
   
   ' initialisation du type par défaut
   tpeSelect = adVarChar
   
   ' parcourt des option boutton
   Do
      ' contrôle si séléctionné
      If optAtrTpe(numOpt).Value Then
         Select Case numOpt
         
            Case 0
               tpeSelect = adVarWChar
            Case 1
               tpeSelect = adInteger
            Case 2
               tpeSelect = adDouble
            Case 3
               tpeSelect = adDate
            Case 4
               tpeSelect = adBoolean
         End Select
         
         Exit Do
         
      End If
      
      numOpt = numOpt + 1
      
   Loop While numOpt < optAtrTpe.Count
   
End Function



'§§§§§§§§§§§§§§§§§§§§§§§§§ OUTILS DES LIENS DU TYPE §§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Recherche le type de lien séléctionné
'==============================================================================
Private Sub lsvSet()
  
   If lnkTpe = LNKTPR Then
      lsvSetTpr
   Else
      lsvSetTps
   End If
   
End Sub

'------------------------------------------------------------------------------
' Charge les lsv(0) et lsv(1) avec les types de référances
'==============================================================================
Private Sub lsvSetTpr()
   Dim numTpr As Integer
   Dim tpr As New C_Type
   
   ' Reset des lsv
   ModLsv.reset lsv(0)
   ModLsv.reset lsv(1)
   
   With tpe
   
      ' Chargement des composants de référance
      For numTpr = 1 To .TprNbr
         
         ' Initialisation du type support
         tpr.tpeId = .tprId(numTpr)
         
         ' insértion du composant dans les deux listeview
         ModLsv.nodAdd lsv(0), tpr.tpeId, tpr.TpeNom
         ModLsv.nodAdd lsv(1), tpr.tpeId, tpr.TpeNom
         
      Next numTpr
      
   End With
   
   ' chargement des composant possibles pour chaque type de référance
   lsvSetTpe
         
End Sub

'------------------------------------------------------------------------------
' Charge les lsv(0) et lsv(1) avec les types supports
'==============================================================================
Public Sub lsvSetTps()
   Dim numTps As Integer
   Dim tps As New C_Type
   
   ' Reset des lsv
   ModLsv.reset lsv(0)
   ModLsv.reset lsv(1)
   
   With tpe
   
      ' Chargement des composants de référance
      For numTps = 1 To .TpsNbr
         
         ' Initialisation du type support
         tps.tpeId = .TpsId(numTps)
         
         ' insértion du composant dans les deux listeview
         ModLsv.nodAdd lsv(0), tps.tpeId, tps.TpeNom
         ModLsv.nodAdd lsv(1), tps.tpeId, tps.TpeNom
         
      Next numTps
      
   End With
   
   ' chargement des composant possibles pour chaque type de référance
   lsvSetTpe
         
End Sub

'------------------------------------------------------------------------------
' Insértion des type dans la lsv(1)
'==============================================================================
Private Sub lsvSetTpe()
   Dim lstTpe As New C_LstTpe
   Dim numTpe As Integer
   
   ' Insértion des composants de la list dans la lsv
   For numTpe = 1 To lstTpe.NbrTpe
   
      ' Insértion des composant dans la lsv(1)
      On Error GoTo TpeExiste
      ModLsv.nodAdd lsv(1), lstTpe.numTpe(numTpe).tpeId, lstTpe.numTpe(numTpe).TpeNom
      
TpeNxt:
      Next numTpe
   
Exit Sub
   

TpeExiste:
   
   ' Suppression du cpo car il a été insérer lors du chargement de la lsv(0)
   ModLsv.nodDel lsv(1), lstTpe.numTpe(numTpe).tpeId
   
   ' Composant suivant
   GoTo TpeNxt

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
      
         ' Entête des colonnes
         .ColumnHeaders.Add , "Types", "Types"

      End With
      
   Next numLsv
         
End Sub







