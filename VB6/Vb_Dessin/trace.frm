VERSION 5.00
Begin VB.Form frmDessine 
   Caption         =   "Form1"
   ClientHeight    =   4035
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6720
   LinkTopic       =   "Form1"
   ScaleHeight     =   4035
   ScaleWidth      =   6720
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdDessine 
      Caption         =   "Dessine"
      Height          =   495
      Left            =   240
      TabIndex        =   1
      Top             =   120
      Width           =   1455
   End
   Begin VB.PictureBox pbxAffiche 
      Height          =   3495
      Left            =   240
      ScaleHeight     =   3435
      ScaleWidth      =   4635
      TabIndex        =   0
      Top             =   840
      Width           =   4695
   End
End
Attribute VB_Name = "frmDessine"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Taille de la fenêtre d'affichage
Const XMAX = 8000
Const YMAX = 8000

' Position de la fenêtre d'affichage dans la frame
Const largCadre = 500
Const zoneBttn = 600

' Couleures des courbes
Const coulCourbe = 0
Const coulAxes = 5

Private Sub cmdDessine_Click()
    Dim x As Double
    Dim y As Double
    Dim pi As Double
    
    pi = 3.14159

    ' Tracage de la courbe
    For x = 1 To XMAX
        
        ' calcul de la valeur de y
        y = Sin(x / XMAX * 2 * pi)
        
        ' contrage dans la fenêtre
        y = y * YMAX / 2 + YMAX / 2
        
        'Affichage du point
        pbxAffiche.PSet (Fix(x), Fix(y)), QBColor(coulCourbe)
        
    Next x
        
End Sub

Private Sub Form_Activate()
  
  ' Dessins des axes
    Call dessineAxes
    
End Sub

Private Sub Form_Load()

    ' Dimentionement de la frame
    frmDessine.Height = YMAX + 2 * largCadre + zoneBttn
    frmDessine.Width = XMAX + 2 * largCadre
    
    ' Dimentionement de la forme de l'image
    pbxAffiche.Height = YMAX
    pbxAffiche.Width = XMAX
    pbxAffiche.Left = CInt(largCadre / 2)
    pbxAffiche.Top = CInt(largCadre / 2) + zoneBttn
    
End Sub

Sub dessineAxes()
    Dim i As Integer
    
    
    ' Absis horizontal
    For i = 1 To XMAX
        pbxAffiche.PSet (i, Fix(YMAX / 2)), QBColor(coulAxes)
    Next i
    
    ' Absis vertical
    For i = 1 To YMAX
        pbxAffiche.PSet (Fix(XMAX / 2), i), QBColor(coulAxes)
    Next i
    
End Sub
