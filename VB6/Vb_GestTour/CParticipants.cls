VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CParticipants"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Collection" ,"CParticipant"
Attribute VB_Ext_KEY = "Member0" ,"CParticipant"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"39A6E4BB010E"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
Option Explicit

'local variable to hold collection
'##ModelId=39A6E4BB017C
Private mCol As Collection
Attribute mCol.VB_VarDescription = "local variable to hold collection"

' Ajout d'un participant dans la liste
'------------------------------------------------------------------------------
'##ModelId=39A6E4BB01B8
Public Sub Add(ByRef objNewMember As CParticipant, Optional sKey As String)
Attribute Add.VB_Description = " Ajout d'un participant dans la liste\r\n------------------------------------------------------------------------------"
    If Len(sKey) = 0 Then
        mCol.Add objNewMember
    Else
        mCol.Add objNewMember, sKey
    End If
End Sub

' Accès à un des participants de la liste
'------------------------------------------------------------------------------
'##ModelId=39A6E4BB01EB
Public Property Get Item(vntIndexKey As Variant) As CParticipant
Attribute Item.VB_Description = " Accès à un des participants de la liste\r\n------------------------------------------------------------------------------"
Attribute Item.VB_UserMemId = 0
    Set Item = mCol(vntIndexKey)
End Property


' Nombre de participants dans la liste
'------------------------------------------------------------------------------
'##ModelId=39A6E4BB0258
Public Property Get Count() As Long
Attribute Count.VB_Description = " Nombre de participants dans la liste\r\n------------------------------------------------------------------------------"
    Count = mCol.Count
End Property

' Suppression d'un des participants de la liste
'------------------------------------------------------------------------------
'##ModelId=39A6E4BB0294
Public Sub Remove(vntIndexKey As Variant)
Attribute Remove.VB_Description = " Suppression d'un des participants de la liste\r\n------------------------------------------------------------------------------"
    mCol.Remove vntIndexKey
End Sub

' Enumeration with the For...Each syntax
'------------------------------------------------------------------------------
'##ModelId=39A6E4BB02C6
Public Property Get NewEnum() As IUnknown
Attribute NewEnum.VB_Description = " Enumeration with the For...Each syntax\r\n------------------------------------------------------------------------------"
Attribute NewEnum.VB_UserMemId = -4
Attribute NewEnum.VB_MemberFlags = "40"
    Set NewEnum = mCol.[_NewEnum]
End Property



'******************************************************************************



' Instaciation
'------------------------------------------------------------------------------
'##ModelId=39A6E4BB02CB
Private Sub Class_Initialize()
Attribute Class_Initialize.VB_Description = " Instaciation\r\n------------------------------------------------------------------------------"
    Set mCol = New Collection
End Sub

' Désinstanciation
'------------------------------------------------------------------------------
'##ModelId=39A6E4BB0334
Private Sub Class_Terminate()
Attribute Class_Terminate.VB_Description = " Désinstanciation\r\n------------------------------------------------------------------------------"
    Set mCol = Nothing
End Sub

