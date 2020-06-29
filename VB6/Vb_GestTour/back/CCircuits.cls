VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CCircuits"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'local variable to hold collection
Private mCol As Collection

'used when retrieving the number of elements in the
'collection. Syntax: Debug.Print x.Count
'------------------------------------------------------------------------------
Public Property Get Count() As Long
    Count = mCol.Count
End Property

'used when referencing an element in the collection
'vntIndexKey contains either the Index or Key to the collection,
'this is why it is declared as a Variant
'Syntax: Set foo = x.Item(xyz) or Set foo = x.Item(5)
'------------------------------------------------------------------------------
Public Property Get Item(vntIndexKey As CCircuit) As Variant
    Set Item = mCol(vntIndexKey)
End Property

'this property allows you to enumerate
'this collection with the For...Each syntax
'------------------------------------------------------------------------------
Public Property Get NewEnum() As IUnknown
    Set NewEnum = mCol.[_NewEnum]
End Property

'used when adding a new item to the collection
'syntax: x.Add ayz
'------------------------------------------------------------------------------
Public Sub Add(Item As CCircuit, Optional Key As Variant, Optional Before As Variant, Optional After As Variant)
    If Len(Key) = 0 Then
        mCol.Add Item
    Else
        mCol.Add Item, Key
    End If
End Sub

'used when removing an element from the collection
'vntIndexKey contains either the Index or Key, which is why
'it is declared as a Variant
'Syntax: x.Remove(xyz)
'------------------------------------------------------------------------------
Public Sub Remove(vntIndexKey As Variant)
    mCol.Remove vntIndexKey
End Sub



'******************************************************************************



' Instaciation
'------------------------------------------------------------------------------
Private Sub Class_Initialize()

End Sub

' Désinstanciation
'------------------------------------------------------------------------------
Private Sub Class_Terminate()

End Sub

