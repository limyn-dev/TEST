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
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Collection" ,"CClient"
Attribute VB_Ext_KEY = "Member0" ,"CClient"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"399DA887006E"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
Option Explicit



'local variable to hold collection
'##ModelId=399DA8A9014A
Private mCol As Collection
Attribute mCol.VB_VarDescription = "local variable to hold collection"


' Ajout d'un client dans la collection
'------------------------------------------------------------------------------
'##ModelId=399DA8A8030C
Public Sub Add(ByRef objNewMember As CClient, Optional sKey As String)
Attribute Add.VB_Description = " Ajout d'un client dans la collection\r\n------------------------------------------------------------------------------"
    If Len(sKey) = 0 Then
        mCol.Add objNewMember
    Else
        mCol.Add objNewMember, sKey
    End If
End Sub

' Acc�s � un des clients de la collection
'------------------------------------------------------------------------------
'##ModelId=399DA8A80231
Public Property Get Item(vntIndexKey As Variant) As CClient
Attribute Item.VB_Description = " Acc�s � un des clients de la collection\r\n------------------------------------------------------------------------------"
Attribute Item.VB_UserMemId = 0
  Set Item = mCol(vntIndexKey)
End Property

' Nombre de clients de la collection
'------------------------------------------------------------------------------
'##ModelId=399DA8A801F4
Public Property Get Count() As Long
Attribute Count.VB_Description = " Nombre de clients de la collection\r\n------------------------------------------------------------------------------"
    Count = mCol.Count
End Property

' Suppression d'un client
'------------------------------------------------------------------------------
'##ModelId=399DA8A900A0
Public Sub Remove(vntIndexKey As Variant)
Attribute Remove.VB_Description = " Suppression d'un client\r\n------------------------------------------------------------------------------"
    mCol.Remove vntIndexKey
End Sub

' Enum�ration for Each
'------------------------------------------------------------------------------
'##ModelId=399DA8A802D0
Public Property Get NewEnum() As IUnknown
Attribute NewEnum.VB_Description = " Enum�ration for Each\r\n------------------------------------------------------------------------------"
Attribute NewEnum.VB_UserMemId = -4
Attribute NewEnum.VB_MemberFlags = "40"
    Set NewEnum = mCol.[_NewEnum]
End Property



'******************************************************************************



' Instanciation
'------------------------------------------------------------------------------
'##ModelId=399DA8A9017C
Private Sub Class_Initialize()
Attribute Class_Initialize.VB_Description = " Instanciation\r\n------------------------------------------------------------------------------"
    Set mCol = New Collection
End Sub

' D�sinstanciation
'------------------------------------------------------------------------------
'##ModelId=399DA8A901EA
Private Sub Class_Terminate()
Attribute Class_Terminate.VB_Description = " D�sinstanciation\r\n------------------------------------------------------------------------------"
    Set mCol = Nothing
End Sub
