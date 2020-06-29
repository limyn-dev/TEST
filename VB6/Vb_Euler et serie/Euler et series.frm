VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   2004
   ClientLeft      =   48
   ClientTop       =   372
   ClientWidth     =   7488
   LinkTopic       =   "Form1"
   ScaleHeight     =   2004
   ScaleWidth      =   7488
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnPi1 
      Caption         =   "Serie de pi 1"
      Height          =   492
      Left            =   1080
      TabIndex        =   2
      Top             =   1320
      Width           =   5292
   End
   Begin VB.CommandButton btnNbrEuler 
      Caption         =   "Nombre d'Euler"
      Height          =   492
      Left            =   1080
      TabIndex        =   1
      Top             =   720
      Width           =   5292
   End
   Begin VB.TextBox txtResult 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   10.02
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   372
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   7212
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Const STDITER = 100

Private Sub btnNbrEuler_Click()
    Dim nbrIter As Integer
    
    ' Saisie du nombre d'itération
    nbrIter = initIter
    
    ' Calcul et affichage du nombre d'Euler
    txtResult.Text = "Le nombre d'Euler pour une précision de " & CStr(nbrIter) & " est:   " & CStr(nbrEuler(nbrIter))
    
End Sub

Private Sub btnPi1_Click()
    Dim nbrIter As Integer
    
    ' Saisie du nombre d'itération
    nbrIter = initIter
    
    ' Calcul et affichage du nombre pi
    txtResult.Text = "Le nombre pi pour " & CStr(nbrIter) & " itérations est:   " & CStr(pi1(nbrIter))
    
End Sub
Function initIter() As Integer
    Dim result As Integer
    
    result = 0
    
    On Error Resume Next
    result = CInt(txtResult.Text)
    
    If result > 0 Then
        initIter = result
    Else
        initIter = STDITER
    End If
    
End Function
'-------------------------------------------------------------------------
' Déscription:
'   Calcul le nombre d'Euler par fractions continues.
' Input:
'   nbrIter : nombre d'itération pour le calcul du nombre.
'output:
'   Le nombre d'Euler
'=========================================================================
Function nbrEuler(nbrIter As Integer) As Double
    Dim facteurs() As Integer
    Dim i As Integer
    Dim iMax As Integer
    Dim result As Double
    
    ' calcul du vecteur des facteurs
    ReDim facteurs(0)
    facteurs(0) = 2
    iMax = CInt(nbrIter / 3) - 1
    For i = 0 To iMax
        ReDim Preserve facteurs((i + 1) * 3)
        facteurs(3 * i + 1) = 1
        facteurs(3 * i + 2) = 2 * (i + 1)
        facteurs(3 * i + 3) = 1
    Next i
    
    ' Calcul du nombre
    result = 1
    i = nbrIter - 1
    While i >= 0
        result = facteurs(i) + 1 / result
        i = i - 1
    Wend
        
    ' Passage du résultat
    nbrEuler = result
    
End Function

'-------------------------------------------------------------------------
' Déscription:
'   Calcul le nombre pi en un nombre d'itérations donné
' Input:
'   nbrIter : nombre d'itération pour le calcul du nombre.
'output:
'   Le nombre pi
'=========================================================================
Function pi1(nbrIter As Integer) As Double
    Dim i As Integer
    Dim result As Double
    Dim sgnPos As Boolean
    Dim terme As Double
    
    ' Initialisation du résultat
    result = 1
    sgnPos = False
    
    ' Calcul de pi
    For i = 1 To nbrIter
        
        ' Calcul de terme
        terme = 1 / (2 * i + 1)
        
        If sgnPos Then
            result = result + terme
            sgnPos = False
        Else
            result = result - terme
            sgnPos = True
        End If
        
    Next i
    
    ' Retour du résultat
    pi1 = result * 4
    
End Function


