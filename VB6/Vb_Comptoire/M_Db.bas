Attribute VB_Name = "M_Db"
Option Explicit

'------------------------------------------------------------------------------
'  Membres
'==============================================================================

' Chemin de la DB
Const DBPATH = "C:\Program Files\Microsoft Office\Office\Exemples\COMPTOIR.MDB"

' Connexion
Public con As ADODB.Connection

' Catalogue
Public cat As ADOX.Catalog

' Table des client et sa structure
Public tblCli As ADODB.Recordset
Public Const TBLCLINOM = "Clients"
Public Const FLDCLICDE = "Code client"
Public Const FLDCLISCT = "Soci�t�"
Public Const FLDCLICTT = "Contact"
Public Const FLDCLIFCT = "Fonction"
Public Const FLDCLIADR = "Adresse"
Public Const FLDCLILOC = "Ville"
Public Const FLDCLIRGN = "R�gion"
Public Const FLDCLINPA = "Code postal"
Public Const FLDCLIPYS = "Pays"
Public Const FLDCLITEL = "T�l�phone"
Public Const FLDCLIFAX = "Fax"

'------------------------------------------------------------------------------
'  Ouverture, fermeture des tables de la DB
'==============================================================================
Public Sub dbOuvrir()
   Dim numTpe As Integer
   
   ' Cr�ation de la cr�ation.
   Set con = New ADODB.Connection
   con.Provider = "Microsoft.Jet.OLEDB.3.51"
   con.Open DBPATH, "admin", ""
   
   ' Cr�ation du catalogue
   Set cat = New ADOX.Catalog
   cat.ActiveConnection = con
   
   ' Ouverture de la table des clients
   Set tblCli = New ADODB.Recordset
   tblCli.Open TBLCLINOM, con
   
End Sub
'------------------------------------------------------------------------------
Public Sub dbFermer()
   Dim numTpe As Integer
   
   ' Fermeture de la table des clients
   tblCli.Close
   Set tblCli = Nothing
   
   ' Fermeture du catalog
   Set cat = Nothing
   
   ' Fermeture de la connexion
   con.Close
   Set con = Nothing
   
End Sub


