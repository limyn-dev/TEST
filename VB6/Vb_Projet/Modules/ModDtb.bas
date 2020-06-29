Attribute VB_Name = "ModDtb"
Option Explicit

Const NOMDB = "\DB\GstMedia.mdb"

' Constantes des types de liens
Public Const NBRTLK = 4
Public Enum T_Tlk
   NOTDEF = 0
   LNKCPR = 1  ' Liens entre un composant et ses composants de référance
   LNKCPS = 2  ' Liens entre un composant et ses composants supports
   LNKTPR = 3  ' Liens entre le types d'un composant et celui de ses composant de référance
   LNKTPS = 4  ' Liens entre le types d'un composant et celui de ses composant supports
End Enum

' Connexion su la DB
Public con As ADODB.Connection

' Catalogue de la db
Public cat As New ADOX.Catalog

' Jeux d'enregistrement principaux
Public tblCpo As New ADODB.Recordset
Public tblTpe As New ADODB.Recordset

' Liste des jeux d'enregistrement sur les tables des liens
Public tblsLnk() As ADODB.Recordset

' Liste des jeux d'enregistrements sur les tables des attributs
Public tblsAtr() As ADODB.Recordset

' Contrôle de la connexion
Private conInit As Boolean



'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ TYPES §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Ajout d'un type
'==============================================================================
Public Function tpeAdd(nom As String, lvl As Long, ico As String, IsRef As Boolean, _
                      IsAsf As Boolean, fldsNom As Variant, fldsTpe As Variant) As Long
   Dim tpeId As Long
   
   ' Recherche l'id suivant dans la table des types
   tpeId = tblNxtId(tblTpe, "TpeId_")
   
   ' Ajout du composant dans la table
   With tblCpo
      .AddNew
      .Fields("TpeId_").Value = tpeId
      .Fields("TpeLvl_").Value = lvl
      .Fields("IsRef_").Value = IsRef
      .Fields("IsAsf_").Value = IsAsf
      .Fields("TpeNom_").Value = nom
      .Fields("TpeIco_").Value = ico
      .Update
      .Requery
   End With
   
   ' Création de la table des attributs
   TblAdd "TblAtr_" & CStr(tpeId), fldsNom, fldsTpe, 1
   
   ' Reconnexion de la DB
   dbDelCon
   dbSetCon
      
   ' Valorisation de la fonction
   tpeAdd = tpeId
   
End Function

'------------------------------------------------------------------------------
' Suppression d'un type
'==============================================================================
Public Function tpeDel(tpeId As Long) As Boolean

   ' Contrôle si le type peut être supprimé
   If tlbposrcd(tblTpe, "TpeId_", tpeId) And _
      Not tblPosRcd(tblCpo, "TpeId_", tpeId) Then
   
      ' Suppression du type
      With tblTpe
         .Delete
         .Requery
      End With
      
      ' Suppression de la table des attribut du type
      tblDel "TblAtr_" & CStr(tpeId)
      
      ' Reconnexion de la DB
      dbDelCon
      dbSetCon
      
      ' Valorisation de la fonction
      tpeDel = True
      
   Else
   
      tpeDel = False
      
   End If
   
End Function

'------------------------------------------------------------------------------
' Remplit une cbo avec les types des composants
'==============================================================================
Public Sub tpeCbo(ByRef cbo As ComboBox)
   
   ' Chargement de la cbo
   cbo.Clear
   
   ' Initialisation du rst
   tblTpe.MoveFirst
   
   ' Remplissage de la cbo
   While Not tblTpe.EOF
      
      With tblTpe.Fields
         cbo.AddItem CStr(.Item("TpeNom").Value)
         cbo.ItemData(cbo.ListCount - 1) = .Item("TpeId_").Value
      End With
      
      tblTpe.MoveNext
      
   Wend
   
End Sub

'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ COMPOSANTS §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Ajout d'un nouveau composant
'==============================================================================
Public Function CpoAdd(tpeId As Long, descr As String) As Long
   Dim idxTbl As Integer
   Dim atrId As Long
   Dim CpoId As Long
   
   ' Contrôle l'existance du type
   If tblPosRcd(tblTpe, "TpeId_", tpeId) Then
   
      ' création de l'entrée dans la table des attribut
      atrId = atrAdd(tpeId)
   
      ' Contrôle de la création de l'attribut
      If atrId > 0 Then
      
         ' Recherche de l'id suivant dans la rable des composants
         CpoId = tblNxtId(tblCpo, "CpoId_")
         
         ' Ajout du composant dans la table
         With tblCpo
            .AddNew
            .Fields("CpoId_").Value = CpoId
            .Fields("CpoTpeId_").Value = tpeId
            .Fields("CpoAtrId_").Value = atrId
            .Fields("CpoDsc").Value = descr
            .Update
            .Requery
         End With
         
      End If
      
   End If
         
   ' Retour de l'id du nouvel enregistrement (0 en cas d'echèque)
   CpoAdd = CpoId
   
End Function

'------------------------------------------------------------------------------
' Suppression d'un composant
'==============================================================================
Public Function cpoDel(CpoId As Long) As Boolean
   Dim atrId As Long
   Dim tpeId As Long
   
   ' Contrôle si le composant peut être supprimé
   If tblPosRcd(tblCpo, "CpoId_", CpoId) Then
   
      If Not tblPosRcd(tblsLnk(LNKCPR), "IdLink_", CpoId) Then
      
         If Not tblPosRcd(tblsLnk(LNKCPS), "IdLink_", CpoId) Then
      
      ' suppression du composant
      With tblCpo
         tpeId = .Fields("CpoTpeId_").Value
         atrId = .Fields("CpoAtrId_").Value
         .Delete
         .Requery
      End With
      
      ' Suppression des attributs su composant
      AtrDel tpeId, atrId
      
      ' Valorisation de la fonction
      cpoDel = True
      
   Else

      cpoDel = False
      
   End If
   End If
   End If
   
End Function

'------------------------------------------------------------------------------
' Ajout d'un nouveau composant
'==============================================================================
Public Function cpoSet(CpoId As Long, tpeId As Long, atrId As Long, descr As String) As Boolean

   ' Positionnement dans la table des composant
   If tblPosRcd(tblCpo, "CpoId_", CpoId) Then
   
      ' Mise à jour du composant
      With tblCpo
         .Fields("CpoTpeId_").Value = tpeId
         .Fields("CpoAtrId_").Value = atrId
         .Fields("CpoDsc").Value = descr
      End With
      cpoSet = True
      
   Else
   
      cpoSet = False
      
   End If
         
End Function


'§§§§§§§§§§§§§§§§§§§§§§§§§ ATTRIBUTS DES COMPOSANTS §§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Ajout d'une entrée dans la table des attributs
'==============================================================================
Function atrAdd(tpeId As Long)
   Dim numTbl As Integer
   Dim newId As Long
   
   ' Contrôle l'existance du type
   If tblPosRcd(tblTpe, "TpeId_", tpeId) Then
   
      ' Calcul de l'index de la table
      numTbl = CInt(tpeId)
   
      ' Recherche de l'id
      newId = tblNxtId(tblsAtr(numTbl), "AtrId_")
   
      ' Ajout d'un enregistrement dans la table
      With tblsAtr(numTbl)
         .AddNew
         .Fields("AtrId_").Value = newId
         .Update
         .Requery
      End With
      
   End If
      
   ' Valorisation de la fonction (si pas de nouveau attribut, la fonction vaut 0)
   atrAdd = newId
      
End Function

'------------------------------------------------------------------------------
' Suppression d'une entrée dans la table des attributs
'==============================================================================
Public Sub AtrDel(tpeId As Long, atrId As Long)
   Dim numTbl As Integer
   
   ' Calcul de l'index de la table
   numTbl = CInt(tpeId)
   
   ' Positionnement dans la table des attributs
   tblPosRcd tblsAtr(numTbl), "AtrId_", atrId
         
   ' Suppression de l'enregistrement
   With tblsAtr(numTbl)
      If .Fields("AtrId_").Value = atrId Then
         .Delete
         .Update
         .Requery
      End If
   End With
   
End Sub

'------------------------------------------------------------------------------
' Mise à jour de la valeur d'un champs d'une table d'attribut
'==============================================================================
Public Sub atrSet(tpeId As Long, atrId As Long, fld As String, val As String)
   Dim numTbl As Integer
   
   ' Calcul de l'index de la table
   numTbl = CInt(tpeId)
   
   ' Positionement dans la table des attribut du type
   tblPosRcd tblsAtr(numTbl), "AtrId_", atrId
   
   ' Mise à jour du champs en fonction de son type
   With tblsAtr(numTbl)
      
      ' Gestion des erreures d'insértion deans la table
      On Error GoTo GstErr
      
      ' Convertion de la valeur en fonction du type de la DB
      Select Case .Fields(fld).Type
   
         ' Chaine de caratères
         Case adVarWChar
            .Update fld, val
            
         ' Entier
         Case adInteger
            .Update fld, CInt(val)
            
         ' Réel
         Case adDouble
            .Update fld, CLng(val)
            
         ' Date
         Case adDate
            .Update fld, CDate(val)
            
         ' Boolean
         Case adBoolean
            .Update fld, CBool(val)
            
         ' Type autres (convertion implicite
         Case Else
            .Update fld, val
            MsgBox "Convertion implicite pour le champ " & fld, vbExclamation
      
      End Select
   
      ' Mise à jour du recorset
      .Requery
      
   End With
   
Exit Sub
   
GstErr:
   MsgBox "Le champ " & fld & " n'accepte pas la valeur " & val, vbCritical
   
End Sub

'------------------------------------------------------------------------------
' Ajout d'une colonne dans une table d'attribut
'==============================================================================
Public Sub atrFldAdd(tpeId As Long, nomFld As String, tpeFld As ADOX.DataTypeEnum)

  ' Déconnexion du recordset
   ModDtb.tblsAtr(tpeId).Close
   
   ' Création de la colonne dans la table
   tblFldAdd cat.Tables(atrNomTbl(tpeId)), nomFld, tpeFld
   
   ' Reconnexion du recordset
   tblsAtr(tpeId).Open atrNomTbl(tpeId), con, adOpenKeyset, adLockOptimistic, -1

End Sub

'------------------------------------------------------------------------------
' Ajout d'une colonne dans une table d'attribut
'==============================================================================
Public Sub atrFldDel(tpeId As Long, nomFld As String)

  ' Déconnexion du recordset
   ModDtb.tblsAtr(tpeId).Close
   
   ' Suppression de la colonne dans la table
   tblFldDel cat.Tables(atrNomTbl(tpeId)), nomFld
   
   ' Reconnexion du recordset
   tblsAtr(tpeId).Open atrNomTbl(tpeId), con, adOpenKeyset, adLockOptimistic, -1

End Sub

'------------------------------------------------------------------------------
' Ajout d'une colonne dans une table d'attribut
'==============================================================================
Public Sub atrFldSet(tpeId As Long, nomOld As String, nomNew As String)

  ' Déconnexion du recordset
   ModDtb.tblsAtr(tpeId).Close
   
   ' Suppression de la colonne dans la table
   cat.Tables(atrNomTbl(tpeId)).Columns(nomOld).Name = nomNew
   
   ' Reconnexion du recordset
   tblsAtr(tpeId).Open atrNomTbl(tpeId), con, adOpenKeyset, adLockOptimistic, -1

End Sub


'------------------------------------------------------------------------------
' Renvoie le nom d'une table d'attribut en fonction de l'id du type
'==============================================================================
Function atrNomTbl(tpeId As Long) As String

   atrNomTbl = "TblAtr_" & CStr(tpeId)
   
End Function



'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ GETION DES LIENS §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Id du liens en fonction de son type, l'id de base et de l'id liés
'==============================================================================
Public Function lnkFndId(tlk As T_Tlk, idBase As Long, idLink As Long) As Long
   Dim qryLnk As ADODB.Recordset
   
   ' Execution de la commande
   With cat.Procedures.Item(lnkNomPrc(tlk)).Command
   
      ' Valorisation du parametre
      .Parameters.Item("[IdBase]").Value = idBase
      .Parameters.Item("[IdLink]").Value = idLink
   
      ' Execution de la commande
      Set qryLnk = .Execute
      
   End With
   
   ' Valorisation de la fonction
   On Error GoTo QryErr:
   lnkFndId = qryLnk.Fields("LnkId").Value
   
Desalloc:
   ' Désallocation du recordset
   qryLnk.Close
   Set qryLnk = Nothing
   Exit Function
   
QryErr:
   lnkFndId = 0
   GoTo Desalloc
   
End Function

'------------------------------------------------------------------------------
' Ajout d'un lien en fonction de son type, de l'id de base et de l'id liés
'==============================================================================
Public Sub lnkAdd(tlk As T_Tlk, idBase As Long, idLink As Long)
   Dim lnkId As Long
   
   ' recherche de l'id suivant
   lnkId = tblNxtId(tblsLnk(tlk), "LnkId_")
   
   ' Ajout de l'enregistrement dans la table
   tblsLnk(tlk).AddNew
   tblsLnk(tlk).Fields("LnkId_").Value = lnkId
   tblsLnk(tlk).Fields("IdBase_").Value = idBase
   tblsLnk(tlk).Fields("IdLink_").Value = idLink
   tblsLnk(tlk).Update
     
End Sub

'------------------------------------------------------------------------------
' Suppression d'un lien en fonction de son type, de l'Id de base et de l'Id lié
'==============================================================================
Public Sub lnkDel(tlk As T_Tlk, idBase As Long, idLink As Long)
   Dim lnkId As Long
   
   ' Recherche du lien dans la table
   lnkId = lnkFndId(tlk, idBase, idLink)
   
   ' Suppression de l'enregistrement dans la table des liens
   If lnkId > 0 Then
   
      'Positionnement sur le lien
      If tblPosRcd(tblsLnk(tlk), "LnkId_", lnkId) Then
      
         ' suppression du composant
         With tblsLnk(tlk)
            .Delete
            .Requery
         End With
         
      End If
      
   End If
   
End Sub

'------------------------------------------------------------------------------
' Nom de la procedure en fonction du type de lien
'==============================================================================
Private Function lnkNomPrc(tlk As T_Tlk) As String

   ' Valorisation du nom de la table de liens
   Select Case tlk
      Case LNKCPR
         lnkNomPrc = "QryLnkCpr"
      Case LNKCPS
         lnkNomPrc = "QryLnkCps"
      Case LNKTPR
         lnkNomPrc = "QryLnkTpr"
      Case LNKTPS
         lnkNomPrc = "QryLnkTps"
   End Select
   
End Function

'------------------------------------------------------------------------------
' Nom de la table en fonction dutype de lien
'==============================================================================
Private Function lnkNomTbl(tlk As T_Tlk) As String

   ' Valorisation du nom de la table de liens
   Select Case tlk
      Case LNKCPR
         lnkNomTbl = "TblCpr"
      Case LNKCPS
         lnkNomTbl = "TblCps"
      Case LNKTPR
         lnkNomTbl = "TblTpr"
      Case LNKTPS
         lnkNomTbl = "TblTps"
   End Select
   
End Function



'§§§§§§§§§§§§§§§§§§§§§§§§§§§§ GESTION DES TABLES §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Ajout d'une table dans la DB
'==============================================================================
Public Function TblAdd(nom As String, fldCle As String) As Boolean
   Dim tbl As New ADOX.Table
   Dim cle As New ADOX.Key
   Dim numFld As Integer
      
   ' Création de la table
   With tbl
   
      ' Nom de la nouvelle table
      .Name = nom
      
      ' Création du champ de la cle primaire
      .Columns.Append fldCle, 5
      
   End With
   
   ' Ajout de la table dans la DB
   cat.Tables.Append tbl
   
   ' Création de la clef primaire
   With cle
      .Type = adKeyPrimary
      .Columns.Append fldCle
   End With
   
   ' Ajout de la cle à la table
   cat.Tables(nom).Keys.Append cle
   
End Function

'------------------------------------------------------------------------------
' Suppression d'une table dans la DB
'==============================================================================
Public Function tblDel(nom As String) As Boolean

   ' Suppression de la table
   cat.Tables.Delete nom
   
End Function

'------------------------------------------------------------------------------
' Positionne le curseur d'une table en fonction de la valeur d'un champ
'==============================================================================
Public Function tblPosRcd(ByRef tbl As ADODB.Recordset, fld As String, val As Variant) As Boolean
   
   With tbl
   
      ' Recherche de l'enregistrement
      .MoveFirst
      .Find fld & "=" & CStr(val)
   
      ' Contrôle de l'existance de l'entrée dans la table
      If Not .EOF Then
         tblPosRcd = True
      Else
         tblPosRcd = False
      End If
    
   End With
   
End Function

'------------------------------------------------------------------------------
' Recherche l'id suivant dans ine table
'==============================================================================
Public Function tblNxtId(ByRef rst As ADODB.Recordset, fldId As String) As Long
   
   On Error GoTo TBLVIDE
   rst.MoveLast
   tblNxtId = rst.Fields(fldId).Value + 1
   
   Exit Function
   
TBLVIDE:
   tblNxtId = 1
   
End Function

'------------------------------------------------------------------------------
' Recherche le nombre d'entrée d'une table
'==============================================================================
Public Function tblNbrRcd(ByRef rst As ADODB.Recordset, fldId As String) As Long
   
   tblNbrRcd = rst.Fields.Count
   
End Function

'------------------------------------------------------------------------------
' Ajout un champ dans une table
'==============================================================================
Public Sub tblFldAdd(tbl As ADOX.Table, nomFld As String, tpeFld As ADOX.DataTypeEnum)

   ' Ajout de la colonne dans la table
   tbl.Columns.Append nomFld, tpeFld
   
End Sub

'------------------------------------------------------------------------------
' Supprime un champ dans une table
'==============================================================================
Public Sub tblFldDel(tbl As ADOX.Table, nomFld As String)

   ' Suppression de la colonne dans la table
   tbl.Columns.Delete nomFld
   
End Sub



'§§§§§§§§§§§§§§§§§§§§§§§§§§ OUTILS DES PROCEDURES §§§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Execute une commande qui a un param Id en fonction de son nom et del'Id
'==============================================================================
Function PrcRun(nomPrc As String, id As Long) As ADODB.Recordset
   
   ' Execution de la commande
   With cat.Procedures.Item(nomPrc).Command
   
      ' Valorisation du parametre
      .Parameters.Item("[Id]").Value = id
   
      ' Execution de la commande
      Set PrcRun = .Execute
      
   End With
   
End Function



'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ Outils de la DB §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Ouverture des acces sur la DB
'==============================================================================
Sub dbSetCon()
   Dim tpeId As Long
   Dim nomTbl As String
   Dim tlk As T_Tlk
   
   ' Contrôle de l'etat de la connexion
   If Not conInit Then
   
      ' Initialisation des tables de recordset
      ReDim tblsLnk(0)
      ReDim tblsAtr(0)
   
      ' Création de la Connexion sur la DB
      Set con = New ADODB.Connection
      con.Provider = "Microsoft.Jet.OLEDB.4.0"
      con.Open App.Path & NOMDB, "Admin", ""
   
      ' Création du catalogue
      cat.ActiveConnection = con
      
      ' Création des recordSet sur les tables de base
      tblCpo.Open "TblCpo", con, adOpenKeyset, adLockOptimistic, -1
      tblTpe.Open "TblTpe", con, adOpenKeyset, adLockOptimistic, -1
      
      ' Création des recordSet sur les tables des liens (parcourt des types de liens)
      For tlk = LNKCPR To LNKTPS
      
         ' Redimentionnement de la table
         ReDim Preserve tblsLnk(tlk)
         
         ' Ouvérture du recordset sur la table du lien en fontion de son type
         Set tblsLnk(tlk) = New ADODB.Recordset
         tblsLnk(tlk).Open lnkNomTbl(tlk), con, adOpenKeyset, adLockOptimistic, -1
         
      Next tlk
      
      ' Création des recordSet sur les tables des attributs (Parcourt des types)
      While Not tblTpe.EOF
              
         ' Recherche de l'id du type
         tpeId = tblTpe.Fields("TpeId_").Value
         
         ' Redimentionnement de la table des recordSet si néssaisaire
         If UBound(tblsAtr()) < tpeId Then ReDim Preserve tblsAtr(tpeId)
          
         ' Ouverture du rst du la table des attributs du type
         Set tblsAtr(tpeId) = New ADODB.Recordset
         tblsAtr(tpeId).Open atrNomTbl(tpeId), con, adOpenKeyset, adLockOptimistic, -1
         
         ' Type suivant
         tblTpe.MoveNext
      Wend
   
      ' Flag de l'initialisation de la connexion
      conInit = True
      
   End If
   
End Sub

'------------------------------------------------------------------------------
' Férmeture de tous les access sur la DB
'==============================================================================
Sub dbDelCon()
   Dim numRst As Integer
   Dim tlk As T_Tlk
   
   ' Check de l'état de la connexion
   If conInit Then
   
      ' Fermeture des recordset sur les tables des attributs
      For numRst = 1 To UBound(tblsAtr())
         tblsAtr(numRst).Close
         Set tblsAtr(numRst) = Nothing
      Next numRst
   
      ' Fermenture des recordset sur les tabes des liens
      For tlk = LNKCPR To LNKTPS
         tblsLnk(tlk).Close
         Set tblsLnk(tlk) = Nothing
      Next tlk
      
      ' Fermenture des recordset de base
      tblCpo.Close:  Set tblCpo = Nothing
      tblTpe.Close:  Set tblTpe = Nothing
      
      ' Fermeture du catalogue
      Set cat.ActiveConnection = Nothing
      Set cat = Nothing
   
      ' Fermeture de la connexion
      con.Close:  Set con = Nothing
   
      ' Compactage de la db
      dbCompact
      
      ' Flag de la déconnexion
      conInit = False
   
   End If
   
End Sub

'------------------------------------------------------------------------------
' Compactage de la db
'==============================================================================
Public Sub dbCompact()
   Dim JRO As New JRO.JetEngine
   Dim oldDtb As String
   Dim newDtb As String
   Dim StrDtb As String
  
   newDtb = App.Path & NOMDB
   oldDtb = Left(newDtb, Len(newDtb) - 4) & "old.mdb"
   
   ' Renomage de la db si echeque pas de compactage de la db
   On Error GoTo Fin
   FileCopy newDtb, oldDtb
   Kill newDtb
   
   ' Compactage
   StrDtb = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="
   JRO.CompactDatabase StrDtb & oldDtb, StrDtb & newDtb & " ;Jet OLEDB:Engine Type=5"
    
   ' Suppression de l'ancienne dtb
   Kill oldDtb
   
Fin:
End Sub



