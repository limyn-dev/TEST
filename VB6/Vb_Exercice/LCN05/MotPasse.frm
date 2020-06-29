VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3990
   ClientLeft      =   1095
   ClientTop       =   1515
   ClientWidth     =   7365
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   3990
   ScaleWidth      =   7365
   Begin VB.CommandButton Command1 
      Caption         =   "Connexion"
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   240
      Width           =   1215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()
    UserName = InputBox("Tapez votre nom.")
    Pass = InputBox("Tapez votre mot de passe.")
    If UserName = "Laura" And Pass = "17Mai" Then
        MsgBox ("Bonjour, Laura! Nous sommes prêts!")
        Form1.Picture = _
          LoadPicture("c:\Vb\Exercices\Lcn05\pcomputr.wmf")
    ElseIf UserName = "Marc" And Pass = "KX182" Then
        MsgBox ("Bonjour, Marc! Le fichier est disponible !")
        Form1.Picture = _
          LoadPicture("c:\Vb\Exercices\Lcn05\rolodex.wmf")
    Else
        MsgBox ("Désolé ! Je ne vous connais pas.")
        End   ' Quitter le programme
    End If
End Sub

