VERSION 5.00
Begin VB.Form Form1 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Départ"
   ClientHeight    =   3720
   ClientLeft      =   1515
   ClientTop       =   1890
   ClientWidth     =   6735
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   8.25
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   3720
   ScaleWidth      =   6735
   Begin VB.Timer Timer2 
      Enabled         =   0   'False
      Interval        =   250
      Left            =   840
      Top             =   3240
   End
   Begin VB.PictureBox Picture4 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   480
      Left            =   2160
      Picture         =   "Depart.frx":0000
      ScaleHeight     =   480
      ScaleWidth      =   480
      TabIndex        =   7
      Top             =   2640
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.PictureBox Picture3 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   480
      Left            =   2160
      Picture         =   "Depart.frx":030A
      ScaleHeight     =   480
      ScaleWidth      =   480
      TabIndex        =   6
      Top             =   3120
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.PictureBox Picture2 
      Appearance      =   0  'Flat
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   480
      Left            =   5880
      Picture         =   "Depart.frx":0614
      ScaleHeight     =   480
      ScaleWidth      =   480
      TabIndex        =   5
      Top             =   1080
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   200
      Left            =   240
      Top             =   3240
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Fin"
      Height          =   495
      Left            =   120
      TabIndex        =   3
      Top             =   2520
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Début"
      Height          =   495
      Left            =   120
      TabIndex        =   2
      Top             =   1680
      Width           =   1215
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      FillStyle       =   0  'Solid
      ForeColor       =   &H80000008&
      Height          =   1815
      Left            =   4440
      Picture         =   "Depart.frx":091E
      ScaleHeight     =   1815
      ScaleWidth      =   2175
      TabIndex        =   0
      Top             =   1800
      Width           =   2175
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "par étapes"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   720
      TabIndex        =   8
      Top             =   1200
      Width           =   5175
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "Bienvenue à"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00800000&
      Height          =   615
      Left            =   1080
      TabIndex        =   4
      Top             =   240
      Width           =   4455
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      BackStyle       =   0  'Transparent
      Caption         =   "Microsoft Visual Basic 5"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   375
      Left            =   120
      TabIndex        =   1
      Top             =   720
      Width           =   6255
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
    Picture2.Visible = True
    Timer1.Enabled = True
End Sub

Private Sub Command2_Click()
    End
End Sub


Private Sub Timer1_Timer()

If bounces < 5 Then        'depending on bounces, we'll
    If (bounces Mod 2 = 0) Then    'fall down
        Picture2.Move Picture2.Left - 530, Picture2.Top + 900
        Beep
        bounces = bounces + 1
    Else                           'bounce up
        Picture2.Move Picture2.Left - 530, Picture2.Top - 320
        bounces = bounces + 1
    End If
Else                               'slide across bottom
  Picture2.Move Picture2.Left - 530, Picture2.Top
  bounces = bounces + 1
End If
                    ' after bouncing start smoke cloud
If bounces = 7 Then
    Picture2.Visible = False
    Picture3.Visible = True
    Picture4.Visible = True
    Timer1.Enabled = False
    Command1.Enabled = False
    Timer2.Enabled = True  ' see Timer2_Timer for cloud
    bounces = 0
End If

End Sub

Private Sub Timer2_Timer()

If bounces < 7 Then
    Picture4.Move Picture4.Left + 400, Picture4.Top - 500
    bounces = bounces + 1
Else
    Timer2.Enabled = False
End If

End Sub

