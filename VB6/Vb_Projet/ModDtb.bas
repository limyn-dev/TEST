Attribute VB_Name = "ModDtb"
Option Explicit

Const NOMDB = "\DB\GstMedia.mdb"

' Connexion su la DB
Public con As ADODB.Connection

' Catalogue de la db
Public cat As New ADOx.Catalog

' Jeux d'enregistrement principaux
Public rstCpo As New ADODB.Recordset
Public rstTpe As New ADODB.Recordset
Public rstRef As New ADODB.Recordset
Public rstSup As New ADODB.Recordset
Public rstsDsc() As ADODB.Recordset

' Contrôle de la connexion
Private conInit As Boolean

'------------------------------------------------------------------------------
' Mise à jour de la valeur d'un champs d'une table
'==============================================================================
Public Sub updateDsc(ByRef tbl As ADODB.Recordset, fld As String, val As Variant)
   
   ' Mise à jour du champs en fonction de son type
   Select Case tbl.Fields(fld).Type
      Case adInteger
         tbl.Update fld, CLng(val)
      Case adVarChar
         tbl.Update fld, CStr(val)
   End Select
   
End Sub

'------------------------------------------------------------------------------
' Déplace le curseur d'un rst à la position de la valeur
'==============================================================================
Public Function rstSetPos(ByRef rst As ADODB.Recordset, nomFld As String, val As String) As Boolean
   
   ' Remise à 0 du rst
   rst.MoveFirst
     
   ' Indexation du rst
   rst.Find nomFld & "=" & val
   
   ' Controle
   
End Function

'------------------------------------------------------------------------------
' Remplit une cbo avec les types des composants
'==============================================================================
Public Sub loadTpeCbo(ByRef cbo As ComboBox)
   
   ' Chargement de la cbo
   cbo.Clear
   
   ' Initialisation du rst
   rstTpe.MoveFirst
   
   ' Remplissage de la cbo
   While Not rstTpe.EOF
      
      With rstTpe.Fields
         cbo.AddItem CStr(.Item("TpeNom").Value)
         cbo.ItemData(cbo.ListCount - 1) = .Item("TpeId_").Value
      End With
      
      rstTpe.MoveNext
      
   Wend
   
End Sub

'------------------------------------------------------------------------------
' Execute une commande qui a un param Id en fonction de son nom et del'Id
'==============================================================================
Function ExecCmdId(nomCmd As String, Id As Long) As ADODB.Recordset
   
   ' Execution de la commande
   With cat.Procedures.Item(nomCmd).Command
   
      ' Valorisation du parametre
      .Parameters.Item("[Id]").Value = Id
   
      ' Execution de la commande
      Set ExecCmdId = .Execute
      
   End With
   
End Function

'------------------------------------------------------------------------------
' Ouverture des acces sur la DB
'==============================================================================
Sub setCon()
   
   ' Contrôle de l'etat de la connexion
   If Not conInit Then
   
      ' Création de la Connexion sur la DB
      Set con = New ADODB.Connection
      con.Provider = "Microsoft.Jet.OLEDB.4.0"
      con.Open App.Path & NOMDB, "Admin", ""
   
      ' Création du catalogue
      cat.ActiveConnection = con
      
      ' Création des rst de bases
      rstCpo.Open "Composants", con, adOpenKeyset, adLockOptimistic, -1
      rstTpe.Open "Types", con, adOpenKeyset, adLockOptimistic, -1
      rstRef.Open "LiensRef", con, adOpenKeyset, adLockOptimistic, -1
      rstSup.Open "LiensSup", con, adOpenKeyset, adLockOptimistic, -1
      
      ' Création des rst de déscription
      Dim TpeId As Long
      Dim nomTbl As String
      ReDim rstsDsc(1)
      While Not rstTpe.EOF
         TpeId = rstTpe.Fields("TpeId_").Value
         If UBound(rstsDsc()) < TpeId Then ReDim Preserve rstsDsc(TpeId)
         nomTbl = "TblDsc_" & CStr(TpeId)
         Set rstsDsc(TpeId) = New ADODB.Recordset
         rstsDsc(TpeId).Open nomTbl, con, adOpenKeyset, adLockOptimistic, -1
         rstTpe.MoveNext
      Wend
   
      ' Flag de l'initialisation de la connexion
      conInit = True
      
   End If
   
End Sub

'------------------------------------------------------------------------------
' Férmeture de tous les access sur la DB
'==============================================================================
Sub delCon()

   ' Check de l'état de la connexion
   If conInit Then
   
      ' Fermeture des rst de description
      Dim numRst As Integer
         For numRst = 1 To UBound(rstsDsc())
         rstsDsc(numRst).Close
         Set rstsDsc(numRst) = Nothing
      Next numRst
   
      ' Fermenture des rst principaux
      rstCpo.Close
      rstTpe.Close
      rstRef.Close
      rstSup.Close
      Set rstCpo = Nothing
      Set rstTpe = Nothing
      Set rstRef = Nothing
      Set rstSup = Nothing
   
      ' Fermeture du catalogue
      Set cat.ActiveConnection = Nothing
      Set cat = Nothing
   
      ' Fermeture Déconnection
      con.Close
      Set con = Nothing
   
      ' Flag de la déconnexion
      conInit = False
   
   End If
   
End Sub
