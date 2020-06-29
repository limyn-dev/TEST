Attribute VB_Name = "M_Db"
Option Explicit

'------------------------------------------------------------------------------
'  Membres
'==============================================================================

' Connexion
Public con As ADODB.Connection

' Catalogue
Public cat As ADOX.Catalog

' Table des types et sa structure
Public tblTpe As ADODB.Recordset
Public Const FLDTPEID = "TpeId"
Public Const FLDTPENOM = "TpeNom"
Public Const FLDTBLOBJ = "TblObj"
Public Const FLDTBLATR = "TblAtr"

' Table des attributs et leur structure
Public tblsAtr() As ADODB.Recordset
Public Const FLDATRID = "AtrCol"
Public Const FLDATRNOM = "AtrNom"
Public Const FLDATRTPE = "AtrTpe"

' Table des objets (leur structure est définie par les tables des attributs)
Public tblsObj() As ADODB.Recordset

'------------------------------------------------------------------------------
'  Ouverture, fermeture des tables de la DB
'==============================================================================
Public Sub dbOuvrir()
   Dim numTpe As Integer
   
   ' Création de la création.
   Set con = New ADODB.Connection
   con.Provider = "Microsoft.Jet.OLEDB.3.51"
   con.Open App.Path & "\" & "Objet.mdb", "admin", ""
   
   ' Création du catalogue
   Set cat = New ADOX.Catalog
   cat.ActiveConnection = con
   
   ' Ouverture de la table des types
   Set tblTpe = New ADODB.Recordset
   tblTpe.Open "Types", con

   ' Initialisation de la table des tables des attributs et objets
   ReDim tblsAtr(0)
   ReDim tblsObj(0)
   
   ' Ouverture des tables des attributs et des objets
   While Not tblTpe.EOF
      numTpe = tblTpe.Fields(FLDTPEID).Value
      
      ' ouverture des tables des attributs
      If UBound(tblsAtr) < numTpe Then ReDim Preserve tblsAtr(numTpe)
      Set tblsAtr(numTpe) = New ADODB.Recordset
      tblsAtr(numTpe).Open tblTpe.Fields(FLDTBLATR).Value, con
      
      ' Ouverture des tables des objets
      If UBound(tblsObj) < numTpe Then ReDim Preserve tblsObj(numTpe)
      Set tblsObj(numTpe) = New ADODB.Recordset
      tblsObj(numTpe).Open tblTpe.Fields(FLDTBLOBJ).Value, con
      
      ' Type suivant
      tblTpe.MoveNext
      
   Wend
      
End Sub
'------------------------------------------------------------------------------
Public Sub dbFermer()
   Dim numTpe As Integer
   
   ' Fermeture des tables des attributs et des objets
   For numTpe = 1 To UBound(tblsObj)
      tblsAtr(numTpe).Close
      Set tblsAtr(numTpe) = Nothing
      tblsObj(numTpe).Close
      Set tblsObj(numTpe) = Nothing
   Next numTpe
   
   ' Fermeture de la table des types
   tblTpe.Close
   Set tblTpe = Nothing
   
   ' Fermeture du catalog
   Set cat = Nothing
   
   ' Fermeture de la connexion
   con.Close
   Set con = Nothing
   
End Sub


'------------------------------------------------------------------------------
'  Création, suppression d'une table
'==============================================================================
Public Sub dbFldAdd()

End Sub
'------------------------------------------------------------------------------
Public Sub dbFldDel()

End Sub




'------------------------------------------------------------------------------
'  Recherche d'un type dans la table
'==============================================================================
Public Sub tpeFnd(id As Long)

   With M_Db.tblTpe
      
      If .EOF Then .MoveFirst
      
      ' Recherche du type dans la table
      If Not (.Fields(M_Db.FLDTPEID).Value = id) Then
         If Not .BOF Then .MoveFirst
         .Find M_Db.FLDTPEID & "=" & CStr(id)
      End If
      
   End With
   
End Sub

'------------------------------------------------------------------------------
'  Recherche d'un attribut dans la table
'==============================================================================
Public Sub atrFnd(tpeId As Long, atrId As Long)
   With tblsAtr(tpeId)
   
      If .EOF Then .MoveFirst
      
      ' Recherche de l'attribut
      If Not (.Fields(FLDTPEID).Value = tpeId) Then
         If Not .BOF Then .MoveFirst
         .Find FLDATRID & "=" & CStr(atrId)
      End If
      
   End With
End Sub

'------------------------------------------------------------------------------
'  Ajout, suppression d'un attribut d'un type
'==============================================================================
Public Sub atrAdd(tpeId As Long, atrNom As String, atrTpe As Long)
   Dim id As Long
   
   ' Calcul du prochain ID
   id = tblsAtr(tpeId).RecordCount + 1
   
   ' Ajout de l'enregistrement dans la table des attribut
   With tblsAtr(tpeId)
      .AddNew
      .Fields(FLDATRID).Value = id
      .Fields(FLDATRNOM).Value = atrNom
      .Fields(FLDATRTPE).Value = atrTpe
      .Update
   End With

End Sub
'------------------------------------------------------------------------------
Public Sub atrDel(tpeId As Long, atrId As Long)

   ' Positionnement sur la table des attribut
   atrFnd tpeId, atrId
   
   ' Suppression de l'enregistrement
   tblsAtr(tpeId).Delete adAffectCurrent
   
End Sub

'------------------------------------------------------------------------------
'  Création, suppression d'une table d'attributs
'==============================================================================
Public Sub atrTblAdd(tpeId As Long)
   Dim tbl As New Table

   ' Positionnement sur la table des type
   tpeFnd (tpeId)
   
   ' Création du nom de la table
   tblTpe.Fields(fldtpeatr).Value = tblTpe.Fields(FLDTPENOM).Value & "_Atr"
   tbl.Name = tblTpe.Fields(FLDTBLATR).Value
   
   ' Ajout des champs
   tbl.Columns.Append FLDATRID, adInteger
   tbl.Columns.Append FLDATRNOM, adVarWChar, 50
   tbl.Columns.Append FLDATRTPE, adTinyInt
   
   ' Création de la table
   cat.Tables.Append tbl
   
   Set tbl = Nothing
End Sub
'------------------------------------------------------------------------------
Public Sub atrTblDel(tpeId As Long)

   ' Positionnement dans la table des types
   tpeFnd (tpeId)
   
   ' Suppression de la table
   cat.Tables.Delete tblTpe.Fields(FLDTPENOM).Value
   
End Sub
