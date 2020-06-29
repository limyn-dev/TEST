VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "C_TIv"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

' Membres
Private mId As Long
Private mTOps As ADODB.Recordset

'------------------------------------------------------------------------------
'  Instanciation, désinstanciation de l'objet
'==============================================================================
Private Sub Class_Initialize()

   ' Instanciation des membres
   Set mTOps = New ADODB.Recordset
   
   ' Initialisation des membres
   mId = 0
   
End Sub
'------------------------------------------------------------------------------
Private Sub Class_Terminate()
   Dim TOp As C_TOp
   
   ' Désinstanciation des membres
   Set mTOps = Nothing
   
End Sub

'------------------------------------------------------------------------------
'  Positionnement sur une des tables en fonction de la valeur de la clef principale
'==============================================================================
Private Sub fndTIv()

   ' Check de la validité de l'Id
   If mId > 0 Then
   
      ' Positionnement dans la table
      With dtaHeures.rstblTIv
         If .EOF Then .MoveFirst
         If Not .Fields("Id").Value = mId Then
            If Not .BOF Then .MoveFirst
            .Find "Id=" & CStr(mId)
         End If
      End With
      
   End If
   
End Sub



'******************************************************************************

'------------------------------------------------------------------------------
'  Id du type d'intervention
'==============================================================================
Public Property Get Id() As Long

   ' Valorisation de la propriété
   Id = mId
   
End Property
'------------------------------------------------------------------------------
Public Property Let Id(ByVal val As Long)

   ' Valorisation de l'Id du type d'intervention
   mId = val
   
End Property

'------------------------------------------------------------------------------
'  Nom du type d'intervention
'==============================================================================
Public Property Get Nom() As String
   With dtaHeures.rstblTOp
   
      ' Recherhche l'id dans la table
      fndTOp
       
      ' Contrôle de la validité de la recherche et valorisation de la propriété
      If dtaHeures.rstblTOp.Fields("ID").Value = mId Then
         Nom = .Fields("Nom").Value
      Else
         Nom = "?"
      End If
      
   End With
End Property
'------------------------------------------------------------------------------
Public Property Let Nom(ByVal str As String)
   With dtaHeures.rstblTOp
   
      ' Positionnement sur la table
      fndTOp

      ' contrôle de la recherche et Modification de la valeur du champs
      If .Fields("Id").Value = mId Then .Fields("Nom").Value = str
   
   End With
End Property

'------------------------------------------------------------------------------
'  Types d'opération du type d'intérvention
'==============================================================================
Public Property Get TOpsCount() As Long
   With dtaHeures.rsLstTOp_TIv
   
      ' Valorisation de la propriété
      TOpsCount = .RecordCount
   
   End With
End Property
'------------------------------------------------------------------------------
Public Property Get TOpsItem(num As Long) As C_TOp
   Set TOpsItem = New C_TOp
   With dtaHeures.rsLstTOp_TIv
   
      ' Positionnemen sur la table
      .MoveFirst
      .Move num
      
      ' Valorisation de la propriété
      TOpsItem.Id = .Fields("TOpId").Value
   
   End With
   
End Property
'------------------------------------------------------------------------------
Public Sub TOpsAdd(TOp As C_TOp)
   Dim estDeja As Boolean: estDeja = False
   
   ' contrôle si le type d'opération existe pour de type d'intérvention
   With dtaHeures.lstTOp_TIv
      .MoveFirst
      While Not .EOF
         If .Fields("TOpId").Value = TOp.Id Then
            estDeja = True
         Else
            .MoveNext
         End If
      Wend
   End With
     
   ' Ajout du lien avec le type d'opération
   With dtaHeures.tblTOp_TIv
      If Not estDeja Then
         .AddNew
         
   End With
      
      ' Ajout du lien dans la table
      
End Sub


'------------------------------------------------------------------------------
'  Suppression de l'enregistrement
'==============================================================================
Public Sub Add()

   ' Recherche du dérnier id de la table
   With dtaHeures.rsidMaxTOp
      mId = .Fields("Id").Value + 1
   End With
   
   ' Ajout d'un enregistrement dans la table
   With dtaHeures.rstblTOp
      .AddNew
      !Id = mId
      .Update
   End With
   
End Sub
'------------------------------------------------------------------------------
Public Sub Del()
   With dtaHeures.rstblTOp
   
      ' Positionnement sur la table
      fndTOp
      
      ' Suppression de l'enregistrement
      If .Fields("Id").Value = mId Then
         .Delete
         mId = 0
         .Update
      End If
      
   End With
End Sub



