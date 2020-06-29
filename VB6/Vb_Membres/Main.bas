Attribute VB_Name = "Applic"
Option Explicit

' Paramètre de l'application
'------------------------------------------------------------------------------
Private ficXlsPath As String    ' Chemin du fichier
Private shtFamName As String    ' Nom de la feuille des familles
Private shtPrsName As String    ' Nom de la feuille des personnes
Private shtCatName As String    ' Nom de la feuille des catégories

' Table des données
'------------------------------------------------------------------------------
Public TblFam As CTblFam
Public TblPrs As CTblPrs
Public TblCat As CTblCat

' Entrée du programme
'------------------------------------------------------------------------------
Public Sub main()
    Dim wkb As Excel.Workbook
    
    ' Initialisation des paramètre de l'application
    setParam
    
    ' Ouverture du classeur
    Set wkb = Workbooks.Open(ficXlsPath)
    
    ' Ouverture des tables
    Set TblFam = New CTblFam
    TblFam.Create wkb.Worksheets(shtFamName)
    Set TblCat = New CTblCat
    TblCat.Create wkb.Worksheets(shtCatName)
    Set TblPrs = New CTblPrs
    TblPrs.Create wkb.Worksheets(shtPrsName), TblCat, TblFam
    
    ' Affichage du formulaire
    With frmPersonne
        Set .TblFam = TblFam
        Set .TblPrs = TblPrs
        Set .TblCat = TblCat
        .Show vbModal
    End With
    
    ' Fermeture des tables
    Set TblFam = Nothing
    Set TblPrs = Nothing
    
    ' Fermeture du classeur
    wkb.Close True
    
End Sub

' Initialisation des paramètres de l'application
'------------------------------------------------------------------------------
Private Sub setParam()
    ficXlsPath = "D:\Teck\Projets\Software\_DataBase\Membres\Membre.xls"
    shtFamName = "shtFam"
    shtPrsName = "shtPrs"
    shtCatName = "shtCat"
End Sub
