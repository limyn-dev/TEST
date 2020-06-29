VERSION 5.00
Begin VB.Form frmMain 
   Caption         =   "Form1"
   ClientHeight    =   3682
   ClientLeft      =   63
   ClientTop       =   343
   ClientWidth     =   5817
   LinkTopic       =   "Form1"
   ScaleHeight     =   3682
   ScaleWidth      =   5817
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame fraExecute 
      Caption         =   "Création"
      Height          =   1281
      Left            =   98
      TabIndex        =   7
      Top             =   2254
      Width           =   5593
      Begin VB.TextBox txtInfo 
         Height          =   889
         Left            =   98
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   9
         Top             =   200
         Width           =   4221
      End
      Begin VB.CommandButton btnCreate 
         Caption         =   "Créer"
         Height          =   315
         Left            =   4410
         TabIndex        =   8
         Top             =   200
         Width           =   1085
      End
   End
   Begin VB.Frame fraPath 
      Caption         =   "Chemins"
      Height          =   2065
      Left            =   98
      TabIndex        =   0
      Top             =   98
      Width           =   5593
      Begin VB.TextBox txtPackage 
         Height          =   315
         Left            =   1300
         TabIndex        =   11
         Top             =   1500
         Width           =   3801
      End
      Begin VB.TextBox txtPathMdb 
         Height          =   315
         Left            =   100
         TabIndex        =   4
         Top             =   400
         Width           =   5000
      End
      Begin VB.TextBox txtPathRep 
         Height          =   315
         Left            =   100
         TabIndex        =   3
         Top             =   1000
         Width           =   5000
      End
      Begin VB.CommandButton btnSelectMdb 
         Caption         =   "..."
         Height          =   315
         Left            =   5150
         TabIndex        =   2
         Top             =   392
         Width           =   315
      End
      Begin VB.CommandButton btnSelectRep 
         Caption         =   "..."
         Height          =   315
         Left            =   5150
         TabIndex        =   1
         Top             =   1000
         Width           =   315
      End
      Begin VB.Label lblPackage 
         Caption         =   "Nom du package"
         Height          =   315
         Left            =   98
         TabIndex        =   10
         Top             =   1500
         Width           =   1200
      End
      Begin VB.Label lblPathMdb 
         Caption         =   "Base de donnée"
         Height          =   200
         Left            =   100
         TabIndex        =   6
         Top             =   200
         Width           =   1001
      End
      Begin VB.Label lblPathRep 
         Caption         =   "Classe java"
         Height          =   200
         Left            =   100
         TabIndex        =   5
         Top             =   800
         Width           =   1001
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit



' Instanciation du formulaire
'------------------------------------------------------------------------------
Private Sub Form_Load()
    mdlDB.pathMdb = ""
    mdlFic.pathFic = ""
End Sub
'------------------------------------------------------------------------------
Private Sub Form_Unload(Cancel As Integer)
End Sub

' Fonctionnalités des bouttons
'------------------------------------------------------------------------------
Private Sub btnSelectMdb_Click()
    txtPathMdb.Text = mdlApi.SelectFile(Me.hWnd, "msAccess (*.mdb)" & vbNullChar & "*.mdb")
    txtPackage.Text = nomDb(txtPathMdb.Text)
    txtPackage.Text = Left(txtPackage.Text, Len(txtPackage.Text) - 4)
End Sub
'------------------------------------------------------------------------------
Private Sub btnSelectRep_Click()
    txtPathRep.Text = mdlApi.SelectFolder(Me.hWnd, "")
    If Right(txtPathRep.Text, 1) = "-" Then txtPathRep.Text = Left(txtPathRep.Text, Len(txtPathRep.Text) - 1)
End Sub
'------------------------------------------------------------------------------
Private Sub btnCreate_Click()
    If Not (txtPathMdb.Text = "" Or txtPathRep.Text = "" Or txtPackage.Text = "") Then
        
        ' Mise à jour des paramètres
        mdlFic.packageName = txtPackage.Text
        mdlFic.pathFic = txtPathRep.Text
        mdlDB.pathMdb = txtPathMdb.Text
        
        ' Création des classes
        txtInfo.Text = txtInfo.Text & "Ouverture de " & mdlDB.pathMdb & vbCr
        txtInfo.Refresh
        mdlDB.connecter
        mdlFic.createAll txtInfo
        mdlDB.deconnecter
        txtInfo.Text = txtInfo.Text & "Fermeture de " & mdlDB.pathMdb & vbCr
        txtInfo.Refresh
        
    Else
        MsgBox "Séléctionner une base de donnée et un répértoire"
    End If
End Sub

' Nom de la bd
'------------------------------------------------------------------------------
Private Function nomDb(path As String) As String
    Dim posNom As Integer
    
    posNom = InStrRev(path, "\")
    nomDb = Right(path, Len(path) - posNom)
    
End Function
