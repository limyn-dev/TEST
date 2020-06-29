Attribute VB_Name = "Applic"
Option Explicit

' Param�tre de l'application
'------------------------------------------------------------------------------
Private ficXlsPath As String    ' Chemin du fichier
Private shtFamName As String    ' Nom de la feuille des familles
Private shtPrsName As String    ' Nom de la feuille des personnes
Private shtCatName As String    ' Nom de la feuille des cat�gories

' Table des donn�es
'------------------------------------------------------------------------------
Public TblFam As CTblFam
Public TblPrs As CTblPrs
Public TblCat As CTblCat

' Entr�e du programme
'------------------------------------------------------------------------------
Public Sub main()
    Dim wkb As Excel.Workbook
    
    ' Initialisation des param�tre de l'application
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

' Initialisation des param�tres de l'application
'------------------------------------------------------------------------------
Private Sub setParam()
    ficXlsPath = "D:\Teck\Projets\Software\_DataBase\Membres\Membre.xls"
    shtFamName = "shtFam"
    shtPrsName = "shtPrs"
    shtCatName = "shtCat"
End Sub
