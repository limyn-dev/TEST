VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "C_Composant"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

' Structure d'une Composant
Private Type T_Cpo
   Level As Long     ' Niveau du composant
   TpeId As Long     ' Entrée dans la table des types
   cpoId As Long     ' Entrée dans la table des Composants
   DscId As Long     ' Entrée dans la table de déscription du type
   Atrs() As String  ' Table des attributs du composant
   Refs() As Long    ' Table des composant liés
End Type
   


'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ Données membres §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Composant
'============================================================================
Dim mCpo As T_Cpo


'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ Setter §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Id de du composant
'==============================================================================
Property Let Id(cpoId As Long)
   
   mCpo.cpoId = cpoId
   
   ' Initialisation de l'Composant
   setCpo mCpo
   
End Property



'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ Getter §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Fournis l'Id du composant
'==============================================================================
Property Get Id() As Long

   ' Valorisation de la propriéte
   Id = mCpo.cpoId
   
End Property

'------------------------------------------------------------------------------
' Fournis la valeur du niveau du composant
'==============================================================================
Property Get Niveau() As Long

   ' Valorisation de la propriété
   Niveau = mCpo.Level
   
End Property

'------------------------------------------------------------------------------
' Fournis le nombre d'attributs du composant
'==============================================================================
Property Get NbrAtr() As Integer

   ' Valorisation de la propriété
   NbrAtr = UBound(Atrs)
   
End Property

'------------------------------------------------------------------------------
' Fournis le nom d'un attribut en fonction de son numéro
'==============================================================================
Property Get AtrNom(numAtr As Integer) As String

   ' Valorisation de la propriété
   AtrNom = Atrs(1, numAtr)
   
End Property

'------------------------------------------------------------------------------
' Fournis la valeur d'un attribut en fonction de son numéro
'==============================================================================
Property Get AtrVal(numAtr As Integer) As String

   ' Valorisation de la propriété
   AtrVal = Atrs(2, numAtr)
   
End Property



'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ Methodes §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Ajout des labels et textbox en fonction des déscriptions d'une Composant
'==============================================================================
Public Sub Affiche(ByRef lbl As Variant, ByRef txt As Variant)
   Dim atr As Integer
   Dim lne As Integer
      
   ' Parcourt des attributs
   For atr = 1 To UBound(mCpo.Atrs) - 1
      
      ' Ajout du label et de la textbox
      lne = ModLbl.AtrAdd(lbl, txt, 1)
            
      ' Insértion des valeurs
      lbl(lne).Caption = mCpo.Atrs(1, atr) & "  :  "
      txt(lne).Text = mCpo.Atrs(2, atr)
            
   Next atr
   
End Sub



'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ Outils §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Valorise les valeurs et les référances d'une Composant
'==============================================================================
Private Sub setCpo(ByRef cpo As T_Cpo)
    
   ' Réinitialisation des rst
   ' ModDtb.rstCpo.Requery
   ' ModDtb.rstTpe.Requery
   
   ' Positionnement du rstCpo
   ModDtb.rstSetPos rstCpo, "CpoId_", CStr(cpo.cpoId)
   
   ' Mise à jour des ids du composant
   cpo.TpeId = ModDtb.rstCpo.Fields("CpoTpeId_").Value
   cpo.DscId = ModDtb.rstCpo.Fields("CpoDscId_").Value
   
   ' Positionnement du rstTpe
   ModDtb.rstSetPos rstTpe, "TpeId_", CStr(cpo.TpeId)
   
   ' Recherche du Niveau du composant
   cpo.Level = ModDtb.rstTpe.Fields("TpeLvl_").Value
   
   ' Mise à jour des labels et valeurs
   setAtrs cpo
   
End Sub

'------------------------------------------------------------------------------
' Valorise les attributs d'un composant
'==============================================================================
Private Sub setAtrs(ByRef cpo As T_Cpo)
   Dim fld As Integer
   Dim atr As Integer
   
   ' Positionnement du rstDsc
   ModDtb.rstSetPos ModDtb.rstsDsc(cpo.TpeId), "DscId_", CStr(cpo.DscId)
  
   ' Initialisation de la table des attributs
   ReDim cpo.Atrs(2, 0)

   ' Parcourt des champs
   For fld = 0 To ModDtb.rstsDsc(cpo.TpeId).Fields.Count - 1
      
      ' Contrôle si champs est une clef
      If Not Right(ModDtb.rstsDsc(cpo.TpeId).Fields.Item(fld).Name, 1) = "_" Then
         
         ' Ajout des noms et des valeurs dans la table des attributs
         atr = atr + 1
         ReDim Preserve cpo.Atrs(2, atr)
         cpo.Atrs(1, atr) = ModDtb.rstsDsc(cpo.TpeId).Fields(fld).Name
         On Error Resume Next
         cpo.Atrs(2, atr) = CStr(ModDtb.rstsDsc(cpo.TpeId).Fields(fld).Value)
         
      End If
      
   Next fld
   
End Sub

