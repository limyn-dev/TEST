VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "COMCTL32.OCX"
Begin VB.Form frmDebug 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Exercise the Debugger to Exorcise Bugs"
   ClientHeight    =   5025
   ClientLeft      =   1425
   ClientTop       =   1800
   ClientWidth     =   4935
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   5025
   ScaleWidth      =   4935
   Begin VB.CommandButton cmdLogicError 
      Caption         =   "&Fix Logic Error"
      Height          =   375
      Left            =   3120
      TabIndex        =   9
      Top             =   3480
      Width           =   1695
   End
   Begin VB.CommandButton cmdEnd 
      Caption         =   "&End"
      Height          =   375
      Left            =   3120
      TabIndex        =   8
      Top             =   4200
      Width           =   1695
   End
   Begin VB.CommandButton cmdWatch 
      Caption         =   "&Watch Variables"
      Height          =   375
      Left            =   3120
      TabIndex        =   7
      Top             =   3000
      Width           =   1695
   End
   Begin VB.CommandButton cmdCode 
      Caption         =   "&Run Code On The Fly"
      Height          =   375
      Left            =   3120
      TabIndex        =   6
      Top             =   1560
      Width           =   1695
   End
   Begin VB.CommandButton cmdCallStack 
      Caption         =   "Examine Cal&l Stack"
      Height          =   375
      Left            =   3120
      TabIndex        =   5
      Top             =   2520
      Width           =   1695
   End
   Begin VB.PictureBox picOutput 
      AutoRedraw      =   -1  'True
      Height          =   4455
      Left            =   120
      ScaleHeight     =   4395
      ScaleWidth      =   2715
      TabIndex        =   4
      Top             =   120
      Width           =   2775
   End
   Begin VB.CommandButton cmdDebugPrint 
      Caption         =   "Use &Debug.Print"
      Height          =   375
      Left            =   3120
      TabIndex        =   3
      Top             =   2040
      Width           =   1695
   End
   Begin VB.CommandButton cmdExamine 
      Caption         =   "Examine &Variables"
      Height          =   375
      Left            =   3120
      TabIndex        =   2
      Top             =   1080
      Width           =   1695
   End
   Begin VB.CommandButton cmdLogicCalls 
      Caption         =   "Trace With &Calls"
      Height          =   375
      Left            =   3120
      TabIndex        =   1
      Top             =   600
      Width           =   1695
   End
   Begin VB.CommandButton cmdLogic 
      Caption         =   "&Trace"
      Height          =   375
      Left            =   3120
      TabIndex        =   0
      Top             =   120
      Width           =   1695
   End
   Begin ComctlLib.StatusBar stbDirections 
      Align           =   2  'Align Bottom
      Height          =   375
      Left            =   0
      TabIndex        =   10
      Top             =   4650
      Width           =   4935
      _ExtentX        =   8705
      _ExtentY        =   661
      Style           =   1
      SimpleText      =   ""
      _Version        =   327682
      BeginProperty Panels {0713E89E-850A-101B-AFC0-4210102A8DA7} 
         NumPanels       =   1
         BeginProperty Panel1 {0713E89F-850A-101B-AFC0-4210102A8DA7} 
            Key             =   ""
            Object.Tag             =   ""
         EndProperty
      EndProperty
   End
End
Attribute VB_Name = "frmDebug"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Const ROWMAX As Integer = 2
Const COLUMNMAX As Integer = 4

Dim blnHelpIsDisplayed As Boolean

Private Sub cmdCallStack_Click()
    cmdLogicCalls_click
End Sub

Private Sub cmdCallStack_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Not blnHelpIsDisplayed Then
        DisplayHelp "Trace execution to PrintNumber, view calls list."
    End If
End Sub


Private Sub cmdCode_Click()
    Dim X As Double

    'type the following statements into the
    'immediate window
    'x = Sqr(2.0)
    '? x
    'x = x + 1
    '? x
    '? me.height
    'me.height = me.height + 100
    'cmdCode.caption
    'cmdLogic_Click
    'picOutput.cls
    'end
End Sub

Private Sub cmdDebugPrint_Click()
    Dim i As Integer, j As Integer
    
    For i = 1 To ROWMAX
        For j = 1 To COLUMNMAX
            Debug.Print Tab((j - 1) * 5); i * j;
        Next j
        Debug.Print        'Force a new line
    Next i
End Sub

Private Sub cmdEnd_Click()
    Unload Me
End Sub


Private Sub cmdExamine_Click()
    Dim a As Integer
    Dim b As Long
    Dim c As Single
    Dim d As Double
    Dim e As Variant
    
    Dim sum As Double
    
    a = 1
    b = 2
    c = 3
    d = 4
    e = "5"
    
    sum = a + b + c + d + e
    
    MsgBox "The sum of the 5 variables is " & sum
    
End Sub

Private Sub cmdLogic_Click()
    Dim i As Integer
    Dim j As Integer
    
    picOutput.Cls
    For i = 1 To ROWMAX
        For j = 1 To COLUMNMAX
            picOutput.Print Tab((j - 1) * 5); i * j;
        Next j
        picOutput.Print         'force a new line
    Next i
End Sub

Private Sub cmdLogicCalls_click()
    Dim i As Integer
    
    picOutput.Cls
    For i = 1 To ROWMAX
        PrintRow i, COLUMNMAX
    Next i
End Sub

Sub PrintRow(iValue As Integer, jLimit As Integer)
    Dim j As Integer
        
    For j = 1 To jLimit
         PrintNumber (j - 1) * 5, iValue * j
    Next j
    picOutput.Print         'force a new line
End Sub

Sub PrintNumber(position As Integer, number As Integer)
    picOutput.Print Tab(position); number;
End Sub


Private Sub cmdLogicError_Click()
    Dim i As Integer
    
    picOutput.Cls
    For i = 1 To ROWMAX
        PrintLine i, ROWMAX
    Next i

End Sub

Sub PrintLine(iValue As Integer, jLimit As Integer)
    Dim j As Integer
        
    For j = 1 To jLimit
         PrintNumber (j - 1) * 5, iValue * j
    Next j
    picOutput.Print         'force a new line
End Sub

Private Sub cmdWatch_Click()
    Dim strSentence As String, strWord As String
    Dim strDelimiter As String
    Dim intWordlength As Integer
    Dim intOldposition As Integer, intNewPosition As Integer
    
    'The code below extracts the individual words from the strSentence
    'and displays them. For a debugging exercise. make the loop stop
    'when a word of length 6 is found.
    
    strSentence = "The quick brown fox jumped over the lazy dog's back."
    strDelimiter = Chr$(32) 'A space
    intOldposition = 1
     
    picOutput.Cls
    
    'Extract and display all words separated by a space.
    intNewPosition = InStr(intOldposition, strSentence, strDelimiter)
    While intNewPosition <> 0
        intWordlength = intNewPosition - intOldposition
        strWord = Mid(strSentence, intOldposition, intWordlength)
        intOldposition = intNewPosition + 1
        picOutput.Print strWord
        intNewPosition = InStr(intOldposition, strSentence, strDelimiter)
    Wend
    
    'The loop didn't pick up the last word, since it doesn't have
    'a space after it, so this code finishes the job.
    intWordlength = Len(strSentence) + 1 - intOldposition
    strWord = Mid(strSentence, intOldposition, intWordlength)
    picOutput.Print strWord
End Sub

Rem ******** Code in this section pertains to the status bar **********

Sub DisplayHelp(msg As String)
    stbDirections.SimpleText = msg
    blnHelpIsDisplayed = True
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    'If help text is displayed, clear it, and reset the flag.
    If blnHelpIsDisplayed Then
        stbDirections.SimpleText = ""
        blnHelpIsDisplayed = False
    End If
End Sub

Private Sub cmdLogicError_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Not blnHelpIsDisplayed Then
        DisplayHelp "Run a procedure with a logic error."
    End If
End Sub

Private Sub cmdEnd_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Not blnHelpIsDisplayed Then
        DisplayHelp "Terminate the program."
    End If
End Sub

Private Sub cmdWatch_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Not blnHelpIsDisplayed Then
        DisplayHelp "Stop execution when a variable hits a certain value."
    End If
End Sub

Private Sub cmdDebugPrint_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Not blnHelpIsDisplayed Then
        DisplayHelp "Print directly to the Debug window."
    End If
End Sub

Private Sub cmdExamine_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Not blnHelpIsDisplayed Then
        DisplayHelp "Examine and change variables in Debug window."
    End If
End Sub


Private Sub cmdLogicCalls_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Not blnHelpIsDisplayed Then
        DisplayHelp "Step Over a procedure call."
    End If
End Sub

Private Sub cmdLogic_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Not blnHelpIsDisplayed Then
        DisplayHelp "Trace execution of a procedure."
    End If
End Sub

Private Sub cmdCode_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Not blnHelpIsDisplayed Then
        DisplayHelp "Execute code from the Debug window."
    End If
End Sub




