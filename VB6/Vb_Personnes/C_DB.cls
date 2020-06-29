VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "C_DB"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit


'------------------------------------------------------------------------------
'   Structure des feuilles de données
'==============================================================================
Const colCtnNom = 1

Const colLocNom = 1
Const colLocNPA = 2
Const colLocCtn = 3

Const colPrsNom = 1
Const colPrsPrn = 2
Const colPrsAdr = 3
Const colPrsLoc = 4

'------------------------------------------------------------------------------
'   Données membres
'==============================================================================
Private shtCtn As New Worksheet
Private shtLoc As New Worksheet
Private shtPrs As New Worksheet

'------------------------------------------------------------------------------
'   Construction et destruction de l'instance
'==============================================================================
Private Sub Class_Initialize()
   
   ' Instanciation des membres
      
   ' Initialisation des membres
   Workbooks.Open FileName:="D:\Esis\atelier\Personnes\db.xls"
   Set shtCtn = Workbooks(1).Worksheets("Cantons")
   Set shtLoc = Workbooks(1).Worksheets("Localités")
   Set shtPrs = Workbooks(1).Worksheets("Personnes")
    
End Sub
'------------------------------------------------------------------------------
Private Sub Class_Terminate()

    ' Fermeture du classeur
    Workbooks(1).Close
    
    ' Désallocation des objets
    Set shtCtn = Nothing
    Set shtLoc = Nothing
    Set shtPrs = Nothing
    
End Sub

'------------------------------------------------------------------------------
'  Geter, seter Canton
'==============================================================================
Private Function getCtn(id As Long) As C_Canton
   Set getCtn = New C_Canton
   With shtCtn
      If id > 0 And id <= .UsedRange.Rows.Count Then
         getCtn.Nom = .Cells(id, colCtnNom).Value
      End If
   End With
End Function
'------------------------------------------------------------------------------
Private Sub setCtn(ctn As C_Canton, ByVal id As Long)
   With shtCtn
      .Cells(id, colCtnNom).Value = ctn.Nom
   End With
End Sub

'------------------------------------------------------------------------------
'  Geter, seter Localité
'==============================================================================
Private Function getLoc(ByVal id As Long) As C_Localite
   Set getLoc = New C_Localite
   With shtLoc
      If id > 0 And id <= .UsedRange.Rows.Count Then
         getLoc.Nom = .Cells(id, colCtnNom).Value
         Set getLoc.Canton = getCtn(.Cells(id, colLocCtn).Value)
      End If
   End With
End Function
'------------------------------------------------------------------------------
Private Sub setLoc(loc As C_Localite, ByVal id As Long)
   With shtLoc
      .Cells(id, colLocNom).Value = loc.Nom
      .Cells(id, colLocNPA).Value = loc.NPA
      .Cells(id, colLocCtn).Value = loc.Canton.id
   End With
End Sub

'------------------------------------------------------------------------------
'  Geter, seter Personne
'==============================================================================
Private Function getPrs(ByVal id As Long) As C_Personne
   Set getPrs = New C_Personne
   With shtPrs
      If id > 0 And id <= .UsedRange.Rows.Count Then
         getPrs.Nom = .Cells(id, colPrsNom).Value
         getPrs.Prenom = .Cells(id, colPrsPrn).Value
         getPrs.Adresse = .Cells(id, colPrsAdr).Value
         Set getPrs.Localite = getLoc(.Cells(id, colPrsLoc).Value)
      End If
   End With
End Function
'------------------------------------------------------------------------------
Private Sub setPrs(prs As C_Personne, id As Long)
   With prs
      shtPrs.Cells(id, colPrsNom).Value = .Nom
      shtPrs.Cells(id, colPrsPrn).Value = .Prenom
      shtPrs.Cells(id, colPrsAdr).Value = .Adresse
      shtPrs.Cells(id, colPrsLoc).Value = .Localite.id
   End With
End Sub




'******************************************************************************

'------------------------------------------------------------------------------
'  Propriété Canton
'==============================================================================
Public Property Get Canton(ByVal id As Long) As C_Canton
   Set Canton = getCtn(id)
End Property
'------------------------------------------------------------------------------
Public Property Set Canton(ByVal id As Long, ByVal ctn As C_Canton)
   setCtn ctn, id
End Property

'------------------------------------------------------------------------------
'  Propriété Localité
'==============================================================================^
Public Property Get Localite(ByVal id As Long) As C_Localite
   Set Localite = getLoc(id)
End Property
'------------------------------------------------------------------------------
Public Property Set Localite(ByVal id As Long, ByVal loc As C_Localite)
   setLoc loc, id
End Property

'------------------------------------------------------------------------------
'  Propriété Personne
'==============================================================================^
Public Property Get Personne(ByVal id As Long) As C_Personne
   Set Personne = getPrs(id)
End Property
'------------------------------------------------------------------------------
Public Property Set Personne(ByVal id As Long, ByVal prs As C_Personne)
   setPrs prs, id
End Property
