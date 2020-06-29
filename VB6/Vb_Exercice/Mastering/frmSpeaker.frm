VERSION 5.00
Begin VB.Form frmSpeaker 
   Caption         =   "Speaker Control"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdClose 
      Caption         =   "&Close"
      Height          =   495
      Left            =   3600
      TabIndex        =   4
      Top             =   4320
      Width           =   1575
   End
   Begin VB.CheckBox chkMute 
      Height          =   375
      Index           =   0
      Left            =   3240
      TabIndex        =   2
      Top             =   600
      Width           =   495
   End
   Begin VB.HScrollBar hsbVolume 
      Height          =   375
      Index           =   0
      Left            =   360
      TabIndex        =   0
      Top             =   600
      Width           =   2535
   End
   Begin VB.Label lblLevel 
      Caption         =   "Level"
      Height          =   375
      Left            =   4080
      TabIndex        =   6
      Top             =   120
      Width           =   735
   End
   Begin VB.Label lblMute 
      Caption         =   "Mute"
      Height          =   375
      Left            =   3240
      TabIndex        =   5
      Top             =   120
      Width           =   495
   End
   Begin VB.Label lblLevelValue 
      Alignment       =   1  'Right Justify
      Height          =   375
      Index           =   0
      Left            =   4080
      TabIndex        =   3
      Top             =   600
      Width           =   495
   End
   Begin VB.Label lblAdjustVolume 
      Caption         =   "Adjust speaker volume"
      Height          =   255
      Left            =   840
      TabIndex        =   1
      Top             =   120
      Width           =   2175
   End
End
Attribute VB_Name = "frmSpeaker"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private mintMaxSpeakers As Integer

Private Sub chkMute_Click(Index As Integer)
    If chkMute(Index).Value = vbChecked Then
        hsbVolume(Index).Enabled = False
        lblLevelValue(Index).Caption = "0"
    Else
        hsbVolume(Index).Enabled = True
        lblLevelValue(Index).Caption = hsbVolume(Index).Value
    End If
    
End Sub

Private Sub cmdClose_Click()
    Unload Me
End Sub

Private Sub Form_Load()
    Dim intIndex As Integer
    Dim intPrevious As Integer
    mintMaxSpeakers = 0
    mintMaxSpeakers = InputBox("Control how many speakers")
    
    If mintMaxSpeakers > 4 Then
        MsgBox "Sorry, 4 speakers only"
        mintMaxSpeakers = 4
    End If
    
        lblLevelValue(0).Caption = 0
        
    For intIndex = 1 To (mintMaxSpeakers)
        intPrevious = intIndex - 1
        Load hsbVolume(intIndex)
        Load chkMute(intIndex)
        Load lblLevelValue(intIndex)
        hsbVolume(intIndex).Top = hsbVolume(intPrevious).Top + 400
        chkMute(intIndex).Top = chkMute(intPrevious).Top + 400
        lblLevelValue(intIndex).Top = lblLevelValue(intPrevious).Top + 400
        hsbVolume(intIndex).Visible = True
        chkMute(intIndex).Visible = True
        lblLevelValue(intIndex).Visible = True
    Next intIndex

End Sub

Private Sub hsbVolume_Change(Index As Integer)
    lblLevelValue(Index).Caption = hsbVolume(Index).Value
End Sub
