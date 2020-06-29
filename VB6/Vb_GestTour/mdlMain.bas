Attribute VB_Name = "mdlMain"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"39A39A3702EE"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Module"
Option Explicit

' Nom de la DB
'##ModelId=39A39A3703CA
Private Const NOMDB = "GestTour.mdb"
Attribute NOMDB.VB_VarDescription = " Nom de la DB"

' Nom des tables de la DB
'##ModelId=39A39A38001E
Private Const NOM_TBL_CTC = "tblContacts"
Attribute NOM_TBL_CTC.VB_VarDescription = " Nom des tables de la DB"
'##ModelId=39A39A380050
Private Const NOM_TBL_PTI = "tblParticipants"
'##ModelId=39A39A38008C
Private Const NOM_TBL_ACP = "tblAccompagnateurs"
'##ModelId=39A39A3800BF
Private Const NOM_TBL_CRT = "tblCircuits"
'##ModelId=39A39A38012C
Private Const NOM_TBL_CLT = "tblClients"
'##ModelId=39A39A380168
Private Const NOM_TBL_ETP = "tblEtapes"
'##ModelId=39A39A38019A
Private Const NOM_TBL_ORG = "tblOrganismes"
'##ModelId=39A39A3801D6
Private Const NOM_TBL_TPO = "tblTypeOrganisme"
'##ModelId=39A39A380208
Private Const NOM_TBL_VLE = "tblVilles"

' Connexion
'##ModelId=39A39A3802E4
Public con As ADODB.Connection
Attribute con.VB_VarDescription = " Connexion"

' Tables
'##ModelId=39A39A380353
Public tblAcp As CTblAcp        ' Table des accompagnants
Attribute tblAcp.VB_VarDescription = " Tables"
'##ModelId=39A39A3803C1
Public tblClt As CTblClt        ' Table des clients
'##ModelId=39A39A390047
Public tblCtc As CTblCtc        ' Table des contactes
'##ModelId=39A39A3900F1
Public tblCrt As CTblCrt        ' Table des circuits
'##ModelId=39A39A39015F
Public tblEtp As CTblEtp        ' Table des étapes
'##ModelId=39A39A3901CD
Public tblOrg As CTblOrg        ' Table des organismes
'##ModelId=39A39A39023B
Public tblPti As CTblPti        ' Table des participants
'##ModelId=39A39A3902DB
Public tbltpo As CTblTpo        ' Table des types d'organisme
'##ModelId=39A39A390349
Public tblVle As CTblVle        ' Table des villes

' Connexion sur la db et Chargement des tables
'------------------------------------------------------------------------------
'##ModelId=39A39A3903B6
Public Function openDB() As Boolean
Attribute openDB.VB_Description = " Connexion sur la db et Chargement des tables\r\n------------------------------------------------------------------------------"
  
    openDB = True
    
    ' Instanciation des membres
    Set con = New ADODB.Connection
    Set tblVle = New CTblVle
    Set tblClt = New CTblClt
    Set tblAcp = New CTblAcp
    Set tbltpo = New CTblTpo
    Set tblOrg = New CTblOrg
    Set tblEtp = New CTblEtp
    Set tblCrt = New CTblCrt
    Set tblPti = New CTblPti
    Set tblCtc = New CTblCtc
    
    ' Connexion sur la DB
    con.Provider = "Microsoft.Jet.OLEDB.4.0"
    con.Open App.Path & "\DB\" & NOMDB, "Admin", ""
    
    ' Ouverture des tables des entités simples
    If Not tblClt.Initialize(con, NOM_TBL_CLT) Then openDB = False
    If Not tblAcp.Initialize(con, NOM_TBL_ACP) Then openDB = False
    If Not tbltpo.Initialize(con, NOM_TBL_TPO) Then openDB = False
    
    ' Ouverture des tables des entités composée et des tables associatives
    If Not tblOrg.Initialize(con, NOM_TBL_ORG, tbltpo) Then openDB = False
    If Not tblVle.Initialize(con, NOM_TBL_VLE, tblOrg) Then openDB = False
    If Not tblCtc.Initialize(con, NOM_TBL_CTC, tblEtp, tblOrg) Then openDB = False
    If Not tblPti.Initialize(con, NOM_TBL_PTI, tblCrt, tblClt) Then openDB = False
    If Not tblEtp.Initialize(con, NOM_TBL_ETP, tblCtc, tblVle) Then openDB = False
    If Not tblCrt.Initialize(con, NOM_TBL_CRT, tblAcp, tblEtp, tblPti) Then openDB = False
    
    
End Function

' Déconnexion de la DB
'------------------------------------------------------------------------------
'##ModelId=39A39A3A000A
Public Sub closeDB()
Attribute closeDB.VB_Description = " Déconnexion de la DB\r\n------------------------------------------------------------------------------"

    ' Fermeture des tables des entités composée
    Set tblEtp = Nothing
    Set tblCrt = Nothing
    Set tblCtc = Nothing
    Set tblPti = Nothing
    Set tblOrg = Nothing
    
    ' Fermeture des tables des entités simples
    Set tblVle = Nothing
    Set tblClt = Nothing
    Set tblAcp = Nothing
    Set tbltpo = Nothing
    
    ' Déconnexion de la db
    con.Close
    Set con = Nothing
    
End Sub

' point d'entrée de l'application
'------------------------------------------------------------------------------
'##ModelId=39A39A3A000B
Public Sub Main()
Attribute Main.VB_Description = " point d'entrée de l'application\r\n------------------------------------------------------------------------------"
    
    ' Ouverture de la db
    openDB
    
    ' Affichage du formulaire des circuits
    frmMain.Show vbModal
    'tstCrt
    
    ' Fermeture de la db
    closeDB
    
End Sub

'##ModelId=39A6E49B01D6
Private Sub tstCrt()
    Dim crt As New CCircuit
    Dim etp As CEtape
    Dim pti As CParticipant
    Dim vle As CVille
    
    With crt
        .Id = 0
        .Intitule = "Nouveau tour"
        .NombrePlace = 20
        .Prix = 1000
        Set .accompagnateur = tblAcp.ReadByAcpId(2)
    End With
    
    Set etp = New CEtape
    With etp
        .Id = 0
        .Numero = 1
        .ArriveeHeure = CDate("12:00")
        .DepartHeure = CDate("20:00")
        Set .ville = tblVle.ReadByVleId(10)
        .Contacts.Add .ville.Organismes(1)
        .Contacts.Add .ville.Organismes(2)
    End With
    crt.Etapes.Add etp
    
    Set etp = New CEtape
    
    With etp
        .Id = 0
        .Numero = 2
        .ArriveeHeure = CDate("22:00")
        .DepartHeure = CDate("13:00")
        Set .ville = tblVle.ReadByVleId(1)
        .Contacts.Add .ville.Organismes(1)
        .Contacts.Add .ville.Organismes(2)
        .Contacts.Add .ville.Organismes(3)
    End With
    crt.Etapes.Add etp
    
    Set pti = New CParticipant
    With pti
        .Id = 0
        Set .Client = tblClt.ReadByCltId(2)
        .Accompte = 120
        .Versement = 450
        .Remise = 0
    End With
    crt.Participants.Add pti
    
    Set pti = New CParticipant
    With pti
        .Id = 0
        Set .Client = tblClt.ReadByCltId(3)
        .Accompte = 1000
        .Versement = 500
        .Remise = 0
    End With
    crt.Participants.Add pti
    
    tblCrt.WriteRecord crt
    
    Set crt = Nothing
End Sub
