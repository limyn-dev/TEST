VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "CFamille"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

' Membres
'------------------------------------------------------------------------------
Private myNum As Integer  ' Numéro de la famille
Private myNom As String   ' Nom de la famille
Private myAdr As String   ' Adresse de la famille
Private myNPA As String   ' NPA
Private myCty As String   ' Ville
Private myEml As String   ' Adresse email
    
' id
'------------------------------------------------------------------------------
Public Property Get id() As String
    id = myNum
End Property
Public Property Let id(ByVal vNewValue As String)
    myNum = vNewValue
End Property

' Nom
'------------------------------------------------------------------------------
Public Property Get Nom() As String
    Nom = myNom
End Property
Public Property Let Nom(ByVal vNewValue As String)
    myNom = vNewValue
End Property

' Adresse
'------------------------------------------------------------------------------
Public Property Get Adresse() As String
    Adresse = myAdr
End Property
Public Property Let Adresse(ByVal vNewValue As String)
    myAdr = vNewValue
End Property

' NPA
'------------------------------------------------------------------------------
Public Property Get Npa() As String
    Npa = myNPA
End Property
Public Property Let Npa(ByVal vNewValue As String)
    myNPA = vNewValue
End Property

' Ville
'------------------------------------------------------------------------------
Public Property Get Ville() As String
    Ville = myCty
End Property
Public Property Let Ville(ByVal vNewValue As String)
    myCty = vNewValue
End Property

' EMail
'------------------------------------------------------------------------------
Public Property Get EMail() As String
    EMail = myEml
End Property
Public Property Let EMail(ByVal vNewValue As String)
    myEml = vNewValue
End Property
    
    
    
'******************************************************************************



' Instanciation
'------------------------------------------------------------------------------
Private Sub Class_Initialize()
    myNum = 0
    myNom = "NO DATA"
    myAdr = "NO DATA"
    myNPA = "NO DATA"
    myCty = "NO DATA"
    myEml = "NO DATA"
End Sub

' Désinstanciation
'------------------------------------------------------------------------------
Private Sub Class_Terminate()

End Sub
