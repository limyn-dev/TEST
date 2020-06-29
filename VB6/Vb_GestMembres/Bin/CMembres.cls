VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CMembres"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Collection" ,"CMembre"
Attribute VB_Ext_KEY = "Member0" ,"CMembre"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit

' Membres
'------------------------------------------------------------------------------
Private mCol As Collection

' Ajout d'un membre dans la liste
'------------------------------------------------------------------------------
Public Function Add(Optional sKey As String) As CMembre
    
    'create a new object
    Dim objNewMember As CMembre
    Set objNewMember = New CMembre

    'set the properties passed into the method
    If Len(sKey) = 0 Then
        mCol.Add objNewMember
    Else
        mCol.Add objNewMember, sKey
    End If

    'return the object created
    Set Add = objNewMember
    Set objNewMember = Nothing

End Function

' Accès à un membre de la liste
'------------------------------------------------------------------------------
Public Property Get Item(vntIndexKey As Variant) As CMembre
Attribute Item.VB_UserMemId = 0
    Set Item = mCol(vntIndexKey)
End Property

' Ajout d'un membre dans la liste
'------------------------------------------------------------------------------
Public Property Get Count() As Long
    Count = mCol.Count
End Property

' Suppression d'un membre dela liste
'------------------------------------------------------------------------------
Public Sub Remove(vntIndexKey As Variant)
    mCol.Remove vntIndexKey
End Sub

' Enumération des membres de la liste (For...Each)
'------------------------------------------------------------------------------
Public Property Get NewEnum() As IUnknown
Attribute NewEnum.VB_UserMemId = -4
Attribute NewEnum.VB_MemberFlags = "40"
    Set NewEnum = mCol.[_NewEnum]
End Property



'******************************************************************************



' Instanciation
'------------------------------------------------------------------------------
Private Sub Class_Initialize()
    Set mCol = New Collection
End Sub

' Désinstanciation
'------------------------------------------------------------------------------
Private Sub Class_Terminate()
    Set mCol = Nothing
End Sub

