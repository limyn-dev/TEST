VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "COrganismes"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Collection" ,"COrganisme"
Attribute VB_Ext_KEY = "Member0" ,"COrganisme"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"399DA3710366"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
Option Explicit



'local variable to hold collection
'##ModelId=399DA73C015E
Private mCol As Collection
Attribute mCol.VB_VarDescription = "local variable to hold collection"



' Ajout d'un organisme dans la collection
'------------------------------------------------------------------------------
'##ModelId=399DA7470370
Public Sub Add(ByRef objNewMember As COrganisme, Optional sKey As String)
Attribute Add.VB_Description = " Ajout d'un organisme dans la collection\r\n------------------------------------------------------------------------------"
    If Len(sKey) = 0 Then
        mCol.Add objNewMember
    Else
        mCol.Add objNewMember, sKey
    End If
End Sub

' Accès à un des organismes de la collection
'------------------------------------------------------------------------------
'##ModelId=399DA73B02B2
Public Property Get Item(vntIndexKey As Variant) As COrganisme
Attribute Item.VB_Description = " Accès à un des organismes de la collection\r\n------------------------------------------------------------------------------"
Attribute Item.VB_UserMemId = 0
    Set Item = mCol(vntIndexKey)
End Property

' Nombre d'organismes de la collection
'------------------------------------------------------------------------------
'##ModelId=399DA73A03CA
Public Property Get Count() As Long
Attribute Count.VB_Description = " Nombre d'organismes de la collection\r\n------------------------------------------------------------------------------"
    Count = mCol.Count
End Property

' Suppression d'un organisme
'------------------------------------------------------------------------------
'##ModelId=399DA74A012C
Public Sub Remove(vntIndexKey As Variant)
Attribute Remove.VB_Description = " Suppression d'un organisme\r\n------------------------------------------------------------------------------"
    mCol.Remove vntIndexKey
End Sub

' Enumération for Each
'------------------------------------------------------------------------------
'##ModelId=399DA73C0384
Public Property Get NewEnum() As IUnknown
Attribute NewEnum.VB_Description = " Enumération for Each\r\n------------------------------------------------------------------------------"
Attribute NewEnum.VB_UserMemId = -4
Attribute NewEnum.VB_MemberFlags = "40"
    Set NewEnum = mCol.[_NewEnum]
End Property



'******************************************************************************



' Instanciation
'------------------------------------------------------------------------------
'##ModelId=399DA7490096
Private Sub Class_Initialize()
Attribute Class_Initialize.VB_Description = " Instanciation\r\n------------------------------------------------------------------------------"
    Set mCol = New Collection
End Sub

' Désinstanciation
'------------------------------------------------------------------------------
'##ModelId=399DA74902EE
Private Sub Class_Terminate()
Attribute Class_Terminate.VB_Description = " Désinstanciation\r\n------------------------------------------------------------------------------"
    Set mCol = Nothing
End Sub

