VERSION 5.00
Begin VB.Form frmMain 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Loan Payment Estimate"
   ClientHeight    =   1695
   ClientLeft      =   2130
   ClientTop       =   2070
   ClientWidth     =   5460
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   1695
   ScaleWidth      =   5460
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdDone 
      Cancel          =   -1  'True
      Caption         =   "&Done"
      Height          =   375
      Left            =   3840
      TabIndex        =   5
      Top             =   1200
      Width           =   1455
   End
   Begin VB.CommandButton cmdTotal 
      Caption         =   "&Total Paid"
      Height          =   375
      Left            =   3840
      TabIndex        =   4
      Top             =   600
      Width           =   1455
   End
   Begin VB.CommandButton cmdMonthly 
      Caption         =   "&Monthly Payment"
      Height          =   375
      Left            =   3840
      TabIndex        =   3
      Top             =   120
      Width           =   1455
   End
   Begin VB.TextBox txtPurchase 
      Alignment       =   1  'Right Justify
      Height          =   285
      Left            =   1680
      TabIndex        =   1
      Text            =   "0.00"
      Top             =   120
      Width           =   1815
   End
   Begin VB.Label Label3 
      Caption         =   "Assuming 30 years at 6.5% interest."
      Height          =   375
      Left            =   240
      TabIndex        =   2
      Top             =   600
      Width           =   3255
   End
   Begin VB.Label Label1 
      Caption         =   "&Purchase Price     $"
      Height          =   255
      Left            =   240
      TabIndex        =   0
      Top             =   120
      Width           =   1455
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Const CONV_PERIOD As Integer = 12
Const PASSWORD As String = "password"

Private Sub cmdDone_Click()
    Unload frmMain
End Sub

Private Sub cmdMonthly_Click()
    Dim dblMonthly As Double
    dblMonthly = MonthlyPayment()
    MsgBox "Your monthly payments will be: " & Format(dblMonthly, "currency")
End Sub


Private Sub cmdTotal_Click()
   Dim dblTotal As Double
   dblTotal = TotalPaid(30)
   MsgBox "The total you will pay will be: " & Format(dblTotal, "currency")
End Sub

Public Function MonthlyPayment() As Double
    Dim dblMonthRate As Double
    Dim intNumPayments As Integer
    Dim dblLoanAmt As Double

    'convert the purchase price to a Double value
    dblLoanAmt = CDbl(txtPurchase.Text)

    'Calculate the number of payments and the monthly
    'interest rate, assume 30 years at 6.5%
    intNumPayments = 30 * CONV_PERIOD
    dblMonthRate = 0.065 / CONV_PERIOD

    'calculate monthly payment
    MonthlyPayment = Pmt(Rate:=dblMonthRate, NPer:=intNumPayments, PV:=-dblLoanAmt)
End Function

Private Sub Form_Load()
    Const MAX_LOGON_ATTEMPTS As Integer = 3
    Static sintLogonAttempts As Integer

    frmLogon.Show vbModal

    Do Until frmLogon.txtPassword.Text = PASSWORD
        sintLogonAttempts = sintLogonAttempts + 1
        
        If frmLogon.gblnCancel = True Then
            End
        End If
        
        If sintLogonAttempts < MAX_LOGON_ATTEMPTS Then
            MsgBox prompt:="You have typed an invalid password.", _
                buttons:=vbOKOnly + vbInformation
            frmLogon.txtPassword.Text = ""
            frmLogon.Show vbModal
        Else
            MsgBox prompt:="Too many invalid logon attempts. Good-bye.", _
                buttons:=vbOKOnly + vbExclamation
            End
        End If
    Loop

End Sub

Private Sub Form_Unload(Cancel As Integer)
    Dim iAnswer As Integer
    iAnswer = MsgBox("Are you sure you're done?", vbYesNo)
    If iAnswer = vbNo Then
        Cancel = True
    Else
        End
    End If
End Sub
