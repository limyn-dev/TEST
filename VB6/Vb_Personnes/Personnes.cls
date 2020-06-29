VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "C_Personnes"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

' Noms des Champs id
Const FLDCTNID = "cntId"
Const FLDLOCID = "locId"
Const FLDPRSID = "prsId"

' Tables de la DB
Private tblCtn As ADODB.Recordset
Private tblLoc As ADODB.Recordset
Private tblPrs As ADODB.Recordset

Private mPrs As C_Personne

'------------------------------------------------------------------------------
'  Instanciation, désinstanciation de l'instance
'==============================================================================
Private Sub Class_Initialize()

   ' Ouverture de la table des cantons
   Set tblCtn = New ADODB.Recordset
   tblCtn.Open "Cantons", frmMain.con, , , adCmdTableDirect
   
   ' Ouverture de la table des localités
   Set tblLoc = New ADODB.Recordset
   tblLoc.Open "Localites", frmMain.con, , , adCmdTableDirect
   
   ' Ouverture de la table des personnes
   Set tblPrs = New ADODB.Recordset
   tblPrs.Open "Personnes", frmMain.con, , , adCmdTableDirect
   
   ' Instanciation des membres
   Set mPrs = New C_Personne
   
End Sub
'------------------------------------------------------------------------------
Private Sub Class_Terminate()

   ' fermeture de la table des cantons
   tblCtn.Close
   Set tblCtn = Nothing
   
    ' fermeture de la table des localités
   tblLoc.Close
   Set tblLoc = Nothing
   
    ' fermeture de la table des Personnes
   tblPrs.Close
   Set tblPrs = Nothing
   
   ' Désinstanciation des membres
   Set mPrs = Nothing
   
End Sub

'------------------------------------------------------------------------------
'  Propriété Item, intérface sur une personne en fonction de son id
'==============================================================================
Private Sub setPrs(Id As Long)

   ' Positionnement sur les tables
   tblPrs.Find FLDPRSID & "=" & CStr(Id)
   tblLoc.Find FLDLOCID & "=" & CStr(tblPrs.Fields("_LocId").Value)
   tblCtn.Find FLDCTNID & "=" & CStr(tblPrs.Fields("_LocId").Value)
   
   ' Valorisation du membre
   mPrs
End Sub


'******************************************************************************

'------------------------------------------------------------------------------
'  Propriété Item, intérface sur une personne en fonction de son id
'==============================================================================
Public Property Get Item(Id As Long) As C_Personne

   ' Instanciation de la propriété
   Set Item = New C_Personne
   
   
   

End Property
'------------------------------------------------------------------------------
Public Property Let Item(Id As Long, ByVal vNewValue As Variant)

End Property
