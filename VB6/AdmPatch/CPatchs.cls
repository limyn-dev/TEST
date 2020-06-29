VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CPackage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Collection" ,"CPatch"
Attribute VB_Ext_KEY = "Member0" ,"CPatch"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit

' Membres
Private mCol As Collection
Private myMjv As Long
Private myMnv As Long

' Major version Property
'______________________________________________________________________________________________________________________
Public Property Get MajorVersion() As Long
   MajorVersion = myMjv
End Property
Public Property Let MajorVersion(nValue As Long)
   myMjv = nValue
End Property

' Minor version property
'______________________________________________________________________________________________________________________
Public Property Get MinorVersion() As Long
   MinorVersion = myMnv
End Property
Public Property Let MinorVersion(nValue As Long)
   myMnv = nValue
End Property

' Addition of a patch
'______________________________________________________________________________________________________________________
Public Function PatchAdd(sName As String, sKey As String, sCommand As String) As CPatch
   Set PatchAdd = New CPatch
   PatchAdd.Name = sName
   PatchAdd.Key = sKey
   PatchAdd.Command = sCommand
   mCol.Add PatchAdd, sName
End Function

' Selection of a patch
'______________________________________________________________________________________________________________________
Public Property Get PatchItem(vntIndexKey As Variant) As CPatch
Attribute PatchItem.VB_UserMemId = 0
   On Error GoTo NotFound
   Set PatchItem = mCol(vntIndexKey)
   GoTo Fin
NotFound:
   Set PatchItem = Nothing
Fin:
End Property

' Nombre d'items
'______________________________________________________________________________________________________________________
Public Property Get PatchCount() As Long
   PatchCount = mCol.Count
End Property

' Suppression d'un item
'______________________________________________________________________________________________________________________
Public Sub PatchRemove(vntIndexKey As Variant)
   mCol.Remove vntIndexKey
End Sub

' Enumération des items
'______________________________________________________________________________________________________________________
Public Property Get NewEnum() As IUnknown
Attribute NewEnum.VB_UserMemId = -4
Attribute NewEnum.VB_MemberFlags = "40"
    Set NewEnum = mCol.[_NewEnum]
End Property

' Instance creation
'______________________________________________________________________________________________________________________
Private Sub Class_Initialize()
    Set mCol = New Collection
End Sub

' Instance deletion
'______________________________________________________________________________________________________________________
Private Sub Class_Terminate()
    Set mCol = Nothing
End Sub

