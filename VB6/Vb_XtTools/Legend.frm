VERSION 5.00
Begin VB.Form frmLegend 
   AutoRedraw      =   -1  'True
   BorderStyle     =   0  'None
   Caption         =   "Légende"
   ClientHeight    =   1515
   ClientLeft      =   150
   ClientTop       =   435
   ClientWidth     =   4440
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Legend.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1515
   ScaleWidth      =   4440
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame3 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Index           =   9
      Left            =   2535
      TabIndex        =   12
      Top             =   -90
      Width           =   1920
      Begin VB.Label Label1 
         Caption         =   "Priorité absolue = 8"
         ForeColor       =   &H8000000D&
         Height          =   255
         Index           =   3
         Left            =   180
         TabIndex        =   19
         Top             =   240
         Width           =   1560
      End
   End
   Begin VB.Frame Frame3 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Index           =   10
      Left            =   2535
      TabIndex        =   13
      Top             =   405
      Width           =   1920
      Begin VB.Label Label1 
         Caption         =   "Priorité du thread = 1"
         ForeColor       =   &H8000000D&
         Height          =   255
         Index           =   6
         Left            =   180
         TabIndex        =   23
         Top             =   240
         Width           =   1620
      End
   End
   Begin VB.Frame Frame3 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Index           =   11
      Left            =   2535
      TabIndex        =   14
      Top             =   900
      Width           =   1920
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "Contient 7 enfants"
         ForeColor       =   &H8000000D&
         Height          =   195
         Index           =   5
         Left            =   180
         TabIndex        =   21
         Top             =   240
         Width           =   1350
      End
   End
   Begin VB.Frame Frame3 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Index           =   3
      Left            =   1965
      TabIndex        =   3
      Top             =   -90
      Width           =   600
      Begin VB.Label Label1 
         Caption         =   "@8"
         Height          =   240
         Index           =   7
         Left            =   180
         TabIndex        =   18
         Top             =   240
         Width           =   315
      End
   End
   Begin VB.Frame Frame3 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Index           =   6
      Left            =   570
      TabIndex        =   9
      Top             =   -90
      Width           =   1425
      Begin VB.Label Label1 
         Caption         =   "Un processus"
         ForeColor       =   &H8000000D&
         Height          =   285
         Index           =   0
         Left            =   180
         TabIndex        =   15
         Top             =   240
         Width           =   1065
      End
   End
   Begin VB.Frame Frame3 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Index           =   4
      Left            =   1965
      TabIndex        =   4
      Top             =   405
      Width           =   600
      Begin VB.Label Label1 
         Caption         =   "@1*"
         Height          =   240
         Index           =   8
         Left            =   150
         TabIndex        =   22
         Top             =   225
         Width           =   315
      End
   End
   Begin VB.Frame Frame3 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Index           =   5
      Left            =   1965
      TabIndex        =   5
      Top             =   900
      Width           =   615
      Begin VB.Label Label1 
         Caption         =   "[7]"
         Height          =   285
         Index           =   4
         Left            =   180
         TabIndex        =   20
         Top             =   240
         Width           =   285
      End
   End
   Begin VB.Frame Frame3 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Index           =   0
      Left            =   0
      TabIndex        =   0
      Top             =   -90
      Width           =   600
      Begin VB.PictureBox Picture1 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   240
         Index           =   0
         Left            =   180
         Picture         =   "Legend.frx":000C
         ScaleHeight     =   240
         ScaleWidth      =   240
         TabIndex        =   6
         Top             =   240
         Width           =   240
      End
   End
   Begin VB.Frame Frame3 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Index           =   1
      Left            =   0
      TabIndex        =   1
      Top             =   405
      Width           =   600
      Begin VB.PictureBox Picture1 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   240
         Index           =   1
         Left            =   165
         Picture         =   "Legend.frx":0156
         ScaleHeight     =   240
         ScaleWidth      =   240
         TabIndex        =   7
         Top             =   255
         Width           =   240
      End
   End
   Begin VB.Frame Frame3 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Index           =   2
      Left            =   0
      TabIndex        =   2
      Top             =   900
      Width           =   600
      Begin VB.PictureBox Picture1 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   240
         Index           =   2
         Left            =   165
         Picture         =   "Legend.frx":02A0
         ScaleHeight     =   240
         ScaleWidth      =   240
         TabIndex        =   8
         Top             =   240
         Width           =   240
      End
   End
   Begin VB.Frame Frame3 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Index           =   7
      Left            =   570
      TabIndex        =   10
      Top             =   405
      Width           =   1425
      Begin VB.Label Label1 
         Caption         =   "Un thread"
         ForeColor       =   &H8000000D&
         Height          =   285
         Index           =   1
         Left            =   180
         TabIndex        =   16
         Top             =   240
         Width           =   1065
      End
   End
   Begin VB.Frame Frame3 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Index           =   8
      Left            =   570
      TabIndex        =   11
      Top             =   900
      Width           =   1425
      Begin VB.Label Label1 
         Caption         =   "Une fenêtre"
         ForeColor       =   &H8000000D&
         Height          =   285
         Index           =   2
         Left            =   180
         TabIndex        =   17
         Top             =   240
         Width           =   1065
      End
   End
End
Attribute VB_Name = "frmLegend"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'  Projet XtTools par Xavier Tello   (xavier.tello@wanadoo.fr)

Private Sub Form_Load()
    SetWindowPos frmLegend.hWnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE Or SWP_NOMOVE
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Dim ret As Long
    If Button = 1 Then
        Call ReleaseCapture
        ret = SendMessage(Me.hWnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&)
    End If
End Sub
Private Sub Frame3_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
Dim ret As Long
    If Button = 1 Then
        Call ReleaseCapture
        ret = SendMessage(Me.hWnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&)
    End If
End Sub
Private Sub Label1_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
Dim ret As Long
    If Button = 1 Then
        Call ReleaseCapture
        ret = SendMessage(Me.hWnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&)
    End If
End Sub
Private Sub Picture1_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
Dim ret As Long
    If Button = 1 Then
        Call ReleaseCapture
        ret = SendMessage(Me.hWnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&)
    End If
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = 2 Then PopupMenu frmMain.mnuLegendPopup, 2
End Sub
Private Sub Frame3_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = 2 Then PopupMenu frmMain.mnuLegendPopup, 2
End Sub
Private Sub Picture1_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = 2 Then PopupMenu frmMain.mnuLegendPopup, 2
End Sub
Private Sub Label1_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = 2 Then PopupMenu frmMain.mnuLegendPopup, 2
End Sub

