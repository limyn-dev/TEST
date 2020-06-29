VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.ComboBox cmbAfficheMot 
      Height          =   315
      Left            =   960
      TabIndex        =   2
      Text            =   "Combo1"
      Top             =   2040
      Width           =   2775
   End
   Begin VB.CommandButton cmdExecute 
      Caption         =   "recherche des mots"
      Height          =   375
      Left            =   720
      TabIndex        =   1
      Top             =   1200
      Width           =   1935
   End
   Begin VB.TextBox txtSaisie 
      Height          =   495
      Left            =   600
      MultiLine       =   -1  'True
      TabIndex        =   0
      Top             =   360
      Width           =   3735
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub cmdExecute_Click()
    Dim tblMots() As String
    Dim nbrMot As Integer
    Dim posEsp As Integer
        
    ' Remplissage de la table des mots
    nbrMot = 0
    With txtSaisie
        While Len(.Text) > 1
            
            ' Redimentionement de la table
            nbrMot = nbrMot + 1
            ReDim Preserve tblMots(nbrMot)
            
            ' Recherche de l'éspace suivant
            posEsp = prmEsp(.Text)
            
            ' Saisie du mot
            tblMots(nbrMot) = Left(.Text, posEsp)
            
            ' Redimentionement de la chaine
            .Text = Right(.Text, Len(.Text) - posEsp)
        Wend
    End With
    
    ' Affichage de la table des mots
    cmbAfficheMot.Clear
    While nbrMot > 0
        cmbAfficheMot.AddItem (tblMots(nbrMot))
        'txtSaisie.Text = txtSaisie.Text & "$" & tblMots(nbrMot)
        nbrMot = nbrMot - 1
    Wend
    
End Sub
'-------------------------------------------------------------------------
' Déscription:
'
' Input:
'
' Output:
'
'=========================================================================
Function prmEsp(chaine As String) As Integer
    Dim numCar As Integer
    Dim fin As Boolean
    Dim result As Integer
    
    ' Parcourt de la chaine à la recherche d'un espace
    numCar = 1
    fin = False
    While Not fin And numCar < Len(chaine)
        If Mid(chaine, numCar, 1) = " " Then
            fin = True
        Else
            numCar = numCar + 1
        End If
    Wend
    
    prmEsp = numCar
   
End Function

