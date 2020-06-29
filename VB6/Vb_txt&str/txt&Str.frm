VERSION 5.00
Begin VB.Form frmMenu 
   Caption         =   "Test txt"
   ClientHeight    =   3672
   ClientLeft      =   60
   ClientTop       =   348
   ClientWidth     =   3600
   LinkTopic       =   "Form1"
   Picture         =   "txt&Str.frx":0000
   ScaleHeight     =   3672
   ScaleWidth      =   3600
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame fraFctStd 
      Caption         =   "Fonctions standartd"
      Height          =   3372
      Left            =   120
      TabIndex        =   0
      Top             =   75
      Width           =   3255
      Begin VB.OptionButton optChoisirFct 
         Height          =   375
         Index           =   6
         Left            =   100
         TabIndex        =   8
         Top             =   2450
         Width           =   3000
      End
      Begin VB.OptionButton optChoisirFct 
         Height          =   375
         Index           =   5
         Left            =   100
         TabIndex        =   7
         Top             =   2075
         Width           =   3000
      End
      Begin VB.OptionButton optChoisirFct 
         Caption         =   "delDblEsp(string)"
         Height          =   375
         Index           =   4
         Left            =   100
         TabIndex        =   6
         Top             =   1700
         Width           =   3000
      End
      Begin VB.OptionButton optChoisirFct 
         Caption         =   "Mid(string, start[, length])"
         Height          =   375
         Index           =   3
         Left            =   100
         TabIndex        =   5
         Top             =   1325
         Width           =   3000
      End
      Begin VB.OptionButton optChoisirFct 
         Caption         =   "StrConv(string, conversion, LCID)"
         Height          =   375
         Index           =   2
         Left            =   100
         TabIndex        =   4
         Top             =   950
         Width           =   3000
      End
      Begin VB.OptionButton optChoisirFct 
         Caption         =   "StrComp(string1, string2[, compare])"
         Height          =   375
         Index           =   1
         Left            =   100
         TabIndex        =   3
         Top             =   575
         Width           =   3000
      End
      Begin VB.OptionButton optChoisirFct 
         Caption         =   "Str(number)"
         Height          =   375
         Index           =   0
         Left            =   100
         TabIndex        =   2
         Top             =   200
         Width           =   3000
      End
      Begin VB.CommandButton cmdTesterFct 
         Caption         =   "executer"
         Height          =   375
         Left            =   100
         TabIndex        =   1
         Top             =   2825
         Width           =   3000
      End
   End
End
Attribute VB_Name = "frmMenu"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

' Caractère de fin de chaines
Const CR = 13
Const LF = 10

' Valeur de la fonction choisie
Public fctSelect As Integer

Private Sub cmdTesterFct_Click()

   Call choisirFct

End Sub

Private Sub optChoisirFct_Click(Index As Integer)

   fctSelect = Index
   
End Sub

Public Sub choisirFct()
     
   ' Sélection de la fonction à tester
   Select Case fctSelect
      
      Case 0
         ' Dimentionnement de la forme
         Call frmFctStr.Dimentionner(11, 0)
         ' Préparation des txtBoxs et labels de saisie
         With frmFctStr
            .lblSaisie(1).Caption = "Nombre:"
            .lblSaisie(2).Caption = "str(CBool())"
            .lblSaisie(3).Caption = "str(CByte())"
            .lblSaisie(4).Caption = "str(CInt())"
            .lblSaisie(5).Caption = "str(CLng())"
            .lblSaisie(6).Caption = "str(CSng())"
            .lblSaisie(7).Caption = "str(CDbl())"
            .lblSaisie(8).Caption = "str(CCur())"
            .lblSaisie(9).Caption = "str(CDec())"
            .lblSaisie(10).Caption = "str(CDate())"
            .lblSaisie(11).Caption = "str(CVar())"
         End With
         
      Case 2
         ' Dimentionnement de la forme
         Call frmFctStr.Dimentionner(4, 5)
         ' Préparation des txtBoxs et labels de saisie
         With frmFctStr
            .lblSaisie(1).Caption = "Chaine"
            .lblSaisie(2).Caption = "Convertion"
            .lblSaisie(3).Caption = "CLID"
            .lblSaisie(4).Caption = "strConv(chaine, convertion, CLID)"
         End With
         ' Information sur la fonction
         With frmFctStr.txtInfo
            .Text = .Text & "Convertion" & Chr(CR) & Chr(LF)
            .Text = .Text & "  vbUpperCase:" & vbTab & "1" & Chr(CR) & Chr(LF)
            .Text = .Text & "  vbLowerCase:" & vbTab & "2" & Chr(CR) & Chr(LF)
            .Text = .Text & "  vbProperCase:" & vbTab & "3" & Chr(CR) & Chr(LF)
            .Text = .Text & "  vbUnicode:" & vbTab & "64" & Chr(CR) & Chr(LF)
            .Text = .Text & "  vbFromUnicode:" & vbTab & "128" & Chr(CR) & Chr(LF)
            .Height = 400
         End With
   
      Case 3
         ' Dimentionnement de la forme
         Call frmFctStr.Dimentionner(4, 0)
         ' Préparation des txtBoxs et labels de saisie
         With frmFctStr
            .lblSaisie(1).Caption = "Chaine"
            .lblSaisie(2).Caption = "Position"
            .lblSaisie(3).Caption = "Longueur"
            .lblSaisie(4).Caption = "mid(chaine, position, longueur)"
         End With
         
      Case 4
         ' Dimentionnement de la forme
         Call frmFctStr.Dimentionner(2, 0)
         ' Préparation des txtBoxs et labels de saisie
         With frmFctStr
            .lblSaisie(1).Caption = "Chaine avec doublon d'éspace"
            .lblSaisie(2).Caption = "Chaine sans doublon d'éspace"
         End With
         
   End Select
   
   ' Affichage de la form des fonctions de chaines
   frmFctStr.Show
   
End Sub

Public Sub executerFct()
   
   ' Execution du test de la fonction choisie
   Select Case fctSelect
   
      Case 0
         With frmFctStr
            Call .initTxtBox(2)
            On Error Resume Next
            .txtSaisie(2).Text = str(CBool(.txtSaisie(1).Text))
            On Error Resume Next
            .txtSaisie(3).Text = str(CByte(.txtSaisie(1).Text))
            On Error Resume Next
            .txtSaisie(4).Text = str(CInt(.txtSaisie(1).Text))
            On Error Resume Next
            .txtSaisie(5).Text = str(CLng(.txtSaisie(1).Text))
            On Error Resume Next
            .txtSaisie(6).Text = str(CSng(.txtSaisie(1).Text))
            On Error Resume Next
            .txtSaisie(7).Text = str(CDbl(.txtSaisie(1).Text))
            On Error Resume Next
            .txtSaisie(8).Text = str(CCur(.txtSaisie(1).Text))
            On Error Resume Next
            .txtSaisie(9).Text = str(CDec(.txtSaisie(1).Text))
            On Error Resume Next
            .txtSaisie(10).Text = str(CDate(.txtSaisie(1).Text))
            On Error Resume Next
            .txtSaisie(11).Text = str(CVar(.txtSaisie(1).Text))
         End With
         
      Case 2
         With frmFctStr
            On Error Resume Next
            .txtSaisie(4).Text = StrConv(.txtSaisie(1).Text, CInt(.txtSaisie(2).Text), CLng(.txtSaisie(3).Text))
         End With
         
      Case 3
         With frmFctStr
            On Error Resume Next
            .txtSaisie(4).Text = Mid(.txtSaisie(1).Text, CLng(.txtSaisie(2).Text), CLng(.txtSaisie(3).Text))
         End With
         
      Case 4
         With frmFctStr
            .txtSaisie(2).Text = fonctionsStr.delDblEsp(.txtSaisie(1).Text)
         End With
         
   End Select
      
End Sub







