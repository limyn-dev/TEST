VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CParticipant"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"39A6E4B80244"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
Option Explicit


'##ModelId=39A6E4B802B2
Private mId As Long
'##ModelId=39A6E4B802EF
Private mClient As CClient 'local copy
'##ModelId=39A6E4B8035C
Private mAccompte As Long 'local copy
'##ModelId=39A6E4B8038E
Private mVersement As Long 'local copy
'##ModelId=39A6E4B803CA
Private mRemise As Long 'local copy

' Id
'------------------------------------------------------------------------------
'##ModelId=39A6E4B90014
Public Property Let Id(ByVal vData As Long)
Attribute Id.VB_Description = " Id\r\n------------------------------------------------------------------------------"
    mId = vData
End Property
'##ModelId=39A6E4B90082
Public Property Get Id() As Long
    Id = mId
End Property

' Remise
'------------------------------------------------------------------------------
'##ModelId=39A6E4B900B4
Public Property Let Remise(ByVal vData As Long)
Attribute Remise.VB_Description = " Remise\r\n------------------------------------------------------------------------------"
    mRemise = vData
End Property
'##ModelId=39A6E4B900F1
Public Property Get Remise() As Long
    Remise = mRemise
End Property

' Versemnt
'------------------------------------------------------------------------------
'##ModelId=39A6E4B90123
Public Property Let Versement(ByVal vData As Long)
Attribute Versement.VB_Description = " Versemnt\r\n------------------------------------------------------------------------------"
    mVersement = vData
End Property
'##ModelId=39A6E4B9015F
Public Property Get Versement() As Long
    Versement = mVersement
End Property

' Accompte
'------------------------------------------------------------------------------
'##ModelId=39A6E4B90194
Public Property Let Accompte(ByVal vData As Long)
Attribute Accompte.VB_Description = " Accompte\r\n------------------------------------------------------------------------------"
    mAccompte = vData
End Property
'##ModelId=39A6E4B901FE
Public Property Get Accompte() As Long
    Accompte = mAccompte
End Property

' Client
'------------------------------------------------------------------------------
'##ModelId=39A6E4B9026D
Public Property Get Client() As CClient
    Set Client = mClient
End Property
'##ModelId=39A6E4B9023A
Public Property Set Client(ByVal vData As CClient)
    Set mClient = Nothing
    Set mClient = vData
End Property


'******************************************************************************



' Instanciation
'------------------------------------------------------------------------------
'##ModelId=39A6E4B902AB
Private Sub Class_Initialize()
Attribute Class_Initialize.VB_Description = " Instanciation\r\n------------------------------------------------------------------------------"
    mId = 0
    mAccompte = 0
    mVersement = 0
    mRemise = 0
    Set mClient = New CClient
End Sub

' Désinstanciation
'------------------------------------------------------------------------------
'##ModelId=39A6E4B902DA
Private Sub Class_Terminate()
Attribute Class_Terminate.VB_Description = " Désinstanciation\r\n------------------------------------------------------------------------------"
    Set mClient = Nothing
End Sub
