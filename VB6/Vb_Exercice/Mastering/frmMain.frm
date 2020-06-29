VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmMain 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Load Payment Estimate"
   ClientHeight    =   4110
   ClientLeft      =   45
   ClientTop       =   615
   ClientWidth     =   6285
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   4110
   ScaleWidth      =   6285
   StartUpPosition =   2  'CenterScreen
   Begin MSComctlLib.Toolbar tlbLoan 
      Align           =   1  'Align Top
      Height          =   360
      Left            =   0
      TabIndex        =   14
      Top             =   0
      Width           =   6285
      _ExtentX        =   11086
      _ExtentY        =   635
      ButtonWidth     =   609
      Appearance      =   1
      Style           =   1
      ImageList       =   "imgLoan"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   2
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Exit"
            Description     =   "Exit button"
            Object.ToolTipText     =   "Exit"
            ImageIndex      =   1
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Month"
            Description     =   "monthly Payment button"
            Object.ToolTipText     =   "Monthly payment"
            ImageIndex      =   2
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ImageList imgLoan 
      Left            =   360
      Top             =   3480
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   2
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":0000
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":010C
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.StatusBar sbrLoan 
      Align           =   2  'Align Bottom
      Height          =   255
      Left            =   0
      TabIndex        =   13
      Top             =   3855
      Width           =   6285
      _ExtentX        =   11086
      _ExtentY        =   450
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   2
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   1
            Object.Width           =   8467
            Key             =   "msg"
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   5
            Alignment       =   1
            AutoSize        =   2
            TextSave        =   "17:56"
            Key             =   "time"
         EndProperty
      EndProperty
   End
   Begin VB.CommandButton cmdOtherApp1 
      Caption         =   "&Other Applications"
      Height          =   375
      Left            =   3000
      TabIndex        =   12
      Top             =   2160
      Width           =   1575
   End
   Begin VB.CommandButton cmdSummary 
      Caption         =   "&Summary"
      Height          =   375
      Left            =   3000
      TabIndex        =   11
      Top             =   1560
      Width           =   1575
   End
   Begin VB.Frame fraTerm 
      Caption         =   "Loan Term"
      Height          =   1095
      Left            =   360
      TabIndex        =   7
      Top             =   1560
      Width           =   2055
      Begin VB.OptionButton optLength 
         Caption         =   "&30 Years"
         Height          =   195
         Index           =   2
         Left            =   360
         TabIndex        =   10
         Top             =   840
         Width           =   1575
      End
      Begin VB.OptionButton optLength 
         Caption         =   "&15 Years"
         Height          =   195
         Index           =   1
         Left            =   360
         TabIndex        =   9
         Top             =   600
         Width           =   1575
      End
      Begin VB.OptionButton optLength 
         Caption         =   "&5 Years"
         Height          =   195
         Index           =   0
         Left            =   360
         TabIndex        =   8
         Top             =   360
         Width           =   1575
      End
   End
   Begin VB.ComboBox cboRate 
      Height          =   315
      ItemData        =   "frmMain.frx":0220
      Left            =   1680
      List            =   "frmMain.frx":0236
      TabIndex        =   5
      Text            =   "Combo1"
      Top             =   960
      Width           =   1215
   End
   Begin VB.CommandButton cmdTotal 
      Caption         =   "&Total Paid"
      Height          =   375
      Left            =   3000
      TabIndex        =   4
      Top             =   960
      Width           =   1575
   End
   Begin VB.CommandButton cmdMonthly 
      Caption         =   "&Monthly Payment"
      Height          =   375
      Left            =   3000
      TabIndex        =   3
      Top             =   360
      Width           =   1575
   End
   Begin VB.TextBox txtPurchase 
      Height          =   405
      Left            =   1680
      TabIndex        =   0
      Top             =   360
      Width           =   1215
   End
   Begin VB.CommandButton cmdDone 
      Cancel          =   -1  'True
      Caption         =   "Done"
      Height          =   375
      Left            =   3000
      TabIndex        =   1
      Top             =   2640
      Width           =   1575
   End
   Begin VB.Label lblInteret 
      Caption         =   "I&nterest rate"
      Height          =   255
      Left            =   360
      TabIndex        =   6
      Top             =   960
      Width           =   1215
   End
   Begin VB.Label lblPrice 
      Caption         =   "&Purchase Price"
      Height          =   255
      Left            =   360
      TabIndex        =   2
      Top             =   480
      Width           =   1095
   End
   Begin VB.Menu mnuFile 
      Caption         =   "&File"
      Begin VB.Menu mnuFileExit 
         Caption         =   "E&xit"
      End
   End
   Begin VB.Menu mnuLoan 
      Caption         =   "&Loan"
      Begin VB.Menu mnuLoanMonthly 
         Caption         =   "&Monthly Payment"
         Shortcut        =   ^M
      End
      Begin VB.Menu mnuLoanTotal 
         Caption         =   "&Total Paid"
         Shortcut        =   ^T
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim mintLength As Integer

Private Sub cmdDone_Click()
    Unload frmMain
End Sub

Private Sub Command1_Click()

End Sub

Private Sub cmdMonthly_Click()
    Dim dblmonthly     As Double
    dblmonthly = MonthlyPayment()
    MsgBox "Your monthly payments will be: " _
    & Format(dblmonthly, "currency")
End Sub

Private Sub cmdOtherApp1_Click()
    Dim strAppName As String
    
    On Error Resume Next
    strAppName = InputBox("To run the calculator type 'calc'." _
                & "To run Notepad type 'notepad'.")
   ' Shell strAppName, vbNormalFocus
    If RunApp(strAppName) = False Then
        MsgBox "Unable to find " & strAppName _
               & vbCrLf & "Run-Time Error. Number " _
                & Err.Number
        Err.Clear
    End If
                
End Sub

Private Sub cmdSummary_Click()
Dim dblRate          As Double
Dim dblTotal         As Double

dblTotal = TotalPaid(mintLength)
dblRate = CDbl(cboRate.Text)
MsgBox "You are borrowing " & Format(dblTotal, "currency") _
        & " for " & mintLength _
        & " under a " & dblRate & " loan"
End Sub

Private Sub cmdTotal_Click()
    Dim dblTotal As Double
    dblTotal = TotalPaid(mintLength)
    MsgBox "The total you will pay will be : " _
    & Format(dblTotal, "currency")
End Sub

Private Sub Form_Load()
    txtPurchase.Text = 0#
    cboRate.Text = 4.25
    optLength(0).Value = True
    frmLogon.Show vbModal
End Sub

Private Sub Form_Unload(Cancel As Integer)
    Dim iAnswer As Integer
    
    iAnswer = MsgBox("Are you sure you're done ?", vbYesNo)
    If iAnswer = vbNo Then
        Cancel = True
    Else
        End
    End If
End Sub

Public Function MonthlyPayment() As Double
    Dim dblMonthrate     As Double
    Dim intNumPayments   As Integer
    Dim dblLoanAmt       As Double
    Dim dblRate          As Double
    Dim dblmonthly       As Double

    Const CONV_PERIOD As Integer = 12
    
    On Error GoTo ErrHandler
    
    dblRate = CDbl(cboRate.Text) / 100
    dblLoanAmt = CDbl(txtPurchase.Text)
    intNumPayments = mintLength * CONV_PERIOD
    dblMonthrate = dblRate / CONV_PERIOD
    MonthlyPayment = Pmt(Rate:=dblMonthrate, _
                    NPer:=intNumPayments, PV:=-dblLoanAmt)
    sbrLoan.Panels("msg").Text = "Monthly payment : " _
                                & Format(MonthlyPayment, "currency")
    Exit Function
ErrHandler:
    If Err.Number = 13 Then
        MsgBox ("Entrez vos données, S.V.P")

    Else
        Resume Next
    End If
End Function

Private Sub mnuFileExit_Click()
    Unload frmMain
End Sub

Private Sub mnuLoanMonthly_Click()
    ShowMonthly
End Sub

Private Sub mnuLoanTotal_Click()
    ShowTotal
End Sub

Private Sub optLength_Click(Index As Integer)
    Select Case Index
        Case 0
            mintLength = 5
        Case 1
            mintLength = 15
        Case 2
            mintLength = 30
    End Select
End Sub
Public Function RunApp(strAppName As String) As Boolean
    Dim intErrNumber   As Integer
    On Error GoTo ErrHandler
    
    Shell strAppName, vbNormalFocus
    
    Exit Function
ErrHandler:
       ' intErrNumber = Err.Number
        RunApp = False
        'Err.Raise intErrNumber
        Err.Raise Err.Number
End Function

Private Sub ShowMonthly()
    Dim dblmonthly     As Double
    dblmonthly = MonthlyPayment()
 '   MsgBox "Your monthly payments will be: " _
 '   & Format(dblMonthly, "currency")
    sbrLoan.Panels("msg").Text = "Numeric value required"
End Sub

Private Sub ShowTotal()
    Dim dblTotal As Double
    dblTotal = TotalPaid(mintLength)
    MsgBox "The total you will pay will be : " _
    & Format(dblTotal, "currency")
End Sub

Private Sub StatusBar1_PanelClick(ByVal Panel As MSComctlLib.Panel)

End Sub

Private Sub tlbLoan_ButtonClick(ByVal Button As MSComctlLib.Button)
    Select Case Button.Key
        Case "Month"
            ShowMonthly
        Case "Exit"
            Unload frmMain
    End Select
End Sub
