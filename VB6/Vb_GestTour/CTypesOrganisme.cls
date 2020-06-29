VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CTypesOrganisme"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Collection" ,"CTypeOrganisme"
Attribute VB_Ext_KEY = "Member0" ,"CTypeOrganisme"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"39A6E4AE03CA"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
'local variable to hold collection
'##ModelId=39A6E4AF0050
Private mCol As Collection
Attribute mCol.VB_VarDescription = "local variable to hold collection"

' Ajout d'un organisme dans la collection
'------------------------------------------------------------------------------
'##ModelId=39A6E4AF0082
Public Sub Add(objNewMember As CTypeOrganisme, Optional sKey As String)
Attribute Add.VB_Description = " Ajout d'un organisme dans la collection\r\n------------------------------------------------------------------------------"
    If Len(sKey) = 0 Then
        mCol.Add objNewMember
    Else
        mCol.Add objNewMember, sKey
    End If
End Sub

' Accès à un des organismes
'------------------------------------------------------------------------------
'##ModelId=39A6E4AF00BF
Public Property Get Item(vntIndexKey As Variant) As CTypeOrganisme
Attribute Item.VB_Description = " Accès à un des organismes\r\n------------------------------------------------------------------------------"
Attribute Item.VB_UserMemId = 0
  Set Item = mCol(vntIndexKey)
End Property


' Nombre d'organisme dans la collection
'------------------------------------------------------------------------------
'##ModelId=39A6E4AF00F4
Public Property Get Count() As Long
Attribute Count.VB_Description = " Nombre d'organisme dans la collection\r\n------------------------------------------------------------------------------"
    Count = mCol.Count
End Property

' Suppression d'un des organismes de la collection
'------------------------------------------------------------------------------
'##ModelId=39A6E4AF0130
Public Sub Remove(vntIndexKey As Variant)
Attribute Remove.VB_Description = " Suppression d'un des organismes de la collection\r\n------------------------------------------------------------------------------"
    mCol.Remove vntIndexKey
End Sub

' Enumerat with the For...Each syntax
'------------------------------------------------------------------------------
'##ModelId=39A6E4AF015F
Public Property Get NewEnum() As IUnknown
Attribute NewEnum.VB_Description = " Enumerat with the For...Each syntax\r\n------------------------------------------------------------------------------"
Attribute NewEnum.VB_UserMemId = -4
Attribute NewEnum.VB_MemberFlags = "40"
    Set NewEnum = mCol.[_NewEnum]
End Property



'******************************************************************************



' Instanciation
'------------------------------------------------------------------------------
'##ModelId=39A6E4AF019D
Private Sub Class_Initialize()
Attribute Class_Initialize.VB_Description = " Instanciation\r\n------------------------------------------------------------------------------"
    Set mCol = New Collection
End Sub

' Désinstanciation
'------------------------------------------------------------------------------
'##ModelId=39A6E4AF01CC
Private Sub Class_Terminate()
Attribute Class_Terminate.VB_Description = " Désinstanciation\r\n------------------------------------------------------------------------------"
    Set mCol = Nothing
End Sub

