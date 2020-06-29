Attribute VB_Name = "mdlMain"
Option Explicit

' Constantes
'------------------------------------------------------------------------------
Private Const DB_NAME = "Membres.mdb"       ' Nom de la db
Private Const TBL_FAM_NAME = "Familles"     ' Nom des tables des familles
Private Const TBL_LOC_NAME = "Localites"    ' Nom des tables des Localites
Private Const TBL_MBR_NAME = "Membres"      ' Nom des tables des Membres
Private Const TBL_MTR_NAME = "Ministeres"   ' Nom des tables des Ministeres
Private Const TBL_RLE_NAME = "Roles"        ' Nom des tables des Roles
    
' Membres
'------------------------------------------------------------------------------
Private myCon As New ADODB.Connection   ' Connexion sur la DB

' point d'entrée de l'application
'------------------------------------------------------------------------------
Public Sub Main()
    
    ' Connexion sur la Db
    If myCon Is Nothing Then
        Set myCon = New ADODB.Connection
    ElseIf myCon.State = adStateConnecting Then
        myCon.Close
    End If
    myCon.Provider = "Microsoft.Jet.OLEDB.4.0"
    myCon.Open App.Path & "\DB\" & DB_NAME, "Admin", ""
    
    ' Ouverture des tables
    tblFam.TblOpen myCon, TBL_FAM_NAME
    tblLoc.TblOpen myCon, TBL_LOC_NAME
    tblMbr.TblOpen myCon, TBL_MBR_NAME
    tblMtr.TblOpen myCon, TBL_MTR_NAME
    tblRle.TblOpen myCon, TBL_RLE_NAME
    
    ' Fermeture des tables
    tblFam.TblClose
    tblLoc.TblClose
    tblMbr.TblClose
    tblMtr.TblClose
    tblRle.TblClose
    
    ' Déconnexion de la db
    If myCon.State = adStateOpen Then myCon.Close
    Set myCon = Nothing
    
End Sub

