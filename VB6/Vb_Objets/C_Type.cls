VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "C_Type"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

' Table des types
Private tblTpe As ADODB.Recordset

' Données membres
'Private mTpeId As Long
'Private mTpeNom As String
'Private mTblAtrNom As String
'Private mTblObjNom As String

'------------------------------------------------------------------------------
'  Instanciation, désinstanciation de la clase
'==============================================================================
Private Sub Class_Initialize()

   ' Instanciation de la table
   Set tblTpe = New ADODB.Recordset
   tblTpe.Open "Types", frmMain.con
   
End Sub
'------------------------------------------------------------------------------
Private Sub Class_Terminate()

   ' Désinstanciation de la table
   tblTpe.Close
   Set tblTpe = Nothing
   
End Sub

'------------------------------------------------------------------------------
'  Instanciation, désinstanciation de la clase
'==============================================================================
Private Sub fndTpe(id As Long)

   If Not (tblTpe.Fields("TpeId").Value = id) Then
   
      ' Initialisation de la table
      tblTpe.Resync
      
      ' Recherche du type dans la table
      tblTpe.Find "TpeId=" & CStr(id)
   
   End If
   
End Sub



'******************************************************************************



'------------------------------------------------------------------------------
'  Id du type
'==============================================================================
Public Property Get id() As Long
   id = mTpeId
End Property
'------------------------------------------------------------------------------
Public Property Let id(ByVal val As Long)

End Property

'------------------------------------------------------------------------------
'  Nom du type
'==============================================================================
Public Property Get Nom() As String

End Property
'------------------------------------------------------------------------------
Public Property Let Nom(ByVal str As String)

End Property

'------------------------------------------------------------------------------
'  Nom de la table des attributs du type
'==============================================================================
Public Property Get NomAtrObj() As String

End Property
'------------------------------------------------------------------------------
Public Property Let NomAtrObj(ByVal str As String)

End Property

'------------------------------------------------------------------------------
'  Nom de la table des objets du type
'==============================================================================
Public Property Get NomTblObj() As String

End Property
'------------------------------------------------------------------------------
Public Property Let NomTblObj(ByVal str As String)

End Property
