VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CTblPrs"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

' Structure de la feuille des personnes
'------------------------------------------------------------------------------
Private Const COL_ID = 1    ' Id de la personne
Private Const COLFID = 2    ' ID de la famille
Private Const COLPRN = 3    ' Prénom
Private Const COLNAI = 4    ' Date de naissance
Private Const COLCAT = 5    ' Première colonne des catégories
Private Const LNEMIN = 1

' Membre
'------------------------------------------------------------------------------
Private mySht As Worksheet
Private myTblCat As CTblCat
Private myNbrCat As Integer
Private myLne As Integer

' Create
'------------------------------------------------------------------------------
Public Sub Create(dataSheet As Worksheet, tblCategorie As CTblCat, tblFamille As CTblFam)
    Set mySht = dataSheet
    Set myTblCat = tblCategorie
    setFormat
End Sub

' Count
'------------------------------------------------------------------------------
Public Property Get Count() As Integer
    Count = LNEMIN + mySht.UsedRange.Rows.Count - 1
End Property

' GotoId
'------------------------------------------------------------------------------
Public Sub GotoId(Id As Integer)
    myFindId Id
End Sub

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

' Current
'------------------------------------------------------------------------------
Public Property Get Current() As CPersonne
    Set Current = myGet
End Property
Public Property Let Current(personne As CPersonne)
    mySet personne
End Property

' LoadCbo
'------------------------------------------------------------------------------
Public Sub LoadCbo(ByRef cbo As ComboBox, familleId As Integer)
    Dim lne As Integer
    
    If familleId > 0 Then
        For lne = 1 To mySht.UsedRange.Rows.Count
            With mySht
                If .Cells(lne + LNEMIN - 1, COLFID).Value = familleId Then
                    cbo.AddItem .Cells(lne + LNEMIN - 1, COLPRN).Value
                    cbo.ItemData(cbo.NewIndex) = .Cells(lne + LNEMIN - 1, COL_ID).Value
                End If
            End With
        Next lne
    Else
        For lne = 1 To mySht.UsedRange.Rows.Count
            With mySht
                cbo.AddItem .Cells(lne + LNEMIN - 1, COLPRN).Value
                cbo.ItemData(cbo.NewIndex) = .Cells(lne + LNEMIN - 1, COL_ID).Value
            End With
        Next lne
    End If
    
End Sub



'******************************************************************************



' Instanciation
'------------------------------------------------------------------------------
Private Sub Class_Initialize()
    Set mySht = Nothing
    Set myTblCat = Nothing
End Sub

' Désinstanciation
'------------------------------------------------------------------------------
Private Sub Class_Terminate()
End Sub

' Lecture des données d'une famille dans la feuille
'------------------------------------------------------------------------------
Private Function myGet() As CPersonne
    Set myGet = New CPersonne
    Dim fam As New CFamille
    Dim cat As Integer
    Dim col As Integer
    
    If myLne > 0 Then
        With myGet
            .Id = mySht.Cells(myLne, COL_ID).Value
            .fid = mySht.Cells(myLne, COLFID).Value
            .Prenom = mySht.Cells(myLne, COLPRN).Value
            .Naissance = mySht.Cells(myLne, COLNAI).Value
            .CatCount = myTblCat.Count
            myTblCat.GotoFirst
            For cat = 1 To .CatCount
                If mySht.Cells(myLne, COLCAT + myTblCat.CurentColumn - 1).Value = "" Then
                    .CatValue(cat) = False
                Else
                    .CatValue(cat) = True
                End If
                myTblCat.GotoNext
            Next cat
        End With
    End If
    
End Function

' Ecriture des données d'une famille dans la feuille
'------------------------------------------------------------------------------
Private Sub mySet(prs As CPersonne, fid As Integer)
    Dim cat As Integer
    Dim col As Integer
    
    ' Recherche de la ligne
    myLne = 0
    myFindId (prs.Id)
    
    ' Ajout d'un nouvel enregistrement
    If myLne = 0 Then
        prs.Id = numLibre()
        myLne = LNEMIN + mySht.UsedRange.Rows.Count
    End If
    
    ' Ecriture de l'enregistrement
    With prs
        mySht.Cells(myLne, COL_ID).Value = .Id
        mySht.Cells(myLne, COLFID).Value = fid
        mySht.Cells(myLne, COLPRN).Value = .Prenom
        mySht.Cells(myLne, COLNAI).Value = .Naissance
        myTblCat.GotoFirst
        For cat = 1 To .CatCount
            mySht.Cells(myLne, COLCAT + myTblCat.CurentColumn - 1).Value = .CatValue(cat)
            myTblCat.GotoNext
        Next cat
        myTblFam.GotoId prs.famille.Id
        myTblFam.Current = .famille
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
Private Function numLibre() As Integer
    Dim lne As Integer
    
    ' Tri de la feuille
    mySht.UsedRange.Rows.Sort Key1:=mySht.Columns(COL_ID), Order1:=xlAscending
    
    ' Parcourt des numéros des familles
    lne = LNEMIN
    While mySht.Cells(lne + 1, COL_ID).Value - mySht.Cells(lne, COL_ID).Value = 1 And _
          lne <= LNEMIN + mySht.UsedRange.Rows.Count - 1
        lne = lne + 1
    Wend
    numLibre = mySht.Cells(lne, COL_ID).Value + 1
    
End Function

' mise à jour des formats de la feuille
'------------------------------------------------------------------------------
Private Sub setFormat()
    Dim cat As Integer
    With mySht
        .Columns(COL_ID).NumberFormat = "0"
        .Columns(COLFID).NumberFormat = "0"
        .Columns(COLPRN).NumberFormat = "@"
        .Columns(COLNAI).NumberFormat = "d/m"
        For cat = 1 To TblCat.Count
            .Columns(COLCAT + cat - 1).NumberFormat = "@"
        Next cat
    End With
End Sub





