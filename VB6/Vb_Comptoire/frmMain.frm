VERSION 5.00
Begin VB.Form frmMain 
   Caption         =   "Comptoire"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnClients 
      Caption         =   "Clients"
      Height          =   495
      Left            =   600
      TabIndex        =   0
      Top             =   480
      Width           =   2055
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

'------------------------------------------------------------------------------
' Inisialisation, fermeture de la forme
'==============================================================================
Private Sub Form_Initialize()
   Dim rst As New ADODB.Recordset
   
   With dtaEnv
      .DB_Comptoire.Open
      
      For Each rst In .Recordsets
         rst.Open
      Next rst

   End With
      
   Set rst = Nothing
   
   ' Connexion sur la DB
   ' M_Db.dbOuvrir
   
   
End Sub
'------------------------------------------------------------------------------
Private Sub Form_Terminate()

   ' Déconnexion de la DB
   'M_Db.dbFermer
   
End Sub

'------------------------------------------------------------------------------
' Evenements des composants
'==============================================================================
Private Sub btnClients_Click()

   ' Affichage de la forme des clients
   frmClient.Show
   
End Sub
