Attribute VB_Name = "Module1"
Option Explicit
Const CONV_PERIOD As Integer = 12

Public Function TotalPaid(iLoanLength As Integer) As Double
    Dim intNumPayments As Integer
    Dim dblMonthlyPayment As Double

    'error checking for numeric parameter
    If Not IsNumeric(iLoanLength) Then
        TotalPaid = 0
        Exit Function
    End If
   
    'Calculate the number of payments.
    'use fixed values for now, assume 30 year loan
    
    intNumPayments = iLoanLength * CONV_PERIOD

    'calculate total of all payments
    dblMonthlyPayment = frmMain.MonthlyPayment()
    TotalPaid = dblMonthlyPayment * intNumPayments
End Function

