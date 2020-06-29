VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "SmartRegistry"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
Private psAppName As String
Private psSetting As String
Private psKey As String
Private psDefault As String
Private psSection As String




Public Property Get AppName() As String
AppName = psAppName
End Property

Public Property Let AppName(ByVal NewValue As String)
psAppName = NewValue

End Property
Public Property Get Key() As String
    Key = psKey
End Property

Public Property Let Key(ByVal NewValue As String)
    psKey = NewValue
End Property



Public Property Get Setting() As String
If Len(psSection) > 0 And Len(psKey) > 0 And Len(psAppName) > 0 Then
    psSetting = GetSetting(psAppName, psSection, psKey, psDefault)
    Setting = psSetting
End If
End Property

Public Property Let Setting(ByVal NewValue As String)

If Len(psSection) > 0 And Len(psKey) > 0 And Len(psAppName) > 0 Then
    psSetting = NewValue
    SaveSetting psAppName, psSection, psKey, psSetting
    
End If
End Property

Public Property Get Section() As String
Section = psSection
End Property

Public Property Let Section(ByVal NewValue As String)
psSection = NewValue
End Property

Public Property Get NamedSetting(Key As String) As String
If Len(psSection) > 0 And Len(psAppName) > 0 Then
    psSetting = GetSetting(psAppName, psSection, Key, psDefault)
    NamedSetting = psSetting
End If
End Property

Public Property Let NamedSetting(Key As String, ByVal NewValue As String)
If Len(psSection) > 0 And Len(psAppName) > 0 Then
    SaveSetting psAppName, psSection, Key, NewValue
    psSetting = NewValue
End If
    

End Property

Public Property Get Default() As String
    Default = psDefault
End Property

Public Property Let Default(ByVal NewValue As String)
    psDefault = NewValue
End Property
