VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CScript"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Enum TypeLog
   LOG_ERR = 1
   LOG_INF = 2
End Enum

Private myCde As String
Private myHst As String
Private myLog As String
Private WithEvents mySCt As MSScriptControl.ScriptControl
Attribute mySCt.VB_VarHelpID = -1



' Création de l'objet
'______________________________________________________________________________________________________________________
Private Sub Class_Initialize()
   myCde = ""
   myHst = ""
End Sub






' Destruction de l'objet
'______________________________________________________________________________________________________________________
Private Sub Class_Terminate()
End Sub



' HostName
'______________________________________________________________________________________________________________________
Public Property Get HostName() As String
   HostName = myHst
End Property
Public Property Let HostName(ByVal vNewValue As String)
   myHst = vNewValue
   LogAdd "Initialisation du Hoste name: " & myHst, LOG_INF
End Property



' Ajout de code
'______________________________________________________________________________________________________________________
Public Sub AddCode(sCode As String)
   myCde = myCde & sCode
   LogAdd "Ajout du code [" & Left(sCode, 7) & "...]", LOG_INF
End Sub



' Initialisation du code
'______________________________________________________________________________________________________________________
Public Sub ClearCode()
   
   ' Initialisation du log
   myLog = ""
   LogAdd "Initialisation du log", LOG_INF
   
   ' initialisation du code
   myCde = ""
   LogAdd "Initialisation du code", LOG_INF
   
End Sub



' Execution
'______________________________________________________________________________________________________________________
Public Sub RunCode()
   
   ' Hoste name valide
   If myHst = "" Then
      LogAdd "Pas de hoste name " & vbCrLf, LOG_ERR
      GoTo End_Sub
   End If
   
   ' Code valide
   If myCde = "" Then
      LogAdd "Pas de code " & vbCrLf, LOG_ERR
      GoTo End_Sub
   End If
      
   ' Création du contrôleur de script
   On Error GoTo Err_Create
   Set mySCt = CreateObject("MSScriptControl.ScriptControl", myHst)
   mySCt.Language = "VBScript"
   LogAdd "Création de l'objet script control sur " & myHst, LOG_INF
     
   ' Execution du script
   On Error GoTo Err_Execute
   mySCt.ExecuteStatement myCde
   LogAdd "Execution du script sur " & myHst, LOG_INF
      
   ' Suppression du script
   Set mySCt = Nothing
   LogAdd "Suppression de l'objet script control sur" & myHst, LOG_INF
      
   GoTo End_Sub
   
Err_Create:
   LogAdd "Instanciation impossible sur " & myHst, LOG_ERR
   GoTo End_Sub
   
Err_Execute:
   LogAdd "Execution impossible sur " & myHst, LOG_ERR
   GoTo End_Sub
   
End_Sub:
End Sub



' Error handling
'______________________________________________________________________________________________________________________
Private Sub mySct_Error()
   Dim sMsg As String
   
   With mySCt.Error
      sMsg = vbCrLf
      sMsg = sMsg & vbTab & "Text       : " & .Text & vbCrLf
      sMsg = sMsg & vbTab & "Description: " & .Description & vbCrLf
      sMsg = sMsg & vbTab & "Source     : " & .Source & vbCrLf
      sMsg = sMsg & vbTab & "Number     : " & .Number & vbCrLf
      sMsg = sMsg & vbTab & "Column     : " & .Column & vbCrLf
      sMsg = sMsg & vbTab & "Line       : " & .Line
      .Clear
   End With
   
   LogAdd sMsg, LOG_ERR
   
End Sub



' Affichage du log dans une text box
'______________________________________________________________________________________________________________________
Public Sub LogLoadTxt(txt As TextBox)
   With txt
      .Text = ""
      .Text = myLog
   End With
End Sub



' Ajout d'un élément dans le log
'______________________________________________________________________________________________________________________
Private Sub LogAdd(sTxt As String, eTpe As TypeLog)

   Select Case eTpe
      Case LOG_ERR
         myLog = myLog & "ERROR -> " & sTxt & vbCrLf
      Case Else
         myLog = myLog & "INFO  -> " & sTxt & vbCrLf
   End Select
   
End Sub

