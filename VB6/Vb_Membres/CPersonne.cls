VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CPersonne"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

' Membres
'------------------------------------------------------------------------------
Private my_Id As Integer
Private myFId As Integer
Private myPrn As String
Private myNai As Date
Private myCat() As Boolean

' Id
'------------------------------------------------------------------------------
Public Property Get Id() As Integer
    Id = my_Id
End Property
Public Property Let Id(ByVal vNewValue As Integer)
    my_Id = vNewValue
End Property

' Fid
'------------------------------------------------------------------------------
Public Property Get FId() As Integer
    Id = myFId
End Property
Public Property Let FId(ByVal vNewValue As Integer)
    myFId = vNewValue
End Property

' Prenom
'------------------------------------------------------------------------------
Public Property Get Prenom() As String
    Prenom = myPrn
End Property
Public Property Let Prenom(ByVal vNewValue As String)
    myPrn = vNewValue
End Property

' Naissance
'------------------------------------------------------------------------------
Public Property Get Naissance() As Date
    Naissance = myNai
End Property
Public Property Let Naissance(ByVal vNewValue As Date)
    myNai = vNewValue
End Property

' CatCount
'------------------------------------------------------------------------------
Public Property Get CatCount() As Integer
    CatCount = UBound(myCat)
End Property
Public Property Let CatCount(ByVal vNewValue As Integer)
    ReDim Preserve myCat(vNewValue)
End Property

' CatValue
'------------------------------------------------------------------------------
Public Property Get CatValue(numCat As Integer) As Boolean
    If numCat <= UBound(myCat) Then CatValue = myCat(numCat)
End Property
Public Property Let CatValue(numCat As Integer, ByVal vNewValue As Boolean)
    If numCat > UBound(myCat) Then ReDim Preserve myCat(numCat)
    myCat(numCat) = vNewValue
End Property



'******************************************************************************



' Instanciation
'------------------------------------------------------------------------------
Private Sub Class_Initialize()
    my_Id = 0
    myFId = 0
    myPrn = "NO DATA"
    ReDim myCat(1)
End Sub

' Désinstanciation
'------------------------------------------------------------------------------
Private Sub Class_Terminate()
End Sub





