VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CVilles"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Collection" ,"CVille"
Attribute VB_Ext_KEY = "Member0" ,"CVille"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"39A6E4AC0186"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
'local variable to hold collection
'##ModelId=39A6E4AC01F4
Private mCol As Collection
Attribute mCol.VB_VarDescription = "local variable to hold collection"

' Ajout d'une ville dans la collection
'------------------------------------------------------------------------------
'##ModelId=39A6E4AC0226
Public Sub Add(objNewMember As CVille, Optional sKey As String)
Attribute Add.VB_Description = " Ajout d'une ville dans la collection\r\n------------------------------------------------------------------------------"
    If Len(sKey) = 0 Then
        mCol.Add objNewMember
    Else
        mCol.Add objNewMember, sKey
    End If
End Sub

' Accès à une ville de la collection
'------------------------------------------------------------------------------
'##ModelId=39A6E4AC0294
Public Property Get Item(vntIndexKey As Variant) As CVille
Attribute Item.VB_Description = " Accès à une ville de la collection\r\n------------------------------------------------------------------------------"
Attribute Item.VB_UserMemId = 0
    Set Item = mCol(vntIndexKey)
End Property


' Nombre de ville dans la collection
'------------------------------------------------------------------------------
'##ModelId=39A6E4AC02D1
Public Property Get Count() As Long
Attribute Count.VB_Description = " Nombre de ville dans la collection\r\n------------------------------------------------------------------------------"
    Count = mCol.Count
End Property

' Retrait d'une ville de la collection
'------------------------------------------------------------------------------
'##ModelId=39A6E4AC0303
Public Sub Remove(vntIndexKey As Variant)
Attribute Remove.VB_Description = " Retrait d'une ville de la collection\r\n------------------------------------------------------------------------------"
    mCol.Remove vntIndexKey
End Sub

' Enumération For...Each
'------------------------------------------------------------------------------
'##ModelId=39A6E4AC033E
Public Property Get NewEnum() As IUnknown
Attribute NewEnum.VB_Description = " Enumération For...Each\r\n------------------------------------------------------------------------------"
Attribute NewEnum.VB_UserMemId = -4
Attribute NewEnum.VB_MemberFlags = "40"
    Set NewEnum = mCol.[_NewEnum]
End Property



'******************************************************************************



' Instanciation
'------------------------------------------------------------------------------
'##ModelId=39A6E4AC0371
Private Sub Class_Initialize()
Attribute Class_Initialize.VB_Description = " Instanciation\r\n------------------------------------------------------------------------------"
    Set mCol = New Collection
End Sub

' Déinstanciation
'------------------------------------------------------------------------------
'##ModelId=39A6E4AC03AC
Private Sub Class_Terminate()
Attribute Class_Terminate.VB_Description = " Déinstanciation\r\n------------------------------------------------------------------------------"
    Set mCol = Nothing
End Sub

