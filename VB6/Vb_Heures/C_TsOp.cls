VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "C_TsOp"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit


'==============================================================================
' Instanciation, désinstanciation de la classe
'------------------------------------------------------------------------------
Private Sub Class_Initialize()
End Sub
'------------------------------------------------------------------------------
Private Sub Class_Terminate()
End Sub

'==============================================================================
' Type d'opération en fonction de son id
'------------------------------------------------------------------------------
Public Property Get Item(ByVal Id As Long) As C_TOp
   
   ' Instanciation de la propriété
   Set Item = New C_TOp

   ' Valorisation de la propriété
   Item.Id = Id
   
End Property
'------------------------------------------------------------------------------
'Public Property Set Item(ByVal Id As Long, TOp As C_TOp)'
'End Property

