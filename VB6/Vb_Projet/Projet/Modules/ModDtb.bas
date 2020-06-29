Attribute VB_Name = "ModDtb"
Option Explicit

Const NOMDB = "\DB\GstMedia.mdb"

' Constantes des types de liens
Public Const NBRTLK = 4
Public Enum T_Tlk
   NOTDEF = 0
   LNKCPR = 1  ' liste des Liens entre un composant et ses composants de référance
   LNKCPS = 2  ' liste des Liens entre un composant et ses composants supports
   LNKTPR = 3  ' liste des liens entre le types d'un composant et celui de ses composant de référance
   LNKTPS = 4  ' liste des liens entre le types d'un composant et celui de ses composant supports
End Enum

' Connexion su la DB
Public con As ADODB.Connection

' Catalogue de la db
Public cat As New ADOx.Catalog

' Jeux d'enregistrement principaux
Public tblCpo As New ADODB.Recordset
Public tblTpe As New ADODB.Recordset

' Liste des jeux d'enregistrement sur les tables des liens
Public tblsLnk() As ADODB.Recordset

' Liste des jeux d'enregistrements sur les tables des attributs
Public tblsAtr() As ADODB.Recordset

' Contrôle de la connexion
Private conInit As Boolean




'§§§§§§§§§§§§§§§§§§§§§§§§§§§ Gestion des composants §§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Remplit une cbo avec les types des composants
'==============================================================================
Public Sub cpoTpeCbo(ByRef cbo As ComboBox)
   
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

'------------------------------------------------------------------------------
' Ajout d'un nouveau composant dans la table des composants
'==============================================================================
Public Sub cpoAdd(tpeId As Long, dscId As Long, nom As String)
   Dim CpoId As Long
   
   ' Contrôle l'existance du type
   tblPosRcd tblTpe, "TpeId_", tpeId
   If tblTpe.Fields("TpeId_").Value = tpeId Then
   
      ' Controle l'existance de la description du composant
      tblPosRcd tblsAtr(tpeId), "DscId_", dscId
      If tblTpe.Fields("DscId").Value = dscId Then
   
         ' Création du nouveau composant
         CpoId = tblAddRcd(tblCpo, "CpoId_")
         
         ' Positionement du rst
         tblPosRcd tblCpo, "CpoId_", CpoId
         
         ' Ajout des valeur de l'enregistrement
         tblCpo.Fields("CpoTpeId_").Value = tpeId
         tblCpo.Fields("CpoDscId_").Value = dscId
         tblCpo.Fields("CpoNom").Value = nom
         
      Else
      
         ' Avertissement de la non création du composant
         MsgBox "ModDtb.cpoAdd: Déscription du composant invalide", vbCritical
         
      End If
      
   Else
   
      ' Avertissement de la non création du composant
      MsgBox "ModDtb.cpoAdd: Type du composant invalide", vbCritical
      
   End If
   
End Sub

'------------------------------------------------------------------------------
' Suppression d'composant
'==============================================================================
Public Sub cpoDel(CpoId As Long)
   
   ' Contrôle l'existance du type
   tblPosRcd tblCpo, "CpoId_", CpoId
   If tblCpo.Fields("CpoId_").Value = CpoId Then
   
      ' suppression de l'enregistrement
      tblDelRcd tblCpo, "CpoId_", CpoId
      
   Else
   
      ' Avertissement de la non suppression du composant
      MsgBox "ModDtb.cpoDel: Composant inexistant", vbCritical
      
   End If
   
End Sub



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
   
   ' Recherce du lien dans la table
   lnkId = lnkFndId(tlk, idBase, idLink)
   
   ' Suppression de l'enregistrement dans la table des liens
   If lnkId > 0 Then tblDelRcd tblsLnk(tlk), "LnkId_", lnkId
   
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



'§§§§§§§§§§§§§§§§§§§ Gestion des Attributs des composants §§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Ajout de la déscription d'un composant
'==============================================================================
Public Sub AtrAdd(tpeId As Long, noms As Variant, vals As Variant)
   Dim dscId As Long
   
   ' Création d'une nouvelle entrée dans la table des description
   dscId = tblAddRcd(tblsAtr(tpeId), "DscId_")
   
   ' Ajout de l'enregistrement
   
   ' Positionnement du rst de la table du type
   tblPosRcd tblsAtr(tpeId), "DscId_", dscId
   
   ' Suppression de l'enregistrement
   If tblsAtr(tpeId).Fields("DscId_").Value = dscId Then
      tblsAtr.Delete
      
   ' Mise à jour du rst
   tblsAtr.Requery
   
End Sub

'------------------------------------------------------------------------------
' Suppression de la descriprion d'un composant
'==============================================================================
Public Sub AtrDel(tpeId As Long, dscId As Long)
   
   ' Positionnement du rst de la table du type
   tblPosRcd tblsAtr(tpeId), "DscId_", dscId
   
   ' Suppression de l'enregistrement
   If tblsAtr(tpeId).Fields("DscId_").Value = dscId Then
      tblsAtr.Delete
      
   ' Mise à jour du rst
   tblsAtr.Requery
   
End Sub

'------------------------------------------------------------------------------
' Mise à jour de la valeur d'un champs d'une table d'attribut
'==============================================================================
Public Sub atrUpd(ByRef tbl As ADODB.Recordset, fld As String, val As String)
   
   ' Mise à jour du champs en fonction de son type
   On Error GoTo GstErr
   Select Case tbl.Fields(fld).Type
      Case adInteger
         tbl.Update fld, CLng(val)
      Case adVarChar
         tbl.Update fld, val
      Case Else
         tbl.Update fld, val
         MsgBox "Convertion implicite pour le champ " & fld, vbExclamation
   End Select
   
Exit Sub
   
GstErr:
   MsgBox "Le champ " & fld & " n'accepte pas la valeur " & val, vbCritical
   
End Sub



'§§§§§§§§§§§§§§§§§§§§§§§§§§§§ GESTION DES TABLES §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Suppression d'un enregistrement de la table
'==============================================================================
Public Function tblDelRcd(ByRef tbl As ADODB.Recordset, fldId As String, id As Long)
   
   ' Positionnenment dans la table
   tblPosRcd tbl, fldId, id
   
   ' Suppression de l'enregistrement
   tbl.Delete
   
   ' Mise à jour du recordset de la table
   tbl.Requery
   
End Function

'------------------------------------------------------------------------------
' Ajoute un nouvel enregistrement dans une table
'==============================================================================
Public Function tblAddRcd(ByRef tbl As ADODB.Recordset, fldId As String) As Long
   Dim id As Long
    
   ' recherche de l'id suivant
   id = tblNxtId(tbl, fldId)
   
   ' Ajout de l'enregistrement dans la table
   tbl.AddNew fldId, id
   
   ' Mise à jour du rst de la table
   tbl.Requery
      
   ' Retour de l'id du nouvel enregistrement
   tblAddRcd = id
   
End Function

'------------------------------------------------------------------------------
' Positionne le curseur d'une table en fonction de la valeur d'un champ
'==============================================================================
Public Sub tblPosRcd(ByRef tbl As ADODB.Recordset, nomFld As String, valFld As Variant)
   
   ' Reset
   tbl.MoveFirst
     
   ' Indexation du rst
   tbl.Find nomFld & "=" & CStr(valFld)
    
End Sub

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
         
         ' Recherche du nom de la table
         nomTbl = "TblAtr_" & CStr(tpeId)
         
         ' Ouverture du rst du la table des attributs du type
         Set tblsAtr(tpeId) = New ADODB.Recordset
         tblsAtr(tpeId).Open nomTbl, con, adOpenKeyset, adLockOptimistic, -1
         
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



