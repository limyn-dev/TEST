VERSION 5.00
Begin VB.Form frmDtl 
   Caption         =   "Patch"
   ClientHeight    =   4605
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6585
   LinkTopic       =   "Form1"
   ScaleHeight     =   4605
   ScaleWidth      =   6585
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame3 
      Caption         =   "Folders"
      Height          =   900
      Left            =   100
      TabIndex        =   11
      Top             =   100
      Width           =   6400
      Begin VB.ComboBox cboMfl 
         Height          =   315
         Left            =   1300
         TabIndex        =   13
         Text            =   "Combo1"
         Top             =   500
         Width           =   5000
      End
      Begin VB.TextBox txtRfl 
         Height          =   300
         Left            =   1300
         TabIndex        =   12
         Top             =   200
         Width           =   5000
      End
      Begin VB.Label lblMfl 
         Caption         =   "Media folder"
         Height          =   300
         Left            =   105
         TabIndex        =   15
         Top             =   500
         Width           =   1200
      End
      Begin VB.Label lblRfl 
         Caption         =   "Root folder"
         Height          =   300
         Left            =   105
         TabIndex        =   14
         Top             =   200
         Width           =   1200
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "Patch list"
      Height          =   3400
      Left            =   100
      TabIndex        =   8
      Top             =   1050
      Width           =   3200
      Begin VB.ListBox lstPth 
         Height          =   2985
         Left            =   105
         TabIndex        =   9
         Top             =   300
         Width           =   2940
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Patch details"
      Height          =   3400
      Left            =   3300
      TabIndex        =   0
      Top             =   1050
      Width           =   3200
      Begin VB.CommandButton btnSve 
         Caption         =   "Enregistrer"
         Height          =   250
         Left            =   100
         TabIndex        =   10
         Top             =   3050
         Width           =   3000
      End
      Begin VB.ListBox lstRgk 
         Height          =   650
         Left            =   100
         TabIndex        =   7
         Top             =   2300
         Width           =   3000
      End
      Begin VB.TextBox txtRgk 
         Height          =   300
         Left            =   100
         TabIndex        =   3
         Top             =   2000
         Width           =   3000
      End
      Begin VB.TextBox txtBvs 
         Height          =   300
         Left            =   100
         TabIndex        =   2
         Top             =   1300
         Width           =   3000
      End
      Begin VB.TextBox txtExe 
         Height          =   300
         Left            =   100
         TabIndex        =   1
         Top             =   600
         Width           =   3000
      End
      Begin VB.Label lblRgk 
         Caption         =   "Registry Keys"
         Height          =   250
         Left            =   100
         TabIndex        =   6
         Top             =   1750
         Width           =   3000
      End
      Begin VB.Label lblVbs 
         Caption         =   "Master version"
         Height          =   250
         Left            =   100
         TabIndex        =   5
         Top             =   1050
         Width           =   3000
      End
      Begin VB.Label lblExe 
         Caption         =   "Executable"
         Height          =   250
         Left            =   100
         TabIndex        =   4
         Top             =   350
         Width           =   3000
      End
   End
End
Attribute VB_Name = "frmDtl"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit


' Chemin du fichier ini
Const FLE_PTH = "C:\Temp\toto.ini"



' Membres
Private myFle As CXmlFile





' Initialisation des membres
'______________________________________________________________________________________________________________________
Private Sub Form_Initialize()
   Dim oReg As New CRegistry
   Dim sPth As String
   
   sPth = "Software\Microsoft\Windows\CurrentVersion\Uninstall"
   oReg.CboLoad oReg, sPth, Me.cboMfl
   
End Sub



' Chargement de la forme
'______________________________________________________________________________________________________________________
Private Sub Form_Load()
   Dim oPth As CPatch
   
   ' Mise à jour de la liste des patchs
   'myFle.FileRead FLE_PTH
   'myFle.ScanFolder "C:\temp\Files"
   
   ' Parcourt de la liste des patchs
   'For Each oPth In myFle.Patchs
   '   lstPth.AddItem oPth.ExeFile
   'Next
   
End Sub



' Sélection d'un patch
'______________________________________________________________________________________________________________________
Private Sub lstPth_Click()
'   Dim oRgk As CRegKey
   
'   With myFle.Patchs(lstPth.Text)
'      Me.txtExe.Text = .ExeFile
'      Me.txtBvs.Text = CStr(.BuildVersion)
'      Me.lstRgk.Clear
'      For Each oRgk In .RegKeys
'         Me.lstRgk.AddItem oRgk.Value
'      Next
'   End With
   
End Sub



' Suppression d'une clef de registry
'______________________________________________________________________________________________________________________
Private Sub lstRgk_DblClick()
   Me.lstRgk.RemoveItem Me.lstRgk.ListIndex
End Sub



' Ajout d'une clef de registry
'______________________________________________________________________________________________________________________
Private Sub txtRgk_Validate(Cancel As Boolean)
'   If Not Me.txtRgk.Text = "" Then
'      Me.lstRgk.AddItem Me.txtRgk.Text
'      Me.txtRgk.Text = ""
'   End If
'   Me.lstRgk.SetFocus
End Sub



' Modification du patch
'______________________________________________________________________________________________________________________
Private Sub btnSve_Click()
'   Dim nRgk As Integer
   
'   With myFle.Patchs(lstPth.Text)
'      .ExeFile = Me.txtExe
'      .BuildVersion = CInt(Me.txtBvs)
'      Set .RegKeys = Nothing
'      Set .RegKeys = New CRegKeys
'      For nRgk = 1 To Me.lstRgk.ListCount
'         .RegKeys.Add Me.lstRgk.List(nRgk)
'      Next nRgk
'   End With
   
End Sub



