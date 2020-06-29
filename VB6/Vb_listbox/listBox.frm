VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3285
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5235
   LinkTopic       =   "Form1"
   ScaleHeight     =   3285
   ScaleWidth      =   5235
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdCopie 
      Caption         =   "Copie"
      Height          =   375
      Index           =   1
      Left            =   3700
      TabIndex        =   5
      Top             =   600
      Width           =   1215
   End
   Begin VB.CommandButton cmdSupprime 
      Caption         =   "Suppression"
      Height          =   375
      Index           =   0
      Left            =   1900
      TabIndex        =   4
      Top             =   600
      Width           =   1215
   End
   Begin VB.CommandButton cmdTransfert 
      Caption         =   "Transfert->"
      Height          =   375
      Index           =   0
      Left            =   300
      TabIndex        =   3
      Top             =   600
      Width           =   1215
   End
   Begin VB.ListBox lstChoix 
      Height          =   2010
      Index           =   1
      Left            =   2650
      MultiSelect     =   2  'Extended
      TabIndex        =   2
      Top             =   1080
      Width           =   2500
   End
   Begin VB.ListBox lstChoix 
      Height          =   2010
      Index           =   0
      Left            =   100
      MultiSelect     =   2  'Extended
      TabIndex        =   1
      Top             =   1080
      Width           =   2500
   End
   Begin VB.TextBox txtSaisie 
      Height          =   375
      Left            =   100
      TabIndex        =   0
      Top             =   120
      Width           =   5050
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim cpt As Integer
Dim selList As Integer

Private Sub cmdCopie_Click(Index As Integer)
   copier (selList)
End Sub
Private Sub cmdSupprime_Click(Index As Integer)
   supprimer (selList)
End Sub
Private Sub cmdTransfert_Click(Index As Integer)
   transferer (selList)
End Sub

Private Sub lstChoix_Click(Index As Integer)

   selList = Index

End Sub

Private Sub txtSaisie_KeyPress(KeyAscii As Integer)
   
   If KeyAscii = 13 Or KeyAscii = 32 Then
      
      txtSaisie_Validate (False)
   End If
   
  
End Sub
Private Sub txtSaisie_Validate(Cancel As Boolean)

   ' Inséretion des valeur dans la prmière liste
   With lstChoix(0)
      .AddItem (txtSaisie.Text)
      .ItemData(.NewIndex) = cpt
      cpt = cpt + 1
   End With
      
   ' Mise à jour de la textBox de saisie
   txtSaisie.Text = ""
        
End Sub
Sub transferer(numSrce As Integer)
   
   ' Copy des élement séléctionnés
   copier (numSrce)
   
   ' Suppression des items séléctionnés
   supprimer (numSrce)
   
End Sub
Sub copier(numSrce As String)
   Dim numDest As Integer
   Dim numItem As Integer
   
   ' calcul de la déstination
   numDest = (numSrce + 1) Mod 2
   
   'Insértion des éléments de la source séléctionnés dans la déstination
   With lstChoix(numSrce)
   
      For numItem = 0 To .ListCount - 1
         If .Selected(numItem) = True Then
            lstChoix(numDest).AddItem (.List(numItem))
         End If
      Next numItem
      
   End With
   
End Sub
Sub supprimer(numLst As Integer)
   Dim numItem As Integer
   Dim nbrItem As Integer
   
   With lstChoix(numLst)
   
    ' Recherche du nombre d'éléments dans la liste
      nbrItem = .ListCount
      
      'Suppression des éléments séléctionnés
      For numItem = nbrItem - 1 To 0 Step -1
      
         ' Contrôle que l'item soit séléctioné
         If .Selected(numItem) = True Then
         
            ' Suppression de l'élément
            .RemoveItem (numItem)
            
         End If
         
      Next numItem
   
   End With
   
End Sub
Sub test()
   
   Form1.Show
   
End Sub
