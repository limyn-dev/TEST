VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CTblCat"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

' Structure de la feuille des catégories
'------------------------------------------------------------------------------
Private Const COLTXT = 1
Private Const COLNUM = 2
Private Const LNEMIN = 1

' Membres
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
    Count = mySht.UsedRange.Rows.Count
End Property

' GotoFirst
'------------------------------------------------------------------------------
Public Sub GotoFirst()
    myLne = LNEMIN
End Sub

' GotoNext
'------------------------------------------------------------------------------
Public Function GotoNext()
    If myLne < mySht.UsedRange.Rows.Count + LNEMIN - 1 Then
        GotoNext = True
        myLne = myLne + 1
    Else
        GotoNext = False
    End If
End Function

' CurentText
'------------------------------------------------------------------------------
Public Property Get CurentText() As String
    CurentText = mySht.Cells(myLne, COLTXT).Value
End Property

' CurentColumn
'------------------------------------------------------------------------------
Public Property Get CurentColumn() As Integer
    CurentColumn = mySht.Cells(myLne, COLNUM).Value
End Property

' Chargement des checkBox des catégories
'------------------------------------------------------------------------------
Public Function chkLoad(ByRef chk As Variant, t As Integer, l As Integer, h As Integer) As Integer
    Dim lne As Integer
    
    With chk(0)
        .Enabled = True
        .Visible = True
        .Height = h
        .Left = l
        .Top = t
        .Caption = mySht.Cells(LNEMIN, COLTXT).Value
    End With
    For lne = 1 To mySht.UsedRange.Rows.Count - 1
        Load chk(lne)
        With chk(lne)
            .Enabled = True
            .Visible = True
            .Height = h
            .Left = l
            .Top = t + lne * h
            .Caption = mySht.Cells(lne + LNEMIN, COLTXT).Value
        End With
    Next
    chkLoad = mySht.UsedRange.Rows.Count
End Function



'******************************************************************************



' Gestion de l'instance
'------------------------------------------------------------------------------
Private Sub Class_Initialize()
    Set mySht = Nothing
    myLne = 1
End Sub


' mise à jour des formats de la feuille
'------------------------------------------------------------------------------
Private Sub setFormat()
    Dim cat As Integer
    With mySht
        .Columns(COLTXT).NumberFormat = "@"
        .Columns(COLNUM).NumberFormat = "0"
    End With
End Sub
