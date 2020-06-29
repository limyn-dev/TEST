VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3192
   ClientLeft      =   60
   ClientTop       =   348
   ClientWidth     =   3936
   LinkTopic       =   "Form1"
   ScaleHeight     =   3192
   ScaleWidth      =   3936
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtLocalite 
      Height          =   375
      Left            =   1000
      TabIndex        =   7
      Top             =   1700
      Width           =   2535
   End
   Begin VB.TextBox txtAdresse 
      Height          =   375
      Left            =   1000
      TabIndex        =   2
      Top             =   1200
      Width           =   2535
   End
   Begin VB.TextBox txtPrenom 
      Height          =   375
      Left            =   1000
      TabIndex        =   1
      Top             =   720
      Width           =   2535
   End
   Begin VB.TextBox txtNom 
      Height          =   375
      Left            =   1000
      TabIndex        =   0
      Top             =   200
      Width           =   2535
   End
   Begin VB.Label lblLocalite 
      Caption         =   "Localité"
      Height          =   255
      Left            =   200
      TabIndex        =   6
      Top             =   1700
      Width           =   975
   End
   Begin VB.Label lblAdresse 
      Caption         =   "Adresse"
      Height          =   255
      Left            =   200
      TabIndex        =   5
      Top             =   1200
      Width           =   975
   End
   Begin VB.Label lblPrenom 
      Caption         =   "Prénom"
      Height          =   255
      Left            =   200
      TabIndex        =   4
      Top             =   700
      Width           =   975
   End
   Begin VB.Label lblNom 
      Caption         =   "Nom"
      Height          =   255
      Left            =   200
      TabIndex        =   3
      Top             =   200
      Width           =   975
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


'------------------------------------------------------------------------------
' Lors de la receprion du focus sur les textBox
'==============================================================================
Private Sub txtNom_GotFocus()
    Call txtBoxIni(txtNom)
End Sub
Private Sub txtPrenom_GotFocus()
    Call txtBoxIni(txtPrenom)
End Sub
Private Sub txtAdresse_GotFocus()
    Call txtBoxIni(txtAdresse)
End Sub
Private Sub txtLocalite_GotFocus()
    Call txtBoxIni(txtLocalite)
End Sub



'------------------------------------------------------------------------------
' Après la perte du focus sur une textbox
'==============================================================================
Private Sub txtNom_LostFocus()
    txtNom.Text = traiteStr(txtNom.Text)
End Sub
Private Sub txtPrenom_LostFocus()
    txtPrenom.Text = traiteStr(txtPrenom.Text)
End Sub
Private Sub txtAdresse_LostFocus()
    txtAdresse.Text = traiteStr(txtAdresse.Text)
End Sub
Private Sub txtLocalite_LostFocus()
    txtLocalite.Text = traiteStr(txtLocalite.Text)
End Sub


'------------------------------------------------------------------------------
' Déscription:
'    Prépare une text box de saisie lors de la reception du focus
' Input:
'   txtBox : adresse de la textBox utilisée
' Output:
'   Texte de la texte box séléctionné
'==============================================================================
Private Sub txtBoxIni(txtBox As TextBox)

    txtBox.SelStart = 0
    txtBox.SelLength = Len(txtBox.Text)
    
End Sub

'------------------------------------------------------------------------------
' Déscription:
'   Suppression des éspaces superflux et mise en majuscule de la première lettre
'   de chaque mot
' Input:
'   chaine : la chaine à traité
' Output:
'   La chaine traitée
'==============================================================================
Function traiteStr(ByVal chaine As String) As String
    Dim result As String
    Dim lngStr As Integer
    Dim debMot As Integer
    Dim i As Integer
    
    
    lngStr = Len(chaine)
    i = 1
    debMot = 0
    
    ' Recherche du début du premier mot
    While i < lngStr And Mid(chaine, i, 1) = " "
        i = i + 1
    Wend
    debMot = i
    
    ' Recherche de la fin du premier mot
    While i < lngStr And Mid(chaine, i, 1) <> " "
        i = i + 1
    Wend
    
    ' Controle si la chaine est une suite d'éspaces
    If debMot < lngStr Then
        
        ' Suppression des éspaces
        result = Mid(chaine, debMot, i - debMot + 1)
        
        ' Mise en majuscule de la première lettre du mot
        result = UCase(Left(result, 1)) & LCase(Right(result, Len(result) - 1))
        
        ' contrôle si la chaine se términe par des caractères ou par des éspaces
        If i < lngStr Then
            
            ' traite la fin de la phrase
             result = result & traiteStr(Right(chaine, Len(chaine) - i))

        End If
        
    Else
        
        ' supprime les éspace de la chaine
        result = ""
        
    End If
    
    ' sortie du résultat
    traiteStr = result
    
End Function

Private Sub ttst()

    chaine = traiteStr("mot1   mot2 mopt34    asgd ")
    
End Sub


