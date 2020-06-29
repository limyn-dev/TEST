VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CAccompagnateurs"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Collection" ,"CAccompagnateur"
Attribute VB_Ext_KEY = "Member0" ,"CAccompagnateur"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"39A6E4BC01AE"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
Option Explicit

'local variable to hold collection
'##ModelId=39A6E4BC024E
Private mCol As Collection
Attribute mCol.VB_VarDescription = "local variable to hold collection"

' Ajout d'un accompagnateur dans la collection
'------------------------------------------------------------------------------
'##ModelId=39A6E4BC024F
Public Sub Add(objNewMember As CAccompagnateur, Optional sKey As String)
Attribute Add.VB_Description = " Ajout d'un accompagnateur dans la collection\r\n------------------------------------------------------------------------------"
    If Len(sKey) = 0 Then
        mCol.Add objNewMember
    Else
        mCol.Add objNewMember, sKey
    End If
End Sub

' Accès à un des accompagnateur de la collection
'------------------------------------------------------------------------------
'##ModelId=39A6E4BC02BC
Public Property Get Item(vntIndexKey As Variant) As CAccompagnateur
Attribute Item.VB_Description = " Accès à un des accompagnateur de la collection\r\n------------------------------------------------------------------------------"
Attribute Item.VB_UserMemId = 0
    Set Item = mCol(vntIndexKey)
End Property

' Nombre d' accompagnateur de la collection
'------------------------------------------------------------------------------
'##ModelId=39A6E4BC02F9
Public Property Get Count() As Long
Attribute Count.VB_Description = " Nombre d' accompagnateur de la collection\r\n------------------------------------------------------------------------------"
    Count = mCol.Count
End Property

' Suppression d'un organisme
'------------------------------------------------------------------------------
'##ModelId=39A6E4BC032B
Public Sub Remove(vntIndexKey As Variant)
Attribute Remove.VB_Description = " Suppression d'un organisme\r\n------------------------------------------------------------------------------"
    mCol.Remove vntIndexKey
End Sub

' Enumération for Each
'------------------------------------------------------------------------------
'##ModelId=39A6E4BC035C
Public Property Get NewEnum() As IUnknown
Attribute NewEnum.VB_Description = " Enumération for Each\r\n------------------------------------------------------------------------------"
Attribute NewEnum.VB_UserMemId = -4
Attribute NewEnum.VB_MemberFlags = "40"
    Set NewEnum = mCol.[_NewEnum]
End Property



'******************************************************************************



' Instanciation
'------------------------------------------------------------------------------
'##ModelId=39A6E4BC0399
Private Sub Class_Initialize()
Attribute Class_Initialize.VB_Description = " Instanciation\r\n------------------------------------------------------------------------------"
    Set mCol = New Collection
End Sub

' Désinstanciation
'------------------------------------------------------------------------------
'##ModelId=39A6E4BC03CA
Private Sub Class_Terminate()
Attribute Class_Terminate.VB_Description = " Désinstanciation\r\n------------------------------------------------------------------------------"
    Set mCol = Nothing
End Sub

