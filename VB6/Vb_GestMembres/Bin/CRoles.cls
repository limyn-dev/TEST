VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CRoles"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

' Membres
'------------------------------------------------------------------------------
Private mCol As Collection

' Ajout d'un ministère dans la liste
'------------------------------------------------------------------------------
Public Function Add(Optional sKey As String) As CRole
    
    'create a new object
    Dim objNewMember As CRole
    Set objNewMember = New CRole

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

' Accès à un ministère de la liste
'------------------------------------------------------------------------------
Public Property Get Item(vntIndexKey As Variant) As CRole
    Set Item = mCol(vntIndexKey)
End Property

' Nombre de ministère de la liste
'------------------------------------------------------------------------------
Public Property Get Count() As Long
    Count = mCol.Count
End Property

' Suppression d'un des ministère de la liste
'------------------------------------------------------------------------------
Public Sub Remove(vntIndexKey As Variant)
    mCol.Remove vntIndexKey
End Sub

' Enumération des ministères de la liste (For...Each)
'------------------------------------------------------------------------------
Public Property Get NewEnum() As IUnknown
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


