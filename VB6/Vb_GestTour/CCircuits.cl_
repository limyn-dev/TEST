VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CEtapes"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"399DB3150186"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Collection"
Option Explicit

'local variable to hold collection
'##ModelId=399DB3440276
Private mCol As Collection
Attribute mCol.VB_VarDescription = "local variable to hold collection"

'used when retrieving the number of elements in the
'collection. Syntax: Debug.Print x.Count
'##ModelId=399DB3430320
Public Property Get Count() As Long
Attribute Count.VB_Description = "used when retrieving the number of elements in the\r\ncollection. Syntax: Debug.Print x.Count"
    Count = mCol.Count
End Property

'used when referencing an element in the collection
'vntIndexKey contains either the Index or Key to the collection,
'this is why it is declared as a Variant
'Syntax: Set foo = x.Item(xyz) or Set foo = x.Item(5)
'##ModelId=399DB343035C
Public Property Get Item(vntIndexKey As Variant) As Variant
Attribute Item.VB_Description = "used when referencing an element in the collection\r\nvntIndexKey contains either the Index or Key to the collection,\r\nthis is why it is declared as a Variant\r\nSyntax: Set foo = x.Item(xyz) or Set foo = x.Item(5)"
Attribute Item.VB_UserMemId = 0
    Set Item = mCol(vntIndexKey)
End Property

'this property allows you to enumerate
'this collection with the For...Each syntax
'##ModelId=399DB3440014
Public Property Get NewEnum() As IUnknown
Attribute NewEnum.VB_Description = "this property allows you to enumerate\r\nthis collection with the For...Each syntax"
Attribute NewEnum.VB_UserMemId = -4
    Set NewEnum = mCol.[_NewEnum]
End Property

'used when adding a new item to the collection
'syntax: x.Add ayz
'##ModelId=399DB3440050
Public Sub Add(Item As Variant, Optional Key As Variant, Optional Before As Variant, Optional After As Variant)
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
'##ModelId=399DB34401CC
Public Sub Remove(vntIndexKey As Variant)
Attribute Remove.VB_Description = "used when removing an element from the collection\r\nvntIndexKey contains either the Index or Key, which is why\r\nit is declared as a Variant\r\nSyntax: x.Remove(xyz)"
    mCol.Remove vntIndexKey
End Sub

'##ModelId=399DB34402E4
Private Sub Class_Initialize()

End Sub

'##ModelId=399DB3440316
Private Sub Class_Terminate()

End Sub
