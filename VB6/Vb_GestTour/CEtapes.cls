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
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Collection" ,"CEtape"
Attribute VB_Ext_KEY = "Member0" ,"CEtape"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"399DB3150186"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
Option Explicit



'local variable to hold collection
'##ModelId=399DB3440276
Private mCol As Collection
Attribute mCol.VB_VarDescription = "local variable to hold collection"



' Ajout d'une étape dans la collection
'------------------------------------------------------------------------------
'##ModelId=399DB3440050
Public Sub Add(ByRef objNewMember As CEtape, Optional sKey As String)
Attribute Add.VB_Description = " Ajout d'une étape dans la collection\r\n------------------------------------------------------------------------------"
    If Len(sKey) = 0 Then
        mCol.Add objNewMember
    Else
        mCol.Add objNewMember, sKey
    End If
End Sub

' Accès à une des étapes de la collection
'------------------------------------------------------------------------------
'##ModelId=399DB343035C
Public Property Get Item(vntIndexKey As Variant) As CEtape
Attribute Item.VB_Description = " Accès à une des étapes de la collection\r\n------------------------------------------------------------------------------"
Attribute Item.VB_UserMemId = 0
    Set Item = mCol(vntIndexKey)
End Property

' Nombre d'étapes de la collection
'------------------------------------------------------------------------------
'##ModelId=399DB3430320
Public Property Get Count() As Long
Attribute Count.VB_Description = " Nombre d'étapes de la collection\r\n------------------------------------------------------------------------------"
    Count = mCol.Count
End Property

' Suppression d'une étape
'------------------------------------------------------------------------------
'##ModelId=399DB34401CC
Public Sub Remove(vntIndexKey As Variant)
Attribute Remove.VB_Description = " Suppression d'une étape\r\n------------------------------------------------------------------------------"
    mCol.Remove vntIndexKey
End Sub

' Enumération for Each
'------------------------------------------------------------------------------
'##ModelId=399DB3440014
Public Property Get NewEnum() As IUnknown
Attribute NewEnum.VB_Description = " Enumération for Each\r\n------------------------------------------------------------------------------"
Attribute NewEnum.VB_UserMemId = -4
Attribute NewEnum.VB_MemberFlags = "40"
    Set NewEnum = mCol.[_NewEnum]
End Property



'******************************************************************************



' Instanciation
'------------------------------------------------------------------------------
'##ModelId=399DB34402E4
Private Sub Class_Initialize()
Attribute Class_Initialize.VB_Description = " Instanciation\r\n------------------------------------------------------------------------------"
    Set mCol = New Collection
End Sub

' Désinstanciation
'------------------------------------------------------------------------------
'##ModelId=399DB3440316
Private Sub Class_Terminate()
Attribute Class_Terminate.VB_Description = " Désinstanciation\r\n------------------------------------------------------------------------------"
    Set mCol = Nothing
End Sub

