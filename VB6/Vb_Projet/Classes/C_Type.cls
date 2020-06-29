VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "C_Type"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'§§§§§§§§§§§§§§§§§§§§§§§§§§§ STRUCTURE D 'UN TYPE §§§§§§§§§§§§§§§§§§§§§§§§§§§§§

Private Type T_Tpe
   
   ' Données
   tpeId As Long     ' Entrée dans la table des types
   TpeLvl As Long    ' Niveau du type
   TpeNom As String  ' Nom du type
   TpeIco As String  ' Nom du fichier icone
   IsRef As Boolean  ' Si type de référance = 1
   IsAsf As Boolean  ' Si type ascociatif = 1
   
   ' Listes
   Atns() As String              ' Liste des noms des attributs
   Atts() As ADOX.DataTypeEnum   ' Liste des types des attribut (Type de la DB)
   Tpss() As Long                ' Liste des types support
   Tprs() As Long                ' Liste des types de référance
   
   ' Flags de validité des données
   TpeOk As Boolean  ' Flag de mise à jour des données du type
   AtrOk As Boolean  ' Flag de mise à jour des attributs
   TpsOk As Boolean  ' Flag de mise à jour des types supports
   TprOk As Boolean  ' Flag de mise à jour des types référance
   
End Type

Private mTpe As T_Tpe



'§§§§§§§§§§§§§§§§§§§§§§§ PROPRIETES & METHODE DU TYPE §§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Id du type
'==============================================================================
Property Get tpeId() As Long

   With mTpe
   
      ' Contrôle la validité des données du type
      If Not .TpeOk Then setTpe
   
      ' Id du type
      tpeId = .tpeId
   
   End With
   
End Property
Property Let tpeId(id As Long)
   
   ' Valorisation de la propriété
   mTpe.tpeId = id
   
   ' Initialisation du type
   setTpe
   
End Property

'------------------------------------------------------------------------------
' Nom du type
'==============================================================================
Property Get TpeNom() As String

   With mTpe
   
      ' Contrôle la validité des données du type
      If Not .TpeOk Then setTpe
   
      ' Valorisation de la propriété
      TpeNom = .TpeNom
   
   End With
   
End Property

'------------------------------------------------------------------------------
' Niveau
'==============================================================================
Property Get TpeLvl() As Long

   With mTpe
   
      ' Contrôle la validité des données du type
      If Not .TpeOk Then setTpe
   
      ' Valeur du niveau du type
      TpeLvl = .TpeLvl
      
   End With
   
End Property

'------------------------------------------------------------------------------
' Icone
'==============================================================================
Property Get TpeIco() As String

   With mTpe
   
      ' Contrôle la validité des données du type
      If Not .TpeOk Then setTpe
   
      ' Valeur du niveau du type
      TpeIco = .TpeIco
   
   End With
   
End Property

'------------------------------------------------------------------------------
' Type de référance
'==============================================================================
Property Get IsRef() As Boolean

   With mTpe
   
      ' Contrôle la validité des données du type
      If Not .TpeOk Then setTpe
   
      ' Valeur du niveau du type
      IsRef = .IsRef
      
   End With
   
End Property

'------------------------------------------------------------------------------
' Type associatif
'==============================================================================
Property Get IsAsf() As Boolean

   With mTpe
   
      ' Contrôle la validité des données du type
      If Not .TpeOk Then setTpe
   
      ' Valeur du niveau du type
      IsAsf = .IsAsf
      
   End With
  
End Property

Public Sub tpeAdd(nom As String)

   ' Création du type
   

End Sub
Public Sub tpeDel(tpeId As Long)

End Sub



'§§§§§§§§§§§§§§§§§§§§ PROPRIETES & METHODE DES ATTRIBUTS §§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Nombre d'attribut
'==============================================================================
Property Get AtrNbr() As Integer

   With mTpe
   
      ' Contrôle de la validité des données
      If Not .AtrOk Then setAtr
   
      ' Valorisation de la propriété
      AtrNbr = UBound(.Atns)
      
   End With
   
End Property

'------------------------------------------------------------------------------
' Nom d'un des attribut
'==============================================================================
Property Get AtrNom(numAtr As Integer) As String

   With mTpe
   
      ' Contrôle de la validité des données
      If Not .AtrOk Then setAtr
   
      ' Valorisation de la propriété
      AtrNom = .Atns(numAtr)
   
   End With
   
End Property

'------------------------------------------------------------------------------
' Type d'un des attribut
'==============================================================================
Property Get atrTpe(numAtr As Integer) As ADOX.DataTypeEnum

   With mTpe
   
      ' Contrôle de la validité des données
      If Not .AtrOk Then setAtr
   
      ' Valorisation de la propriété
      atrTpe = .Atts(numAtr)
   
   End With
   
End Property

'------------------------------------------------------------------------------
' Ajout d'un attribut dans le type
'==============================================================================
Public Sub atrAdd(nom As String, tpe As ADOX.DataTypeEnum)
  
   With mTpe
   
      ' Création de l'attribut
      ModDtb.atrFldAdd .tpeId, nom, tpe
   
      ' Flag de non validité des données
      mTpe.AtrOk = False
   
   End With
   
End Sub

'------------------------------------------------------------------------------
' Suppression d'un attribut dans le type
'==============================================================================
Public Sub AtrDel(nom As String)
  
   ' Création de l'attribut
   ModDtb.atrFldDel mTpe.tpeId, nom
   
    ' Flag de non validité des données
   mTpe.AtrOk = False
   
End Sub

'------------------------------------------------------------------------------
' Suppression d'un attribut dans le type
'==============================================================================
Public Sub atrSet(nom As String, newNom As String)
  
   ' Création de l'attribut
   ModDtb.atrFldSet mTpe.tpeId, nom, newNom
   
    ' Flag de non validité des données
   mTpe.AtrOk = False
   
End Sub



'§§§§§§§§§§§§§§§§§ PROPRIETES & METHODE DES TYPES REFERANCE §§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Nombre des types référance du type
'==============================================================================
Property Get TprNbr() As Integer

   With mTpe
   
      ' Contrôle la validité des données
      If Not .TprOk Then setTpr
   
      ' Nombre de Types de référance
      TprNbr = UBound(.Tprs)
   
   End With
   
End Property

'------------------------------------------------------------------------------
' Id des types de référance du type
'==============================================================================
Property Get tprId(numTpr As Integer) As Long

   With mTpe
   
      ' Contrôle la validité des données
      If Not .TprOk Then setTpr
   
      ' Id du type de référance
      tprId = .Tprs(numTpr)
   
   End With
   
End Property

'------------------------------------------------------------------------------
' Nom du type de référance
'==============================================================================
Property Get TprNom(numTpr As Integer) As String

   With mTpe
   
      ' Contrôle la validité des données
      If Not .TprOk Then setTpr
   
      ' Id du type de référance
      ModDtb.tblPosRcd ModDtb.tblTpe, "TpeId_", .Tprs(numTpr)
      TprNom = ModDtb.tblTpe.Fields("TpeNom").Value
    
   End With
   
End Property

'------------------------------------------------------------------------------
' Ajout d'un type de référance
'==============================================================================
Public Sub TprAdd(tprId As Long)

   With mTpe
   
      ' Contrôle la validité des données
      If Not .TprOk Then setTpr
         
      ' Ajout du lien
      ModDtb.lnkAdd LNKTPR, .tpeId, tprId
      
   End With

End Sub

'------------------------------------------------------------------------------
' Suppression d'un type de référance
'==============================================================================
Public Sub TprDel(tprId As Long)

   With mTpe
   
      ' Contrôle la validité des données
      If Not .TprOk Then setTpr
         
      ' Ajout du lien
      ModDtb.lnkDel LNKTPR, .tpeId, tprId
      
   End With

End Sub



'§§§§§§§§§§§§§§§§§§ PROPRIETES & METHODE DES TYPES SUPPORT §§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Nombre des types supports du type
'==============================================================================
Property Get TpsNbr() As Integer

   With mTpe
   
      ' Contrôle la validité des données
      If Not .TpsOk Then setTps
   
      ' Nombre de Types support
      TpsNbr = UBound(.Tpss)
      
   End With
   
End Property

'------------------------------------------------------------------------------
' Id d'un des types supports
'==============================================================================
Property Get TpsId(numTps As Integer) As Long

   With mTpe
   
      ' Contrôle la validité des données
      If Not .TpsOk Then setTps
   
      ' Id du type support
      TpsId = .Tpss(numTps)
   
   End With
   
End Property

'------------------------------------------------------------------------------
' Nom du type support
'==============================================================================
Property Get TpsNom(numTps As Integer) As String

   With mTpe
   
      ' Contrôle la validité des données
      If Not .TpsOk Then setTps
   
      ' Id du type support
      ModDtb.tblPosRcd ModDtb.tblTpe, "TpeId_", .Tpss(numTps)
      TpsNom = ModDtb.tblTpe.Fields("TpeNom").Value
    
   End With
   
End Property

'------------------------------------------------------------------------------
' ajout d'un type support
'==============================================================================
Public Sub TpsAdd(TpsId As Long)

   With mTpe
   
      ' Contrôle la validité des données
      If Not .TpsOk Then setTps
         
      ' Ajout du lien
      ModDtb.lnkAdd LNKTPS, .tpeId, TpsId
      
   End With
   
End Sub

'------------------------------------------------------------------------------
' Suppression d'un type support
'==============================================================================
Public Sub TpsDel(TpsId As Long)

   With mTpe
   
      ' Contrôle la validité des données
      If Not .TpsOk Then setTps
         
      ' Ajout du lien
      ModDtb.lnkDel LNKTPS, .tpeId, tprId
      
   End With
   
End Sub



'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ Outils §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
         
'------------------------------------------------------------------------------
' Valorise les données d'un type
'==============================================================================
Private Sub setTpe()
      
   With mTpe
   
      ' Positionnement du tblCpo
      ModDtb.tblPosRcd tblTpe, "TpeId_", CStr(.tpeId)
   
      ' Valorisation du type
      .TpeNom = ModDtb.tblTpe.Fields("TpeNom").Value
      .TpeLvl = ModDtb.tblTpe.Fields("TpeLvl_").Value
      .TpeIco = ModDtb.tblTpe.Fields("TpeIco").Value
      .IsRef = ModDtb.tblTpe.Fields("TpeRef_").Value
      .IsAsf = ModDtb.tblTpe.Fields("TpeAsf_").Value
   
      ' Initialisation des listes
      ReDim .Atns(0)
      ReDim .Atts(0): .AtrOk = False
      ReDim .Tpss(0): .TpsOk = False
      ReDim .Tprs(0): .TprOk = False
   
      ' Mise à jour du flag
      .TpeOk = True
      
   End With
   
End Sub

'------------------------------------------------------------------------------
' Valorise les liste des attribut avec les données de la table des attributs
'==============================================================================
Private Sub setAtr()
   Dim numCol As Integer
   
   With mTpe
   
      ' Initialisation de la liste des types support du type
      ReDim .Atns(0)
      ReDim .Atts(0)
      
      ' Parcour des colonnes de la table
      For numCol = 0 To ModDtb.tblsAtr(tpeId).Fields.Count - 1
      
         ' Saisie du nom de l'attribut
         ReDim Preserve .Atns(numCol)
         .Atns(numCol) = ModDtb.tblsAtr(.tpeId).Fields(numCol).Name
         
         ' Saisie du type de l'attribut
         ReDim Preserve .Atts(numCol)
         .Atts(numCol) = ModDtb.tblsAtr(.tpeId).Fields(numCol).Type
      
      Next numCol
      
      ' flad de validité des données
      .AtrOk = True
      
   End With
   
End Sub

'------------------------------------------------------------------------------
' Recherche des Id des types des de référance
'==============================================================================
Private Sub setTpr()
   Dim tblTpr As New ADODB.Recordset
   Dim numTpr As Integer
   
   With mTpe
   
      ' Initialisation de la liste des types support du type
      ReDim .Tprs(0)
   
      ' Ouverture du rst
      Set tblTpr = ModDtb.PrcRun("QryTpr", .tpeId)
   
      ' Parcourt des types de référance
      While Not tblTpr.EOF
   
         ' Ajout du nouveau type dans la liste
         numTpr = numTpr + 1
         ReDim Preserve .Tprs(numTpr)
         .Tprs(numTpr) = tblTpr.Fields("Id").Value
      
         ' Type support suivant
         tblTpr.MoveNext
      
      Wend

      ' Mise à jour du flag
      .TprOk = True
      
   End With
      
   ' Désallocation
   tblTpr.Close
   Set tblTpr = Nothing
   
End Sub

'------------------------------------------------------------------------------
' Recherche des Id des types qui peuvent être supports du type
'==============================================================================
Private Sub setTps()
   Dim tblTps As New ADODB.Recordset
   Dim numTps As Integer

   With mTpe
   
      ' Ouverture du rst
      Set tblTps = ModDtb.PrcRun("QryTps", .tpeId)
   
      ' Parcourt des types supports
      While Not tblTps.EOF
   
         ' Ajout du nouveau type dans la liste
         numTps = numTps + 1
         ReDim Preserve .Tpss(numTps)
         .Tpss(numTps) = tblTps.Fields("Id").Value
      
         ' Type support suivant
         tblTps.MoveNext
      
      Wend

      ' Mise à jour du flag
      .TpsOk = True
   
   End With
   
   ' Désallocation
   tblTps.Close
   Set tblTps = Nothing
   
End Sub




