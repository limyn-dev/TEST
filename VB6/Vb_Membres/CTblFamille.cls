VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CTblFam"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

' Structure de la feuille des familles
'------------------------------------------------------------------------------
Private Const COL_ID = 1
Private Const COLNOM = 2
Private Const COLADR = 3
Private Const COLNPA = 4
Private Const COLCTY = 5
Private Const COLEML = 6
Private Const LNEMIN = 1



' Membre
'------------------------------------------------------------------------------
Private mySht As Worksheet
Private myLne As Integer

' Create
'------------------------------------------------------------------------------
Public Sub Create(dataSheet As Worksheet)
    Set mySht = dataSheet
    setFormat
End Sub

' Count
'------------------------------------------------------------------------------
Public Property Get Count() As Integer
    Count = mySht.UsedRange.Rows.Count + LNEMIN - 1
End Property

' GotoFirst
'------------------------------------------------------------------------------
Public Sub GotoFirst()
    myLne = LNEMIN
End Sub

' GotoNext
'------------------------------------------------------------------------------
Public Function GotoNext() As Boolean
    If myLne < mySht.UsedRange.Rows.Count + LNEMIN - 1 Then
        GotoNext = True
        myLne = myLne + 1
    Else
        GotoNext = False
    End If
End Function

' GotoId
'------------------------------------------------------------------------------
Public Sub GotoId(Id As Integer)
    myFindId Id
End Sub

' Current
'------------------------------------------------------------------------------
Public Property Get Current() As CFamille
    Set Current = myGet
End Property
Public Property Let Current(famille As CFamille)
    mySet famille
End Property

' LoadCbo
'------------------------------------------------------------------------------
Public Sub LoadCbo(ByRef cbo As ComboBox)
    Dim lne As Integer
    
    For lne = 1 To mySht.UsedRange.Rows.Count
        With mySht
            cbo.AddItem .Cells(lne + LNEMIN - 1, COLNOM).Value
            cbo.ItemData(cbo.NewIndex) = .Cells(lne + LNEMIN - 1, COL_ID).Value
        End With
    Next lne

End Sub

' LoadLst
'------------------------------------------------------------------------------
Public Sub LoadLst(ByRef lst As ListBox)
    Dim lne As Integer
    
    For lne = 1 To mySht.UsedRange.Rows.Count
        With mySht
            lst.AddItem .Cells(lne + LNEMIN - 1, COLNOM).Value
            lst.ItemData(lst.NewIndex) = .Cells(lne + LNEMIN - 1, COL_ID).Value
        End With
    Next lne

End Sub



'******************************************************************************


' Instanciation
'------------------------------------------------------------------------------
Private Sub Class_Initialize()
    Set mySht = Nothing
End Sub

' Désinstanciation
'------------------------------------------------------------------------------
Private Sub Class_Terminate()
End Sub

' Lecture des données d'une famille dans la feuille
'------------------------------------------------------------------------------
Private Function myGet() As CFamille
    Set myGet = New CFamille
    If myLne > 0 Then
        With myGet
            .Id = mySht.Cells(myLne, COL_ID).Value
            .Nom = mySht.Cells(myLne, COLNOM).Value
            .Adresse = mySht.Cells(myLne, COLADR).Value
            .Npa = mySht.Cells(myLne, COLNPA).Value
            .Ville = mySht.Cells(myLne, COLCTY).Value
            .EMail = mySht.Cells(myLne, COLEML).Value
        End With
    End If
End Function

' Ecriture des données d'une famille dans la feuille
'------------------------------------------------------------------------------
Private Sub mySet(fam As CFamille)
    
    ' Recherche de la ligne
    myLne = 0
    myFindId fam.Id
    
    ' Ajout d'une nouvelle famille
    If myLne = 0 Then
        fam.Id = myNextId
        myLne = LNEMIN + mySht.UsedRange.Rows.Count
    End If
    
    ' Ecriture de l'enregistrement
    With fam
        mySht.Cells(myLne, COL_ID).Value = .Id
        mySht.Cells(myLne, COLNOM).Value = .Nom
        mySht.Cells(myLne, COLADR).Value = .Adresse
        mySht.Cells(myLne, COLNPA).Value = .Npa
        mySht.Cells(myLne, COLCTY).Value = .Ville
        mySht.Cells(myLne, COLEML).Value = .EMail
    End With
    
End Sub

' Recherche d'une famille dans la liste
'------------------------------------------------------------------------------
Private Sub myFindId(Id As Integer)
    Dim cel As Range
    Set cel = mySht.Columns(COL_ID).Find(Id, lookin:=xlValues)
    If cel Is Nothing Then
        myLne = 0
    Else
        myLne = cel.Row
        Set cel = Nothing
    End If
End Sub

' Recherche du numéro de famille libre
'------------------------------------------------------------------------------
Private Function myNextId() As Integer
    Dim lne As Integer
    
    ' Tri de la feuille
    mySht.UsedRange.Rows.Sort Key1:=Columns(COL_ID), Order1:=xlAscending
    
    ' Parcourt des numéros des familles
    lne = LNEMIN
    While mySht.Cells(lne + 1, COL_ID).Value - mySht.Cells(lne, COL_ID).Value = 1 And _
          lne <= LNEMIN + mySht.UsedRange.Rows.Count - 1
        lne = lne + 1
    Wend
    myNextId = mySht.Cells(lne, COL_ID).Value + 1
    
End Function

' mise à jour des formats de la feuille
'------------------------------------------------------------------------------
Private Sub setFormat()
    Dim cat As Integer
    With mySht
        .Columns(COL_ID).NumberFormat = "@"
        .Columns(COLNOM).NumberFormat = "@"
        .Columns(COLADR).NumberFormat = "@"
        .Columns(COLNPA).NumberFormat = "@"
        .Columns(COLCTY).NumberFormat = "@"
        .Columns(COLEML).NumberFormat = "@"
    End With
End Sub






