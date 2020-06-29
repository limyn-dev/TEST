VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CEtape"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"399DB25D0118"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
Option Explicit

'##ModelId=399DB2690320
Private mId As Long
'##ModelId=399DB29B02A8
Private mNumero As Integer
'##ModelId=399DB27A0262
Private mArriveeHeure As Date
'##ModelId=399DB283037A
Private mDepartHeure As Date
Private mCircuit
'##ModelId=399DB2920262
Private mVille As CVille

' Id
'------------------------------------------------------------------------------
'##ModelId=399C70710104
Public Property Get Id() As Long
    Id = mId
End Property
'##ModelId=399C70720050
Public Property Let Id(ByVal vNewValue As Long)
    mId = vNewValue
End Property

' Numero
'------------------------------------------------------------------------------
Public Property Get Numero() As Integer
    Numero = mNumero
End Property
Public Property Let Numero(ByVal vNewValue As Integer)
    mNumero = vNewValue
End Property

' ArriveeHeure
'------------------------------------------------------------------------------
Public Property Get ArriveeHeure() As Date
    ArriveeHeure = mArriveeHeure
End Property
Public Property Let ArriveeHeure(ByVal vNewValue As Date)
    mArriveeHeure = vNewValue
End Property

' DepartHeure
'------------------------------------------------------------------------------
Public Property Get DepartHeure() As Date
    DepartHeure = mDepartHeure
End Property
Public Property Let DepartHeure(ByVal vNewValue As Date)
    mDepartHeure = vNewValue
End Property

' Circuit
'------------------------------------------------------------------------------
Public Property Get Circuit() As CCircuit
    Set Circuit = mCircuit
End Property
Public Property Let Circuit(ByVal vNewValue As CCircuit)
    Set mCircuit = vNewValue
End Property

' Ville
'------------------------------------------------------------------------------
Public Property Get Ville() As CVille
    Set Ville = mVille
End Property
Public Property Let Ville(ByVal vNewValue As CVille)
    Set mVille = vNewValue
End Property



'******************************************************************************


' Instanciation
'------------------------------------------------------------------------------
Private Sub Class_Initialize()
End Sub

' Désinstanciation
'------------------------------------------------------------------------------
Private Sub Class_Terminate()
    Set mVille = Nothing
    Set mCircuit = Nothing
End Sub
