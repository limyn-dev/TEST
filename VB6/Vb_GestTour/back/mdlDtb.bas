Attribute VB_Name = "mdlDtb"
Option Explicit

Private Const NOMDB = "GestTour.mdb"

Public con As ADODB.Connection  ' Connexion sur la DB
Public tblAcp As CTblAcp        ' Table des accompagnants
Public tblClt As CTblClt        ' Table des clients
Public tblCtc As CTasCtc        ' Table des contactes
Public tblCrt As CTblCrt        ' Table des circuits
Public tblEtp As CEtape         ' Table des étapes
Public tblOrg As CTblOrg        ' Table des organismes
Public tasPti As CTasPti        ' Table des participants
Public tblTpo As CTblTpo        ' Table des types d'organisme
Public tblVle As CTblVle        ' Table des villes

' Connexion sur la db et Chargement des tables
'------------------------------------------------------------------------------
Public Sub openDB()

    ' Connexion sur la DB
    Set con = New ADODB.Connection
    con.Provider = "Microsoft.Jet.OLEDB.4.0"
    con.Open App.Path & "..\data\" & NOMDB, "Admin", ""
    
End Sub

' Déconnexion de la DB
'------------------------------------------------------------------------------
Public Sub closeDB()

    ' Déconnexion de la db
    con.Close
    Set con = Nothing
    
End Sub

' point d'entrée de l'application
'------------------------------------------------------------------------------
Public Sub Main()
    
    ' Ouverture de la db
    openDB
    
    ' Fermeture de la db
    closeDB
    
End Sub

