VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "C_Types"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'------------------------------------------------------------------------------
'  Instanciation, désinstanciation de la clase
'==============================================================================
Private Sub Class_Initialize()
End Sub
'------------------------------------------------------------------------------
Private Sub Class_Terminate()
End Sub




'******************************************************************************

'------------------------------------------------------------------------------
'  Nombre de types
'==============================================================================
Public Property Get Nombre() As Integer

   ' Valorisation de la propriété
   Nombre = M_Db.tblTpe.Fields.Count
   
End Property
'------------------------------------------------------------------------------
'Public Property Let Nombre(ByVal vNewValue As Variant)
'End Property

'------------------------------------------------------------------------------
'  Nom du type
'==============================================================================
Public Property Get Nom(id As Long) As String

   ' Positionnement sur la table
   M_Db.tpeFnd id
   
   ' Valorisation de la propriété
   Nom = M_Db.tblTpe.Fields(M_Db.FLDTPENOM).Value
   
End Property
'------------------------------------------------------------------------------
Public Property Let Nom(id As Long, ByVal str As String)
End Property


