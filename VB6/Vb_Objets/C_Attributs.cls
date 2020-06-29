VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "C_Attributs"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'------------------------------------------------------------------------------
'  Instanciation, désinstanciation de la classe
'==============================================================================
Private Sub Class_Initialize()
End Sub
'------------------------------------------------------------------------------
Private Sub Class_Terminate()
End Sub




'******************************************************************************

'------------------------------------------------------------------------------
'  Nombre d'attribut
'==============================================================================
Public Property Get Nombre(tpeId As Long) As Long

   ' Valorisation de la propriété
   Nombre = M_Db.tblsAtr(tpeId).Fields.Count
   
End Property
'------------------------------------------------------------------------------
'Public Property Let Nombre(ByVal vNewValue As Variant)
'End Property

'------------------------------------------------------------------------------
'  Nom d'un des attributs
'==============================================================================
Public Property Get nom(tpeId As Long, atrId As Long) As String

   ' Positionnement sur la table
   M_Db.atrFnd tpeId, atrId
   
   ' Valorisation de la propriété
   nom = M_Db.tblTpe.Fields(M_Db.FLDTPENOM).Value
   
End Property
'------------------------------------------------------------------------------
Public Property Let nom(tpeId As Long, atrId As Long, ByVal str As String)
End Property

'------------------------------------------------------------------------------
'  Type d'un des attribut
'==============================================================================
Public Property Get VbType(tpeId As Long, atrId As Long) As Long
   
   ' Positionnement sur la table
   M_Db.atrFnd tpeId, atrId
   
   ' Valorisation de la propriété
   VbType = M_Db.tblsAtr(tpeId).Fields(M_Db.FLDATRTPE).Value
   
End Property
'------------------------------------------------------------------------------
Public Property Let VbType(tpeId As Long, atrId As Long, ByVal val As Integer)
End Property

'------------------------------------------------------------------------------
'  Ajout, suppression d'attribut
'==============================================================================
Public Sub Ajouter(tpeId As Long, nom As String, atrTpe As Long)

   ' Ajout de l'enregistrement dans la table
   M_Db.atrAdd tpeId, nom, atrId
   
End Sub
'------------------------------------------------------------------------------
Public Sub Supprimer(tpeId As Long, atrId As Long)

   ' Suppression de l'enregistrement dans la table des attribut
   M_Db.atrDel tpeId, atrId
   
End Sub

