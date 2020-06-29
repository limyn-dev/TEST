VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CPatch"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Member0" ,"CRegKeys"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
 Option Explicit


' Membres
Private myNme As String ' Patch name
Private myCmd As String ' Patch command line
Private myKey As String ' Patch registry key

' Command properties
Public Property Get Name() As String:              Name = myNme:     End Property
Public Property Let Name(ByVal sValue As String):  myNme = sValue:   End Property

' Command properties
Public Property Get Command() As String:              Command = myCmd:  End Property
Public Property Let Command(ByVal sValue As String):  myCmd = sValue:   End Property

' Key properties
Public Property Get Key() As String:                  Key = myKey:      End Property
Public Property Let Key(ByVal sValue As String):      myKey = sValue:   End Property

' Class instanciation
Private Sub Class_Initialize()
End Sub

' Class deletion
Private Sub Class_Terminate()
End Sub









