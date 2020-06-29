VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   4140
   ClientLeft      =   2295
   ClientTop       =   1800
   ClientWidth     =   6645
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   4140
   ScaleWidth      =   6645
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
    Prompt = "Tapez une température Fahrenheit."
    Do
        Ftemp = InputBox(Prompt, "Fahrenheit vers Celsius")
        If Ftemp <> "" Then
            Celsius = Int((Ftemp + 40) * 5 / 9 - 40)
            MsgBox (Celsius), , "Température en Celsius"
        End If
    Loop While Ftemp <> ""
    End
End Sub


