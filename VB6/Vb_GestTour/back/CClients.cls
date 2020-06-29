VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CClients"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"399DA887006E"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Collection"
Option Explicit

'local variable to hold collection
'##ModelId=399DA8A9014A
Private mCol As Collection
Attribute mCol.VB_VarDescription = "local variable to hold collection"

'used when retrieving the number of elements in the collection. Syntax: Debug.Print x.Count
'------------------------------------------------------------------------------
'##ModelId=399DA8A801F4
Public Property Get Count() As Long
Attribute Count.VB_Description = "used when retrieving the number of elements in the\r\ncollection. Syntax: Debug.Print x.Count"
    Count = mCol.Count
End Property

'used when referencing an element in the collection
'vntIndexKey contains either the Index or Key to the collection,
'this is why it is declared as a Variant
'Syntax: Set foo = x.Item(xyz) or Set foo = x.Item(5)
'------------------------------------------------------------------------------
'##ModelId=399DA8A80231
Public Property Get Item(vntIndexKey As Variant) As Variant
Attribute Item.VB_Description = "used when referencing an element in the collection\r\nvntIndexKey contains either the Index or Key to the collection,\r\nthis is why it is declared as a Variant\r\nSyntax: Set foo = x.Item(xyz) or Set foo = x.Item(5)"
Attribute Item.VB_UserMemId = 0
    Set Item = mCol(vntIndexKey)
End Property

'this property allows you to enumerate
'this collection with the For...Each syntax
'------------------------------------------------------------------------------
'##ModelId=399DA8A802D0
Public Property Get NewEnum() As IUnknown
Attribute NewEnum.VB_Description = "this property allows you to enumerate\r\nthis collection with the For...Each syntax"
Attribute NewEnum.VB_UserMemId = -4
    Set NewEnum = mCol.[_NewEnum]
End Property

'used when adding a new item to the collection
'syntax: x.Add ayz
'------------------------------------------------------------------------------
'##ModelId=399DA8A8030C
Public Sub Add(Item As CCircuit, Optional Key As Variant, Optional Before As Variant, Optional After As Variant)
Attribute Add.VB_Description = "used when adding a new item to the collection\r\nsyntax: x.Add ayz"
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
'##ModelId=399DA8A900A0
Public Sub Remove(vntIndexKey As Variant)
Attribute Remove.VB_Description = "used when removing an element from the collection\r\nvntIndexKey contains either the Index or Key, which is why\r\nit is declared as a Variant\r\nSyntax: x.Remove(xyz)"
    mCol.Remove vntIndexKey
End Sub



'******************************************************************************



' Instanciation
'------------------------------------------------------------------------------
'##ModelId=399DA8A9017C
Private Sub Class_Initialize()

End Sub

' Désinstanciation
'------------------------------------------------------------------------------
'##ModelId=399DA8A901EA
Private Sub Class_Terminate()

End Sub
