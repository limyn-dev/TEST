VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{B16553C3-06DB-101B-85B2-0000C009BE81}#1.0#0"; "SPIN32.OCX"
Begin VB.Form frmMain 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Xt Tools  (v 1.0)"
   ClientHeight    =   3810
   ClientLeft      =   2925
   ClientTop       =   2400
   ClientWidth     =   8385
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "XtTools.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   3810
   ScaleWidth      =   8385
   Begin MSComctlLib.Toolbar Toolbar1 
      Align           =   1  'Align Top
      Height          =   360
      Left            =   0
      TabIndex        =   83
      Top             =   0
      Width           =   8385
      _ExtentX        =   14790
      _ExtentY        =   635
      ButtonWidth     =   609
      ButtonHeight    =   582
      ToolTips        =   0   'False
      AllowCustomize  =   0   'False
      Wrappable       =   0   'False
      Appearance      =   1
      Style           =   1
      ImageList       =   "ImageList1"
      HotImageList    =   "ImageList1"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   25
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.ToolTipText     =   "Réduction"
            ImageIndex      =   1
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.ToolTipText     =   "Restauration / Agrandissement"
            ImageIndex      =   2
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.ToolTipText     =   "Fermeture"
            ImageIndex      =   4
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.ToolTipText     =   "Modifier le texte de la barre de titre"
            ImageIndex      =   5
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.ToolTipText     =   "Toujours visible"
            ImageIndex      =   6
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.ToolTipText     =   "Placer au premier plan"
            ImageIndex      =   7
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.ToolTipText     =   "Envoyer à l'arrière-plan"
            ImageIndex      =   8
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.ToolTipText     =   "Rafraîchir"
            ImageIndex      =   9
         EndProperty
         BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.ToolTipText     =   "Visible"
            ImageIndex      =   10
            Style           =   1
         EndProperty
         BeginProperty Button10 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.ToolTipText     =   "Active"
            ImageIndex      =   11
            Style           =   1
         EndProperty
         BeginProperty Button11 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.ToolTipText     =   "Envoi de touches"
            ImageIndex      =   12
         EndProperty
         BeginProperty Button12 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Infos"
            Object.ToolTipText     =   "Infos fenêtre"
            ImageIndex      =   13
            Style           =   5
            BeginProperty ButtonMenus {66833FEC-8583-11D1-B16A-00C0F0283628} 
               NumButtonMenus  =   3
               BeginProperty ButtonMenu1 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Text            =   "Infos fenêtre"
               EndProperty
               BeginProperty ButtonMenu2 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Text            =   "Infos process créateur"
               EndProperty
               BeginProperty ButtonMenu3 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Text            =   "Infos thread créateur"
               EndProperty
            EndProperty
         EndProperty
         BeginProperty Button13 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.ToolTipText     =   "Importer la fenêtre"
            ImageIndex      =   14
         EndProperty
         BeginProperty Button14 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.ToolTipText     =   "Exporter la fenêtre"
            ImageIndex      =   15
         EndProperty
         BeginProperty Button15 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button16 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.ToolTipText     =   "Liste des fenêtes"
            ImageIndex      =   16
            Style           =   1
            Value           =   1
         EndProperty
         BeginProperty Button17 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.ToolTipText     =   "Styles de la fenêtre"
            ImageIndex      =   17
            Style           =   1
         EndProperty
         BeginProperty Button18 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button19 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.ToolTipText     =   "Lister les Processus"
            ImageIndex      =   18
         EndProperty
         BeginProperty Button20 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.ToolTipText     =   "Lister les Threads"
            ImageIndex      =   19
         EndProperty
         BeginProperty Button21 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.ToolTipText     =   "Lister les Fenêtres"
            ImageIndex      =   20
         EndProperty
         BeginProperty Button22 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button23 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.ToolTipText     =   "Chercher une fenêtre"
            ImageIndex      =   21
         EndProperty
         BeginProperty Button24 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button25 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Key             =   "Other Tools"
            Object.ToolTipText     =   "Autres commandes"
            ImageIndex      =   22
            Style           =   5
            BeginProperty ButtonMenus {66833FEC-8583-11D1-B16A-00C0F0283628} 
               NumButtonMenus  =   3
               BeginProperty ButtonMenu1 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Text            =   "Bloquer/Autoriser le rafraîchissement"
               EndProperty
               BeginProperty ButtonMenu2 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Text            =   "Enregistrer l'image..."
               EndProperty
               BeginProperty ButtonMenu3 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Text            =   "Rendre infermable/fermable"
               EndProperty
            EndProperty
         EndProperty
      EndProperty
      BorderStyle     =   1
   End
   Begin VB.CommandButton cmdSearchWindow 
      Caption         =   "Find Win"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   1485
      TabIndex        =   78
      Top             =   3870
      Visible         =   0   'False
      Width           =   780
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   20
      Left            =   2205
      Top             =   3945
   End
   Begin VB.Timer tmrStatusBar 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   1785
      Top             =   3945
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   915
      Top             =   3915
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483633
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   16711680
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   22
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "XtTools.frx":0A02
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "XtTools.frx":0B5E
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "XtTools.frx":0CBA
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "XtTools.frx":0E16
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "XtTools.frx":0F72
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "XtTools.frx":10CE
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "XtTools.frx":122A
            Key             =   ""
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "XtTools.frx":1386
            Key             =   ""
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "XtTools.frx":14E2
            Key             =   ""
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "XtTools.frx":1A7E
            Key             =   ""
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "XtTools.frx":1BDA
            Key             =   ""
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "XtTools.frx":1D36
            Key             =   ""
         EndProperty
         BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "XtTools.frx":1E92
            Key             =   ""
         EndProperty
         BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "XtTools.frx":1FEE
            Key             =   ""
         EndProperty
         BeginProperty ListImage15 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "XtTools.frx":214A
            Key             =   ""
         EndProperty
         BeginProperty ListImage16 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "XtTools.frx":22A6
            Key             =   ""
         EndProperty
         BeginProperty ListImage17 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "XtTools.frx":2402
            Key             =   ""
         EndProperty
         BeginProperty ListImage18 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "XtTools.frx":255E
            Key             =   ""
         EndProperty
         BeginProperty ListImage19 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "XtTools.frx":26BA
            Key             =   ""
         EndProperty
         BeginProperty ListImage20 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "XtTools.frx":2816
            Key             =   ""
         EndProperty
         BeginProperty ListImage21 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "XtTools.frx":2972
            Key             =   ""
         EndProperty
         BeginProperty ListImage22 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "XtTools.frx":2ACE
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.CommandButton cmdSaveBitmap 
      Caption         =   "Save bmp"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   1260
      TabIndex        =   77
      Tag             =   "0"
      Top             =   3870
      Visible         =   0   'False
      Width           =   780
   End
   Begin VB.PictureBox Picture2 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   330
      Left            =   225
      ScaleHeight     =   330
      ScaleWidth      =   330
      TabIndex        =   76
      Top             =   4080
      Visible         =   0   'False
      Width           =   330
   End
   Begin VB.CommandButton cmdWindows 
      Caption         =   "Wins"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   3075
      TabIndex        =   75
      Top             =   3870
      Visible         =   0   'False
      Width           =   780
   End
   Begin VB.CommandButton cmdThreads 
      Caption         =   "Threads"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   7605
      TabIndex        =   74
      Top             =   3870
      Visible         =   0   'False
      Width           =   780
   End
   Begin VB.CommandButton cmdLockRedraw 
      Caption         =   "LockUpdate"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   2280
      TabIndex        =   13
      Tag             =   "0"
      Top             =   3870
      Visible         =   0   'False
      Width           =   780
   End
   Begin VB.CommandButton cmdMakeUncloseable 
      Caption         =   "Rendre infermable"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   420
      TabIndex        =   16
      Top             =   3870
      Visible         =   0   'False
      Width           =   780
   End
   Begin VB.CommandButton cmdExport 
      Caption         =   "Export"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   4995
      TabIndex        =   15
      Top             =   3870
      Visible         =   0   'False
      Width           =   780
   End
   Begin VB.CommandButton cmdImport 
      Caption         =   "Import"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   5235
      TabIndex        =   14
      Top             =   3870
      Visible         =   0   'False
      Width           =   780
   End
   Begin VB.Frame Frame1 
      Caption         =   "Capturation"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1185
      Left            =   60
      TabIndex        =   66
      Top             =   405
      Width           =   3150
      Begin VB.CommandButton cmdChoosehWnd 
         Caption         =   "Saisir hWnd"
         Height          =   330
         Left            =   600
         TabIndex        =   82
         ToolTipText     =   "Capturer une fenêtre en tapant son hWnd"
         Top             =   675
         Width           =   1050
      End
      Begin VB.CommandButton cmdPeep 
         Caption         =   "Click'n'Capture"
         Height          =   330
         Left            =   150
         TabIndex        =   81
         ToolTipText     =   "Capturer une fenêtre en cliquant dessus"
         Top             =   270
         Width           =   1500
      End
      Begin VB.CommandButton cmdOtherWindows 
         Caption         =   "Spéciales..."
         Height          =   330
         Left            =   1710
         TabIndex        =   80
         ToolTipText     =   "Capturer une fenêtre spéciale (barre des tâches, écran, bureau, ...)"
         Top             =   270
         Width           =   1260
      End
      Begin VB.CommandButton cmdReleaseWindow 
         Caption         =   ">  Libérer  <"
         Enabled         =   0   'False
         Height          =   330
         Left            =   1710
         TabIndex        =   79
         Top             =   675
         Width           =   1260
      End
      Begin VB.PictureBox picViseur 
         AutoRedraw      =   -1  'True
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   150
         MouseIcon       =   "XtTools.frx":2C2A
         ScaleHeight     =   21
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   22
         TabIndex        =   67
         TabStop         =   0   'False
         Tag             =   "0"
         ToolTipText     =   "Capturer une fenêtre par Drag'n'Drop"
         Top             =   660
         Width           =   390
      End
   End
   Begin VB.PictureBox picSpr 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   10605
      ScaleHeight     =   255
      ScaleWidth      =   255
      TabIndex        =   49
      Tag             =   "0"
      Top             =   975
      Width           =   255
   End
   Begin VB.PictureBox picMask 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   10575
      Picture         =   "XtTools.frx":2F34
      ScaleHeight     =   255
      ScaleWidth      =   255
      TabIndex        =   48
      Tag             =   "0"
      Top             =   1380
      Width           =   255
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   270
      Left            =   0
      TabIndex        =   46
      Top             =   3540
      Width           =   8385
      _ExtentX        =   14790
      _ExtentY        =   476
      Style           =   1
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   2
            Enabled         =   0   'False
            Object.Width           =   8864
            MinWidth        =   8864
         EndProperty
      EndProperty
   End
   Begin VB.CommandButton cmdRefresh 
      Caption         =   "Refresh"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   8655
      TabIndex        =   45
      Top             =   3870
      Visible         =   0   'False
      Width           =   795
   End
   Begin VB.CommandButton cmdSwitchVisible 
      Caption         =   "Visible"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   6825
      TabIndex        =   44
      Top             =   3870
      Visible         =   0   'False
      Width           =   795
   End
   Begin VB.CommandButton cmdSendToBack 
      Caption         =   "Arrière-plan"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   5325
      TabIndex        =   43
      Top             =   3870
      Visible         =   0   'False
      Width           =   795
   End
   Begin VB.CommandButton cmdSwitchTopMost 
      Caption         =   "topmost/notopmost"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   6435
      TabIndex        =   40
      Top             =   3870
      Visible         =   0   'False
      Width           =   795
   End
   Begin VB.CommandButton cmdWinText 
      Caption         =   "Texte"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   6135
      TabIndex        =   39
      Top             =   3870
      Visible         =   0   'False
      Width           =   795
   End
   Begin VB.CommandButton cmdGiveFocus 
      Caption         =   "Premier plan"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   7710
      TabIndex        =   38
      Top             =   3870
      Visible         =   0   'False
      Width           =   795
   End
   Begin VB.CommandButton cmdMinimize 
      Caption         =   "Réduire"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   4065
      TabIndex        =   37
      Top             =   3870
      Visible         =   0   'False
      Width           =   795
   End
   Begin VB.CommandButton cmdRestoreMaximize 
      Caption         =   "Restaurer/Agrandir"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   5175
      TabIndex        =   36
      Top             =   3870
      Visible         =   0   'False
      Width           =   795
   End
   Begin VB.CommandButton cmdCloseWin 
      Caption         =   "Fermer"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   3015
      TabIndex        =   35
      Top             =   3870
      Visible         =   0   'False
      Width           =   795
   End
   Begin VB.CommandButton cmdDisableWin 
      Caption         =   "Désactiver"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   6285
      TabIndex        =   34
      Top             =   3870
      Visible         =   0   'False
      Width           =   435
   End
   Begin VB.CommandButton cmdEnableWin 
      Caption         =   "Active"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   7620
      TabIndex        =   33
      Top             =   3870
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.CommandButton cmdSwitchCloseable 
      Caption         =   "fermable"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   4695
      TabIndex        =   28
      Top             =   3870
      Visible         =   0   'False
      Width           =   780
   End
   Begin VB.Frame fraParams 
      Caption         =   "Paramétrages"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1815
      Left            =   60
      TabIndex        =   23
      Top             =   1650
      Width           =   3150
      Begin VB.ComboBox cboUnit 
         Height          =   315
         ItemData        =   "XtTools.frx":2FC2
         Left            =   1635
         List            =   "XtTools.frx":2FCC
         Style           =   2  'Dropdown List
         TabIndex        =   12
         Top             =   1350
         Width           =   1080
      End
      Begin VB.TextBox txtAutoRefresh 
         Height          =   285
         Left            =   1635
         TabIndex        =   11
         TabStop         =   0   'False
         Text            =   "20"
         Top             =   750
         Width           =   600
      End
      Begin VB.TextBox txtModifFactor 
         Height          =   285
         Left            =   1635
         TabIndex        =   10
         TabStop         =   0   'False
         Text            =   "5"
         Top             =   285
         Width           =   600
      End
      Begin Spin.SpinButton spnAutoRefresh 
         Height          =   255
         Left            =   2250
         TabIndex        =   63
         Top             =   750
         Width           =   195
         _Version        =   65536
         _ExtentX        =   344
         _ExtentY        =   450
         _StockProps     =   73
         ForeColor       =   16711680
         BorderColor     =   32768
         Delay           =   100
      End
      Begin Spin.SpinButton spnModifFactor 
         Height          =   255
         Left            =   2250
         TabIndex        =   64
         Top             =   285
         Width           =   195
         _Version        =   65536
         _ExtentX        =   344
         _ExtentY        =   450
         _StockProps     =   73
         ForeColor       =   16711680
         BorderColor     =   32768
         Delay           =   100
      End
      Begin VB.Label lbl1 
         AutoSize        =   -1  'True
         Caption         =   "(milli-secondes)"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   165
         Index           =   19
         Left            =   1590
         TabIndex        =   68
         Top             =   1065
         Width           =   930
      End
      Begin VB.Label lbl1 
         AutoSize        =   -1  'True
         Caption         =   "Unité de mesure :"
         Height          =   195
         Index           =   12
         Left            =   195
         TabIndex        =   41
         Top             =   1410
         Width           =   1275
      End
      Begin VB.Label lbl1 
         Caption         =   "Vitesse de ra- fraîchissement :"
         Height          =   480
         Index           =   8
         Left            =   270
         TabIndex        =   25
         Top             =   750
         Width           =   1215
      End
      Begin VB.Label lbl1 
         AutoSize        =   -1  'True
         Caption         =   "Facteur modif. :"
         Height          =   195
         Index           =   7
         Left            =   345
         TabIndex        =   24
         Top             =   330
         Width           =   1155
      End
   End
   Begin VB.Frame fraActiveWin 
      Caption         =   "Fenêtre capturée"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   3060
      Left            =   3330
      TabIndex        =   17
      Top             =   405
      Width           =   4995
      Begin VB.Frame Frame2 
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   525
         Left            =   4500
         TabIndex        =   70
         Top             =   1020
         Width           =   375
         Begin VB.Label lblHexMode 
            AutoSize        =   -1  'True
            Caption         =   "Hex"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   6.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00000000&
            Height          =   165
            Left            =   60
            TabIndex        =   72
            ToolTipText     =   "Affichage Hexadécimal"
            Top             =   120
            Width           =   240
         End
         Begin VB.Label lblDecMode 
            AutoSize        =   -1  'True
            Caption         =   "Dec"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   6.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00808080&
            Height          =   165
            Left            =   60
            TabIndex        =   71
            ToolTipText     =   "Affichage Décimal"
            Top             =   300
            Width           =   240
         End
      End
      Begin VB.PictureBox picFormIconSmall 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   240
         Left            =   2445
         ScaleHeight     =   240
         ScaleWidth      =   240
         TabIndex        =   47
         Top             =   1215
         Width           =   240
      End
      Begin VB.PictureBox picFormIcon 
         Appearance      =   0  'Flat
         AutoRedraw      =   -1  'True
         BackColor       =   &H80000005&
         BorderStyle     =   0  'None
         FillStyle       =   3  'Vertical Line
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   480
         Left            =   3930
         ScaleHeight     =   480
         ScaleWidth      =   480
         TabIndex        =   26
         Top             =   1110
         Width           =   480
      End
      Begin VB.TextBox txtWinClass 
         BorderStyle     =   0  'None
         Enabled         =   0   'False
         Height          =   270
         Left            =   930
         Locked          =   -1  'True
         TabIndex        =   1
         Top             =   600
         Width           =   3930
      End
      Begin VB.TextBox txtWinName 
         Appearance      =   0  'Flat
         BorderStyle     =   0  'None
         Enabled         =   0   'False
         Height          =   255
         Left            =   930
         Locked          =   -1  'True
         TabIndex        =   0
         ToolTipText     =   "Titre de la fenêtre ; double-cliquez dessus pour le modifier"
         Top             =   315
         Width           =   3930
      End
      Begin VB.Frame fraWinSize 
         Caption         =   "Taille && Position"
         Height          =   1380
         Left            =   135
         TabIndex        =   2
         Top             =   1560
         Width           =   4755
         Begin Spin.SpinButton spnWinWidth 
            Height          =   255
            Left            =   1170
            TabIndex        =   4
            Top             =   600
            Width           =   195
            _Version        =   65536
            _ExtentX        =   344
            _ExtentY        =   450
            _StockProps     =   73
            ForeColor       =   16711680
            Enabled         =   0   'False
            BorderColor     =   32768
            Delay           =   100
         End
         Begin VB.TextBox txtWinPosX_Client 
            Enabled         =   0   'False
            ForeColor       =   &H00FF8080&
            Height          =   285
            Left            =   3660
            Locked          =   -1  'True
            TabIndex        =   8
            TabStop         =   0   'False
            Top             =   600
            Width           =   555
         End
         Begin VB.TextBox txtWinPosY_Client 
            Enabled         =   0   'False
            ForeColor       =   &H00FF8080&
            Height          =   285
            Left            =   3660
            Locked          =   -1  'True
            TabIndex        =   9
            TabStop         =   0   'False
            Top             =   960
            Width           =   555
         End
         Begin VB.TextBox txtWinPosY 
            Enabled         =   0   'False
            ForeColor       =   &H00FF8080&
            Height          =   285
            Left            =   1995
            TabIndex        =   7
            TabStop         =   0   'False
            Tag             =   "0"
            Top             =   960
            Width           =   555
         End
         Begin VB.TextBox txtWinPosX 
            Enabled         =   0   'False
            ForeColor       =   &H00FF8080&
            Height          =   285
            Left            =   1995
            TabIndex        =   6
            TabStop         =   0   'False
            Tag             =   "0"
            Top             =   600
            Width           =   555
         End
         Begin VB.TextBox txtWinHeight 
            Enabled         =   0   'False
            ForeColor       =   &H00FF8080&
            Height          =   285
            Left            =   600
            TabIndex        =   5
            TabStop         =   0   'False
            Tag             =   "0"
            Top             =   960
            Width           =   555
         End
         Begin VB.TextBox txtWinWidth 
            Enabled         =   0   'False
            ForeColor       =   &H00FF8080&
            Height          =   285
            Left            =   600
            TabIndex        =   3
            TabStop         =   0   'False
            Tag             =   "0"
            Top             =   600
            Width           =   555
         End
         Begin Spin.SpinButton spnClientPosX 
            Height          =   255
            Left            =   4230
            TabIndex        =   58
            Top             =   600
            Width           =   195
            _Version        =   65536
            _ExtentX        =   344
            _ExtentY        =   450
            _StockProps     =   73
            ForeColor       =   16711680
            Enabled         =   0   'False
            BorderColor     =   32768
            Delay           =   100
         End
         Begin Spin.SpinButton spnWinHeight 
            Height          =   255
            Left            =   1170
            TabIndex        =   59
            Top             =   960
            Width           =   195
            _Version        =   65536
            _ExtentX        =   344
            _ExtentY        =   450
            _StockProps     =   73
            ForeColor       =   16711680
            Enabled         =   0   'False
            BorderColor     =   32768
            Delay           =   100
         End
         Begin Spin.SpinButton spnWinPosY 
            Height          =   255
            Left            =   2565
            TabIndex        =   60
            Top             =   960
            Width           =   195
            _Version        =   65536
            _ExtentX        =   344
            _ExtentY        =   450
            _StockProps     =   73
            ForeColor       =   16711680
            Enabled         =   0   'False
            BorderColor     =   32768
            Delay           =   100
         End
         Begin Spin.SpinButton spnClientPosY 
            Height          =   255
            Left            =   4230
            TabIndex        =   61
            Top             =   960
            Width           =   195
            _Version        =   65536
            _ExtentX        =   344
            _ExtentY        =   450
            _StockProps     =   73
            ForeColor       =   16711680
            Enabled         =   0   'False
            BorderColor     =   32768
            Delay           =   100
         End
         Begin Spin.SpinButton spnWinPosX 
            Height          =   255
            Left            =   2565
            TabIndex        =   62
            Top             =   600
            Width           =   195
            _Version        =   65536
            _ExtentX        =   344
            _ExtentY        =   450
            _StockProps     =   73
            ForeColor       =   16711680
            Enabled         =   0   'False
            BorderColor     =   32768
            Delay           =   100
         End
         Begin VB.Label lbl1 
            AutoSize        =   -1  'True
            Caption         =   "Y :"
            Height          =   195
            Index           =   17
            Left            =   3375
            TabIndex        =   57
            Top             =   1005
            Width           =   195
         End
         Begin VB.Label lbl1 
            AutoSize        =   -1  'True
            Caption         =   "X :"
            Height          =   195
            Index           =   16
            Left            =   3375
            TabIndex        =   56
            Top             =   630
            Width           =   195
         End
         Begin VB.Label lbl1 
            AutoSize        =   -1  'True
            Caption         =   "Y :"
            Height          =   195
            Index           =   15
            Left            =   1710
            TabIndex        =   55
            Top             =   1005
            Width           =   195
         End
         Begin VB.Label lbl1 
            AutoSize        =   -1  'True
            Caption         =   "X :"
            Height          =   195
            Index           =   13
            Left            =   1710
            TabIndex        =   54
            Top             =   630
            Width           =   195
         End
         Begin VB.Label lbl1 
            AutoSize        =   -1  'True
            Caption         =   "Posittion (dans client)"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   6.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H000040C0&
            Height          =   165
            Index           =   9
            Left            =   3270
            TabIndex        =   53
            Top             =   315
            Width           =   1305
         End
         Begin VB.Label lbl1 
            AutoSize        =   -1  'True
            Caption         =   "Posittion (dans écran)"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   6.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H000040C0&
            Height          =   165
            Index           =   6
            Left            =   1605
            TabIndex        =   52
            Top             =   315
            Width           =   1320
         End
         Begin VB.Label lbl1 
            AutoSize        =   -1  'True
            Caption         =   "H :"
            Height          =   195
            Index           =   5
            Left            =   315
            TabIndex        =   51
            Top             =   990
            Width           =   210
         End
         Begin VB.Label lbl1 
            AutoSize        =   -1  'True
            Caption         =   "L :"
            Height          =   195
            Index           =   4
            Left            =   345
            TabIndex        =   50
            Top             =   645
            Width           =   180
         End
         Begin VB.Label lbl1 
            AutoSize        =   -1  'True
            Caption         =   "Taille"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   6.75
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H000040C0&
            Height          =   165
            Index           =   3
            Left            =   705
            TabIndex        =   22
            Top             =   315
            Width           =   330
         End
      End
      Begin VB.Label lblIsPureWindow 
         AutoSize        =   -1  'True
         Height          =   195
         Left            =   3975
         TabIndex        =   69
         Top             =   900
         Width           =   45
      End
      Begin VB.Label lbl1 
         AutoSize        =   -1  'True
         Caption         =   "Pure window :"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000040C0&
         Height          =   165
         Index           =   18
         Left            =   2940
         TabIndex        =   65
         Top             =   930
         Width           =   915
      End
      Begin VB.Label lbl1 
         AutoSize        =   -1  'True
         Caption         =   "Icône 16x16 :"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000040C0&
         Height          =   165
         Index           =   14
         Left            =   1470
         TabIndex        =   42
         Top             =   1245
         Width           =   840
      End
      Begin VB.Label lblWinHDC 
         AutoSize        =   -1  'True
         Height          =   195
         Left            =   930
         TabIndex        =   32
         Top             =   1230
         Width           =   45
      End
      Begin VB.Label lbl1 
         AutoSize        =   -1  'True
         Caption         =   "hDC :"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000040C0&
         Height          =   165
         Index           =   11
         Left            =   225
         TabIndex        =   31
         Top             =   1245
         Width           =   375
      End
      Begin VB.Label lblWinInstance 
         AutoSize        =   -1  'True
         Height          =   195
         Left            =   2055
         TabIndex        =   30
         Top             =   900
         Width           =   45
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "hInst :"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000040C0&
         Height          =   165
         Left            =   1470
         TabIndex        =   29
         Top             =   930
         Width           =   405
      End
      Begin VB.Label lbl1 
         AutoSize        =   -1  'True
         Caption         =   "Icône 32x32 :"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000040C0&
         Height          =   165
         Index           =   10
         Left            =   2940
         TabIndex        =   27
         Top             =   1245
         Width           =   840
      End
      Begin VB.Label lblWinHandle 
         AutoSize        =   -1  'True
         Height          =   195
         Left            =   930
         TabIndex        =   21
         Top             =   900
         Width           =   45
      End
      Begin VB.Label lbl1 
         AutoSize        =   -1  'True
         Caption         =   "Classe :"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000040C0&
         Height          =   165
         Index           =   1
         Left            =   225
         TabIndex        =   20
         Top             =   630
         Width           =   495
      End
      Begin VB.Label lbl1 
         AutoSize        =   -1  'True
         Caption         =   "hWnd :"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000040C0&
         Height          =   165
         Index           =   2
         Left            =   225
         TabIndex        =   19
         Top             =   930
         Width           =   435
      End
      Begin VB.Label lbl1 
         AutoSize        =   -1  'True
         Caption         =   "Nom :"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000040C0&
         Height          =   165
         Index           =   0
         Left            =   225
         TabIndex        =   18
         Top             =   330
         Width           =   390
      End
   End
   Begin VB.CommandButton cmdProcess 
      Caption         =   "Process"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   6225
      TabIndex        =   73
      Top             =   3870
      Visible         =   0   'False
      Width           =   780
   End
   Begin VB.Menu mnuLegendPopup 
      Caption         =   "PopupForLegendForm"
      Visible         =   0   'False
      Begin VB.Menu opClose 
         Caption         =   "Fermer"
      End
   End
   Begin VB.Menu mnuSpecialWins 
      Caption         =   "PopupSpecialWins"
      Visible         =   0   'False
      Begin VB.Menu optSpecialWin 
         Caption         =   "Barre des tâches"
         Index           =   0
      End
      Begin VB.Menu optSpecialWin 
         Caption         =   "Écran entier"
         Index           =   1
      End
      Begin VB.Menu optSpecialWin 
         Caption         =   "Bureau"
         Index           =   2
      End
      Begin VB.Menu optSpecialWin 
         Caption         =   "Bureau (ListView)"
         Index           =   3
      End
      Begin VB.Menu optSpecialWin 
         Caption         =   "Bouton Démarrer"
         Index           =   4
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'  Projet XtTools par Xavier Tello   (xavier.tello@wanadoo.fr)

Option Explicit

Public WinIsCloseable As Boolean
Public MyCurrPID As Long
Private Capturing As Boolean
Public hMenu As Long
Public SelectWin_Mode As Boolean
Public ModifFactor As Byte
Public TxtLength As Long
Private SelectedHandle As Long
Private LastHandle As Long
Private CursorPos As POINTAPI
Private CursorClientPos As POINTAPI
Private OldFormTitle As String
Private Working As Boolean
Private GettingPrimaryWinInfos As Boolean

Private WinStyles As Long
Private TitleText As String
Private tmpBool As Boolean
Private OldParent As Long
Private OldPosX As Long
Private OldPosY As Long


Private Sub cmdChoosehWnd_Click()
    frmChoosehWnd.Show 1
    DoEvents
    SelectWinInList
End Sub

Private Sub cmdOtherWindows_Click()
Dim ret As Long

    ret = MsgBox("Attention, vous êtes sur le point de capturer une fenêtre système." _
        & vbCrLf & "Modifiez les paramètres de ces fenêtres à vos risques et périls." _
        , vbCritical + vbOKCancel, "!! Warning !! Attention !! Achtung !!  Bref, Big Bobos")

    If ret = vbCancel Then Exit Sub
    PopupMenu mnuSpecialWins, 2, Frame1.Left + cmdOtherWindows.Left + cmdOtherWindows.Width, _
                                                 Frame1.Top + cmdOtherWindows.Top
    DoEvents
    SelectWinInList
End Sub

Private Sub cmdPeep_Click()
    If picViseur.Tag = 1 Then Exit Sub
    If cmdPeep.Caption = "Stop Capture" Then
        CurrhWnd = -1
        SelectWin_Mode = False
        CurrhWnd = -1
        If CurrhWnd <= 0 Then Timer1.Enabled = False
        cmdPeep.Caption = "Click'n'Capture"
        DisableXtTools
    Else
        SelectWin_Mode = True
        Timer1.Enabled = True
        cmdPeep.Caption = "Stop Capture"
        StatusBar1.SimpleText = "Cliquez sur une fenêtre pour la capturer"
        tmrStatusBar.Enabled = False: DoEvents
        tmrStatusBar.Enabled = True
    End If
End Sub

Private Sub cmdPeep_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    StatusBar1.SimpleText = "Capturer une fenêtre en cliquant dessus"
    tmrStatusBar.Enabled = False: DoEvents
    tmrStatusBar.Enabled = True
End Sub
Private Sub cmdOtherWindows_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    StatusBar1.SimpleText = "Capturer une fenêtre système"
    tmrStatusBar.Enabled = False: DoEvents
    tmrStatusBar.Enabled = True
End Sub
Private Sub cmdChoosehWnd_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    StatusBar1.SimpleText = "Capturer une fenêtre en entrant son hWnd"
    tmrStatusBar.Enabled = False: DoEvents
    tmrStatusBar.Enabled = True
End Sub
Private Sub cmdReleaseWindow_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    StatusBar1.SimpleText = "Libérer la fenêtre capturée"
    tmrStatusBar.Enabled = False: DoEvents
    tmrStatusBar.Enabled = True
End Sub

Private Sub cmdRefresh_Click()
Dim BigRect As RECT

BigRect.Right = Screen.Width \ Tppx
BigRect.Bottom = Screen.Height \ Tppy

InvalidateRect CurrhWnd, BigRect, True
If CurrhWnd = GetDesktopWindow() Then InvalidateRect 0, 0, True
End Sub

Private Sub cmdReleaseWindow_Click()
    If CurrhWnd <= 0 Then Exit Sub
    CurrhWnd = -1
    While (GettingPrimaryWinInfos):    DoEvents:      Wend
    DisableXtTools
    If Toolbar1.Buttons(17).Value = tbrPressed Then frmWinStyles.ClearStyles
    If frmWindowsList.Visible Then frmWindowsList.cmdRefresh_Click
    If frmWinInfos.Visible Then frmWinInfos.cmdRefresh_Click
End Sub

Private Sub cmdReleaseWindow_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = 1 Then cmdReleaseWindow.Caption = "< Libérer >"
End Sub

Private Sub cmdReleaseWindow_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = 1 Then cmdReleaseWindow.Caption = ">  Libérer  <"
End Sub

Private Sub cmdMakeUncloseable_Click()
    'uvg
End Sub

Private Sub cmdSaveBitmap_Click()
Dim ret As Long
Dim WinRec As RECT
Dim ImageWidth As Long
Dim ImageHeight As Long
Dim strFileFullPath As String
Dim DesktopFullPath As String
    
    If GetKeyValue(HKEY_CURRENT_USER, GETDESKTOPFULLPATH_LOC, GETDESKTOPFULLPATH, DesktopFullPath) Then
    Else
        DesktopFullPath = WindowsDirectory()
        DesktopFullPath = DesktopFullPath & IIf(Right(DesktopFullPath, 1) <> "\", "\Bureau", "Bureau")
    End If
    DesktopFullPath = DesktopFullPath & "\ScreenShot.bmp"
    strFileFullPath = InputBox("Chemin complet du fichier Bitmap a créer : ", "Créer un bitmap de la fenêtre", DesktopFullPath)
    
    If UCase(Right(strFileFullPath, 4)) <> ".BMP" Then strFileFullPath = strFileFullPath & ".bmp"
    
    GetWindowRect CurrhWnd, WinRec
    ImageWidth = WinRec.Right - WinRec.Left
    ImageHeight = WinRec.Bottom - WinRec.Top
    
    Picture2.Width = ImageWidth * Tppx
    Picture2.Height = ImageHeight * Tppy
    Picture2.Cls
    
    DoEvents

    ret = BitBlt(Picture2.HDC, 0, 0, ImageWidth, ImageHeight, GetDC(CurrhWnd), 0, 0, SRCCOPY)
    Picture2.Refresh
    DoEvents
    
    If ret = 0 Then Beep
    
    SavePicture Picture2.Image, strFileFullPath
    
End Sub

Private Sub cmdSearchWindow_Click()
    frmSearchWindow.Show
End Sub

Private Sub cmdSwitchVisible_Click()
Dim ret As Long
    If (IsWindowVisible(CurrhWnd) = 1) Then
        ret = ShowWindow(CurrhWnd, 0&)
    Else
        ret = ShowWindow(CurrhWnd, 1&)
    End If
    DoEvents
    If Toolbar1.Buttons(17).Value = tbrPressed Then frmWinStyles.cmdRefresh_Click
    frmMain.SetFocus
End Sub

Private Sub cmdProcess_Click()
    frmProcesses.Show
End Sub
Private Sub cmdThreads_Click()
    frmThreads.Show
End Sub
Private Sub cmdWindows_Click()
    frmWindows.Show
End Sub
Private Sub cmdLockRedraw_Click()
    If CurrhWnd <= 0 Then Exit Sub
    If cmdLockRedraw.Tag = 0 Then
        LockWindowUpdate CurrhWnd
    Else
        LockWindowUpdate 0
    End If
    cmdLockRedraw.Tag = IIf(cmdLockRedraw.Tag = 0, 1, 0)
End Sub

Private Sub Form_Resize()
    If Comm1 = 4 Then
        frmWindowsList.Show
        Comm1 = 0
    End If
    DoEvents
    If Me.WindowState = 1 Then
        ' Main form is minimized
        If frmWindowsList.Visible Then
            SetWindowPos frmWindowsList.hwnd, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOSIZE Or SWP_NOMOVE
            frmWindowsList.WindowState = 1
        End If
        If Toolbar1.Buttons(17).Value = tbrPressed Then
            SetWindowPos frmWinStyles.hwnd, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOSIZE Or SWP_NOMOVE
            frmWinStyles.WindowState = 1
        End If
        If ShowProcesses Then frmProcesses.WindowState = 1
        If ShowThreads Then frmThreads.WindowState = 1
        If ShowWindows Then frmWindows.WindowState = 1
        If ShowWinInfos Then frmWinInfos.WindowState = 1
        If ShowProcessInfos Then frmProcessInfos.WindowState = 1
        If ShowThreadInfos Then frmThreadInfos.WindowState = 1
        Exit Sub
    Else
        ' Main form is maximized
        SetWindowPos frmMain.hwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE Or SWP_NOMOVE
        If frmWindowsList.Visible Then
            SetWindowPos frmWindowsList.hwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE Or SWP_NOMOVE
            frmWindowsList.cmdRefresh_Click
            If frmWindowsList.WindowState = 1 Then frmWindowsList.WindowState = 0
        End If
        If Toolbar1.Buttons(17).Value = tbrPressed Then
            SetWindowPos frmWinStyles.hwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE Or SWP_NOMOVE
            frmWinStyles.WindowState = 0
        End If
        If ShowProcesses Then frmProcesses.WindowState = 0
        If ShowThreads Then frmThreads.WindowState = 0
        If ShowWindows Then frmWindows.WindowState = 0
        If ShowWinInfos Then frmWinInfos.WindowState = 0
        If ShowProcessInfos Then frmProcessInfos.WindowState = 0
        If ShowThreadInfos Then frmThreadInfos.WindowState = 0
        frmMain.SetFocus
    End If
End Sub

Private Sub lblDecMode_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Not HexMode Then Exit Sub
    HexMode = False
    lblHexMode.ForeColor = RGB(150, 150, 150)
    lblDecMode.ForeColor = 0
    If frmWindowsList.Visible Then frmWindowsList.SetDecMode
    If ShowWindows Then frmWindows.RefreshWinsList
    If ShowProcesses Then frmProcesses.RefreshPIDsList
    If ShowThreads Then frmThreads.RefreshTIDsList
    'Convertit en décimal les valeurs de la fenêtre des styles
    If Toolbar1.Buttons(17).Value = tbrPressed Then
        Dim ret As Long
        ret = GetWindowLong(CurrhWnd, GWL_STYLE)
        frmWinStyles.lblWinStyles.Caption = "(" & IIf(HexMode, Hex(ret), ret) & ")"
        ret = GetWindowLong(CurrhWnd, GWL_EXSTYLE)
        frmWinStyles.lblWinExStyles.Caption = "(" & IIf(HexMode, Hex(ret), ret) & ")"
        DoEvents: Me.SetFocus
    End If
    If ShowWinInfos Then frmWinInfos.cmdRefresh_Click
End Sub

Private Sub lblHexMode_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If HexMode Then Exit Sub
    HexMode = True
    lblDecMode.ForeColor = RGB(150, 150, 150)
    lblHexMode.ForeColor = 0
    If frmWindowsList.Visible Then frmWindowsList.SetHexMode
    If ShowWindows Then frmWindows.RefreshWinsList
    If ShowProcesses Then frmProcesses.RefreshPIDsList
    If ShowThreads Then frmThreads.RefreshTIDsList
    'Convertit en hexadécimal les valeurs de la fenêtre des styles
    If Toolbar1.Buttons(17).Value = tbrPressed Then
        Dim ret As Long
        ret = GetWindowLong(CurrhWnd, GWL_STYLE)
        frmWinStyles.lblWinStyles.Caption = "(" & IIf(HexMode, Hex(ret), ret) & ")"
        ret = GetWindowLong(CurrhWnd, GWL_EXSTYLE)
        frmWinStyles.lblWinExStyles.Caption = "(" & IIf(HexMode, Hex(ret), ret) & ")"
        DoEvents: Me.SetFocus
    End If
    If ShowWinInfos Then frmWinInfos.cmdRefresh_Click
End Sub


Private Sub opClose_Click()
    Unload frmLegend
End Sub

Private Sub optSpecialWin_Click(Index As Integer)
Dim WinHandle As Long
Dim ret As Long
Dim HICON As Long
    
    Select Case Index
        Case 0  ' TaskBar
            WinHandle = GetSpecialWin_TaskBar
        Case 1  ' Screen
            WinHandle = GetSpecialWin_Screen
        Case 2  ' Desktop
            WinHandle = GetSpecialWin_Desktop
        Case 3  ' Desktop ListView
            WinHandle = GetSpecialWin_DesktopListView
        Case 4  ' StartButton
            WinHandle = GetSpecialWin_StartButton
    End Select
    
    If WinHandle <= 0 Then Exit Sub
    
    CurrhWnd = WinHandle
    SelectWin_Mode = False
    Timer1.Enabled = True
    EnableXtTools
    
    picFormIconSmall.Cls
        HICON = GetClassLong(CurrhWnd, GCL_HICONSM)
        ret = DrawIconEx(picFormIconSmall.HDC, 0, 0, HICON, 16, 16, 0, 0, 3)
    picFormIconSmall.Refresh
    If ret = 0 Then DrawNoIconSmall
    
    picFormIcon.Cls
        HICON = GetClassLong(CurrhWnd, GCL_HICON)
        ret = DrawIcon(picFormIcon.HDC, 0, 0, HICON)
    picFormIcon.Refresh
    If ret = 0 Then DrawNoIcon

    If Toolbar1.Buttons(17).Value = tbrPressed Then frmWinStyles.cmdRefresh_Click
    If frmWinInfos.Visible Then frmWinInfos.cmdRefresh_Click
    
End Sub

Private Sub picViseur_Click()
    MsgBox "Faites un glisser-déposer du viseur pour sélectionner l'objet désiré (fenêtre, image, bouton...)" _
    & vbCrLf & vbCrLf & "Il est interdit de capturer un objet de ce programme !", vbInformation
End Sub

Private Sub picViseur_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button <> 1 Then Exit Sub
    OldFormTitle = Me.Caption
    If SetCapture(picViseur.hwnd) Then
        Timer1.Enabled = False
        picViseur.Tag = 1
        picViseur.Picture = LoadPicture()
        picViseur.MousePointer = 99
        LastHandle = -1
        If Toolbar1.Buttons(16).Value = tbrPressed Then frmWindowsList.Hide
        If Toolbar1.Buttons(17).Value = tbrPressed Then frmWinStyles.Hide
        If ShowWinInfos Then frmWinInfos.Hide
        If ShowProcesses Then frmProcesses.Hide
        If ShowThreads Then frmThreads.Hide
        If ShowWindows Then frmWindows.Hide
    End If
End Sub

Private Sub picViseur_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Static ret As Long
Static TitleText As String
Static HICON As Long
Static PID As Long
Dim lParam As Long
Dim ret2 As Long

    If (Button <> 1) Or (Working) Then Exit Sub
    
    If GetCapture() Then
        Working = True
        CursorPos.X = CLng(X)
        CursorPos.Y = CLng(Y)
        ClientToScreen picViseur.hwnd, CursorPos
                
        CursorClientPos.X = CursorPos.X
        CursorClientPos.Y = CursorPos.Y
        
        ret = WindowFromPoint(CursorPos.X, CursorPos.Y)
        ScreenToClient ret, CursorClientPos
        ret2 = XtChildWindowFromPoint(ret, CursorClientPos)
            
        Me.Caption = "(" & CursorPos.X & ";" & CursorPos.Y & ") dans parent &H" & Hex(ret) _
           & "    ~    (" & CursorClientPos.X & ";" & CursorClientPos.Y & ") dans enfant &H" & Hex(ret2)
            
        If ret2 > 0 Then ret = ret2
        If (ret = SelectedHandle) Then
            Working = False
            Exit Sub
        End If
            GetWindowThreadProcessId ret, PID
        If (MyCurrPID = PID) Then
            InvertWindowDC LastHandle
            LastHandle = -1
            SelectedHandle = -1
            DisableXtTools
            txtWinClass.ForeColor = &HFF
            txtWinClass.Enabled = True
            txtWinClass.Text = "   ***    Pas touche à mon programme !   ***  "
            Working = False
            Exit Sub
        End If
        
        txtWinClass.ForeColor = 0
        
        If LastHandle <> -1 Then InvertWindowDC LastHandle
        If Not txtWinName.Enabled Then EnableXtTools
            
        SelectedHandle = ret
        LastHandle = SelectedHandle
            DoEvents
            InvertWindowDC SelectedHandle
            DoEvents
        CurrhWnd = SelectedHandle
        
        picFormIconSmall.Cls
            HICON = GetClassLong(CurrhWnd, GCL_HICONSM)
            ret = DrawIconEx(picFormIconSmall.HDC, 0, 0, HICON, 16, 16, 0, 0, 3)
        picFormIconSmall.Refresh
        If ret = 0 Then DrawNoIconSmall
    
        picFormIcon.Cls
            HICON = GetClassLong(CurrhWnd, GCL_HICON)
            ret = DrawIcon(picFormIcon.HDC, 0, 0, HICON)
        picFormIcon.Refresh
        If ret = 0 Then DrawNoIcon
    
        GetPrimaryWinInfos
        Working = False
    End If
End Sub

Private Sub picViseur_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button <> 1 Then Exit Sub
    
    txtWinClass.ForeColor = 0
    If InStr(1, UCase(txtWinClass.Text), "PAS TOUCHE") <> 0 Then txtWinClass.Text = ""
    picViseur.Tag = 0
        Call BitBlt(picViseur.HDC, 2, 2, 17, 17, picMask.HDC, 0, 0, SRCAND)
        Call BitBlt(picViseur.HDC, 2, 2, 17, 17, picSpr.HDC, 0, 0, SRCINVERT)
        picViseur.Refresh
    picViseur.MousePointer = 0
    InvertWindowDC LastHandle
    CurrhWnd = SelectedHandle
    SelectWin_Mode = False
    If Toolbar1.Buttons(16).Value = tbrPressed Then frmWindowsList.Show
    If Toolbar1.Buttons(17).Value = tbrPressed Then frmWinStyles.Show
    If ShowWinInfos Then frmWinInfos.Show
    If ShowProcesses Then frmProcesses.Show
    If ShowThreads Then frmThreads.Show
    If ShowWindows Then frmWindows.Show
    If Toolbar1.Buttons(17).Value = tbrPressed Then frmWinStyles.cmdRefresh_Click
    If ShowWinInfos Then frmWinInfos.cmdRefresh_Click
    SelectWinInList
    Me.SetFocus
    Timer1.Enabled = True
    InvalidateRect 0&, 0&, True
    Me.Caption = OldFormTitle
End Sub



Private Sub tmrStatusBar_Timer()
    tmrStatusBar.Enabled = False
    StatusBar1.SimpleText = ""
End Sub

Private Sub Toolbar1_ButtonClick(ByVal Button As MSComctlLib.Button)
    Select Case Button.Index
        Case 1: cmdMinimize_Click
        Case 2: cmdRestoreMaximize_Click
        Case 3: cmdCloseWin_Click
        Case 4: txtWinName_DblClick
        Case 5: cmdSwitchTopMost_Click
        Case 6: cmdGiveFocus_Click
        Case 7: cmdSendToBack_Click
        Case 8: cmdRefresh_Click
        Case 9: cmdSwitchVisible_Click
        Case 10: If Toolbar1.Buttons(10).Value = tbrPressed Then cmdEnableWin_Click Else cmdDisableWin_Click
        Case 11: frmSendKeys.Show
        Case 12: If Not frmWinInfos.Visible Then frmWinInfos.Show Else frmWinInfos.SetFocus
        Case 13: cmdImport_Click
        Case 14: cmdExport_Click
        Case 15: '....Separator
        Case 16
            If Toolbar1.Buttons(16).Value = tbrPressed Then
                frmWindowsList.Show
                If frmWindowsList.WindowState = 1 Then frmWindowsList.WindowState = 0
            Else
                frmWindowsList.Hide
            End If
        Case 17
            If Toolbar1.Buttons(17).Value = tbrPressed Then
                frmWinStyles.Show
                If frmWinStyles.WindowState = 1 Then frmWinStyles.WindowState = 0
            Else
                frmWinStyles.Hide
            End If
        Case 18: '....Separator
        Case 19: cmdProcess_Click
        Case 20: cmdThreads_Click
        Case 21: cmdWindows_Click
        Case 22: '....Separator
        Case 23: cmdSearchWindow_Click
    End Select
End Sub

Private Sub cboUnit_Change()
    ChangeUnit cboUnit.ListIndex
End Sub
Private Sub cboUnit_Click()
    ChangeUnit cboUnit.ListIndex
End Sub

Private Sub cmdDisableWin_Click()
Dim ret As Long
    ret = EnableWindow(CurrhWnd, 0)
    DoEvents
    If Toolbar1.Buttons(17).Value = tbrPressed Then frmWinStyles.cmdRefresh_Click
    frmMain.SetFocus
End Sub
Private Sub cmdEnableWin_Click()
Dim ret As Long
    ret = EnableWindow(CurrhWnd, 1)
    DoEvents
    If Toolbar1.Buttons(17).Value = tbrPressed Then frmWinStyles.cmdRefresh_Click
    frmMain.SetFocus
End Sub

Private Sub cmdImport_Click()
    OldPosX = Me.Left: OldPosY = Me.Top
    Me.Move 0, -Tppy * GetSystemMetrics(SM_CYCAPTION)
    SetWindowPos CurrhWnd, 0, 100&, 100&, 0, 0, SWP_NOSIZE Or SWP_NOACTIVATE
    DoEvents
    OldParent = GetWindowLong(CurrhWnd, GWL_HWNDPARENT)
    SetParent CurrhWnd, Me.hwnd
End Sub
Private Sub cmdExport_Click()
    SetParent CurrhWnd, OldParent
    Me.Left = OldPosX: Me.Top = OldPosY
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    Unload frmWindowsList
    Unload frmWinStyles
    Unload frmWinInfos
    Unload frmSendKeys
    Unload frmProcesses
    Unload frmThreads
    Unload frmWindows
    Unload frmSearchWindow
    Unload frmLegend
    Unload frmProcessInfos
    Unload frmThreadInfos
    End
End Sub

Private Sub GetPrimaryWinInfos()
Dim WinRec As RECT, CoordsInClient As POINTAPI
Dim ret As Long
    
    GettingPrimaryWinInfos = True
    
    'Lecture du nom de la classe
    TitleText = String(255, Chr(0))
    ret = GetClassName(CurrhWnd, TitleText, TxtLength)
    txtWinClass.Text = Mid(TitleText, 1, ret)
    
    'Lecture du titre de la fenêtre
    TitleText = String(255, Chr(0))
    ret = GetWindowText(CurrhWnd, TitleText, TxtLength)
    If txtWinName.Tag = 0 Then txtWinName.Text = Mid(TitleText, 1, ret)

    'Lecture de l'handle de l'instance
    If HexMode Then
        lblWinHandle.Caption = Hex(CurrhWnd)
        lblWinInstance.Caption = Hex(GetWindowLong(CurrhWnd, GWL_HINSTANCE))
        lblWinHDC.Caption = Hex(GetDC(CurrhWnd))
    Else
        lblWinHandle.Caption = CurrhWnd
        lblWinInstance.Caption = GetWindowLong(CurrhWnd, GWL_HINSTANCE)
        lblWinHDC.Caption = GetDC(CurrhWnd)
    End If

    'Lecture de l'état : Activée/Désactivée
    tmpBool = (IsWindowEnabled(CurrhWnd) = 1)
    If (tmpBool) And (Toolbar1.Buttons(10).Value = tbrUnpressed) Then
        Toolbar1.Buttons(10).Value = tbrPressed
    End If
    If (Not tmpBool) And (Toolbar1.Buttons(10).Value = tbrPressed) Then
        Toolbar1.Buttons(10).Value = tbrUnpressed
    End If

    'Lecture de l'état : Visible/Invisible
    tmpBool = (IsWindowVisible(CurrhWnd) = 1)
    If (tmpBool) And (Toolbar1.Buttons(9).Value = tbrUnpressed) Then
        Toolbar1.Buttons(9).Value = tbrPressed
    End If
    If (Not tmpBool) And (Toolbar1.Buttons(9).Value = tbrPressed) Then
        Toolbar1.Buttons(9).Value = tbrUnpressed
    End If

    'Lecture de l'état : TopMost/NoTopMost
    tmpBool = (WinIsTopMost(CurrhWnd))
    If (tmpBool And (Toolbar1.Buttons(5).Value = tbrUnpressed)) _
      Or ((Not tmpBool) And (Toolbar1.Buttons(5).Value = tbrPressed)) Then
        Toolbar1.Buttons(5).Value = IIf(tmpBool, tbrPressed, tbrUnpressed)
    End If

    'Lecture de l'état : Minimisée/Normale/Maximisée
    WinStyles = GetWindowLong(CurrhWnd, GWL_STYLE)
    If ((WinStyles And WS_MINIMIZE) <> 0) Or _
       ((WinStyles And WS_MAXIMIZE) <> 0) Then
        If (Toolbar1.Buttons(2).Image <> 2) Then
            Toolbar1.Buttons(2).Image = 2
            DoEvents
        End If
    Else
        If (Toolbar1.Buttons(2).Image <> 3) Then
            Toolbar1.Buttons(2).Image = 3
            DoEvents
        End If
    End If

    'Lecture de l'état : Pure Window/Non Pure Window
    lblIsPureWindow.Caption = _
    IIf((WinStyles And WS_CAPTION) <> 0, "Yes", "No")

    'Lecture des dimensions et de la position
    GetWindowRect CurrhWnd, WinRec
        txtWinWidth.Text = ConvertToCurrUnit(WinRec.Right - WinRec.Left)
        txtWinHeight.Text = ConvertToCurrUnit(WinRec.Bottom - WinRec.Top)
        txtWinPosX.Text = ConvertToCurrUnit(WinRec.Left)
        txtWinPosY.Text = ConvertToCurrUnit(WinRec.Top)
    
    CoordsInClient.X = WinRec.Left
    CoordsInClient.Y = WinRec.Top
    ScreenToClient GetWindowLong(CurrhWnd, GWL_HWNDPARENT), CoordsInClient
        txtWinPosX_Client.Text = ConvertToCurrUnit(CoordsInClient.X)
        txtWinPosY_Client.Text = ConvertToCurrUnit(CoordsInClient.Y)

    txtWinPosX.Enabled = ((txtWinPosX.Text = txtWinPosX_Client.Text) And (txtWinPosY.Text = txtWinPosY_Client.Text))
    txtWinPosY.Enabled = txtWinPosX.Enabled
    spnWinPosX.Enabled = txtWinPosX.Enabled
    spnWinPosY.Enabled = txtWinPosX.Enabled
    
    txtWinPosX_Client.Enabled = Not txtWinPosX.Enabled
    txtWinPosY_Client.Enabled = txtWinPosX_Client.Enabled
    spnClientPosX.Enabled = txtWinPosX_Client.Enabled
    spnClientPosY.Enabled = txtWinPosX_Client.Enabled
    
    GettingPrimaryWinInfos = False
End Sub

Private Sub Timer1_Timer()
Static ret As Long
Static HICON As Long, HICONSM As Long
Static buf As String

    If SelectWin_Mode Then
    
        CurrhWnd = GetForegroundWindow()
        If CurrhWnd = frmMain.hwnd Then Exit Sub
        
        If CurrhWnd = 0 Then
            MsgBox "Handle = 0"
            CurrhWnd = -1
            Exit Sub
        End If
        
        TitleText = String(255, Chr(0))
        ret = GetClassName(CurrhWnd, TitleText, TxtLength)
        buf = Mid(TitleText, 1, ret)
        If buf = "Shell_TrayWnd" Or buf = "Progman" Then
            ret = MsgBox("Attention, vous êtes sur le point de capturer une fenêtre système." _
                & vbCrLf & "Modifiez les paramètres de ces fenêtres à vos risques et périls." _
                , vbCritical + vbOKCancel, "!! Warning !! Attention !! Achtung !!  Bref, Big Bobos")
            If ret = vbCancel Then
                CurrhWnd = -1
                Exit Sub
            End If
        End If
    
        EnableXtTools
        SelectWin_Mode = False
        WinIsCloseable = True
        cmdPeep.Caption = "Click'n'Capture"
        
        'Lecture de l'icône 32*32
        picFormIconSmall.Cls
            HICONSM = GetClassLong(CurrhWnd, GCL_HICONSM)
            ret = DrawIconEx(picFormIconSmall.HDC, 0, 0, HICONSM, 16, 16, 0, 0, 3)
        picFormIconSmall.Refresh
        If ret = 0 Then DrawNoIconSmall
        
        'Lecture de l'icône 16*16
        picFormIcon.Cls
            HICON = GetClassLong(CurrhWnd, GCL_HICON)
            ret = DrawIcon(picFormIcon.HDC, 0, 0, HICON)
        picFormIcon.Refresh
        If ret = 0 Then DrawNoIcon
                
        'Lecture des styles
        If Toolbar1.Buttons(17).Value = tbrPressed Then frmWinStyles.cmdRefresh_Click
        
        'Rafraîchissement des infos
        If ShowWinInfos Then frmWinInfos.cmdRefresh_Click
        If Toolbar1.Buttons(17).Value = tbrPressed Then frmWinStyles.cmdRefresh_Click
        
        'Sélectionne la fenêtre capturée dans la liste
        SelectWinInList
    
    End If  'End if : SelectWin_Mode=True



    'Quitte cette sub si aucune Form n'est capturée
    If CurrhWnd = -1 Then Exit Sub

    'Teste si la fenêtre est toujours là
    If IsWindow(CurrhWnd) = 0 Then
        CurrhWnd = -1
        DisableXtTools
        txtWinClass.Text = "        <   Liaison hWnd perdue!   >"
        If Toolbar1.Buttons(17).Value = tbrPressed Then frmWinStyles.ClearStyles
        If frmWindowsList.Visible Then frmWindowsList.cmdRefresh_Click
        If ShowWindows Then frmWindows.RefreshWinsList
        If ShowProcesses Then frmProcesses.RefreshPIDsList
        If ShowThreads Then frmThreads.RefreshTIDsList
        If ShowWinInfos Then frmWinInfos.cmdRefresh_Click
        WinIsCloseable = True
        SelectWinInList
        Exit Sub
    End If

    GetPrimaryWinInfos
End Sub



Private Sub cmdSwitchCloseable_Click()
Dim ret As Long
    
If WinIsCloseable Then
    hMenu = GetSystemMenu(CurrhWnd, False)
    ret = DeleteMenu(hMenu, SC_CLOSE, MF_BYCOMMAND)
Else
        'Restore the close command
    hMenu = GetSystemMenu(CurrhWnd, True)
End If

'Rafraîchit le menu système
DrawMenuBar CurrhWnd
WinIsCloseable = Not WinIsCloseable
End Sub

Private Sub cmdSwitchTopMost_Click()
    If Not WinIsTopMost(CurrhWnd) Then
        Toolbar1.Buttons(5).Value = 1
        SetWindowPos CurrhWnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE Or SWP_NOMOVE Or SWP_NOACTIVATE
        DoEvents
        SetWindowPos frmMain.hwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE Or SWP_NOMOVE
        frmMain.SetFocus
    Else
        Toolbar1.Buttons(5).Value = 0
        SetWindowPos CurrhWnd, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOSIZE Or SWP_NOMOVE Or SWP_NOACTIVATE
        frmMain.SetFocus
    End If
    If Toolbar1.Buttons(17).Value = tbrPressed Then frmWinStyles.cmdRefresh_Click
End Sub
Private Sub cmdGiveFocus_Click()
    SetWindowPos CurrhWnd, HWND_TOP, 0, 0, 0, 0, SWP_NOSIZE Or SWP_NOMOVE
    frmMain.SetFocus
End Sub
Private Sub cmdSendToBack_Click()
    SetWindowPos CurrhWnd, HWND_BOTTOM, 0, 0, 0, 0, SWP_NOSIZE Or SWP_NOMOVE Or SWP_NOACTIVATE
    Toolbar1.Buttons(5).Value = tbrUnpressed
    If Toolbar1.Buttons(17).Value = tbrPressed Then frmWinStyles.cmdRefresh_Click
End Sub


Private Sub cmdRefreshWin_Click()
    Dim ret As Long
    Dim lParam As Long
    
    lParam = 0&
    ret = SendMessage(CurrhWnd, WM_PAINT, 0, lParam)
End Sub

Private Sub cmdMinimize_Click()
    Dim ret As Long
    ret = ShowWindow(CurrhWnd, SW_MINIMIZE)
    DoEvents
    If Toolbar1.Buttons(17).Value = tbrPressed Then frmWinStyles.cmdRefresh_Click
    frmMain.SetFocus
End Sub
Private Sub cmdRestoreMaximize_Click()
    Dim ret As Long
    If Toolbar1.Buttons(2).Image = 3 Then
        ret = ShowWindow(CurrhWnd, SW_MAXIMIZE)
    Else
        ret = ShowWindow(CurrhWnd, SW_RESTORE)
    End If
    DoEvents
    If Toolbar1.Buttons(17).Value = tbrPressed Then frmWinStyles.cmdRefresh_Click
    frmMain.SetFocus
End Sub

Private Sub cmdCloseWin_Click()
Dim ret As Long
Dim StopTime As Date

ret = PostMessage(CurrhWnd, WM_CANCELMODE, 0, 0&)
ret = PostMessage(CurrhWnd, WM_CLOSE, 0, 0&)
DoEvents

'Attendre une seconde avant de faire le test
StopTime = DateAdd("s", 1, Now)
Do:  DoEvents: Loop While Now <= StopTime

'Teste si la fermeture a bien eu lieu (perte de connexion avec CurrhWnd)
ret = IsWindow(CurrhWnd)

If ret = 0 Then
    DisableXtTools
    CurrhWnd = -1
    cmdCloseWin.Enabled = True
    If frmWindowsList.Visible Then frmWindowsList.cmdRefresh_Click
    If Toolbar1.Buttons(17).Value = tbrPressed Then frmWinStyles.cmdRefresh_Click
    Exit Sub
Else
    MsgBox "Impossible de fermer cette fenêtre !", vbExclamation
End If

cmdCloseWin.Enabled = True
End Sub

Private Sub spnWinWidth_SpinUp()
    SetWindowPos CurrhWnd, 0, 0, 0, _
        ConvertToPix(Val(txtWinWidth.Text) + ModifFactor), _
        ConvertToPix(Val(txtWinHeight.Text)), SWP_NOMOVE Or SWP_NOACTIVATE
    txtWinWidth.Text = LTrim(Str(Val(txtWinWidth.Text) + ModifFactor))
    DoEvents
End Sub
Private Sub spnWinWidth_SpinDown()
    SetWindowPos CurrhWnd, 0, 0, 0, _
        ConvertToPix(Val(txtWinWidth.Text) - ModifFactor), _
        ConvertToPix(Val(txtWinHeight.Text)), SWP_NOMOVE Or SWP_NOACTIVATE
    txtWinWidth.Text = LTrim(Str(Val(txtWinWidth.Text) - ModifFactor))
    DoEvents
End Sub
Private Sub spnWinHeight_SpinUp()
    SetWindowPos CurrhWnd, 0, 0, 0, _
        ConvertToPix(Val(txtWinWidth.Text)), _
        ConvertToPix(Val(txtWinHeight.Text) + ModifFactor), SWP_NOMOVE Or SWP_NOACTIVATE
    txtWinHeight.Text = LTrim(Str(Val(txtWinHeight.Text) + ModifFactor))
    DoEvents
End Sub
Private Sub spnWinHeight_SpinDown()
    SetWindowPos CurrhWnd, 0, 0, 0, _
        ConvertToPix(Val(txtWinWidth.Text)), _
        ConvertToPix(Val(txtWinHeight.Text) - ModifFactor), SWP_NOMOVE Or SWP_NOACTIVATE
    txtWinHeight.Text = LTrim(Str(Val(txtWinHeight.Text) - ModifFactor))
    DoEvents
End Sub

Private Sub spnWinPosX_SpinUp()
    SetWindowPos CurrhWnd, 0, _
        ConvertToPix(Val(txtWinPosX.Text) + ModifFactor), _
        ConvertToPix(Val(txtWinPosY.Text)), 0, 0, SWP_NOSIZE Or SWP_NOACTIVATE
    txtWinPosX.Text = LTrim(Str(Val(txtWinPosX.Text) + ModifFactor))
    DoEvents
End Sub
Private Sub spnWinPosX_SpinDown()
    SetWindowPos CurrhWnd, 0, _
        ConvertToPix(Val(txtWinPosX.Text) - ModifFactor), _
        ConvertToPix(Val(txtWinPosY.Text)), 0, 0, SWP_NOSIZE Or SWP_NOACTIVATE
    txtWinPosX.Text = LTrim(Str(Val(txtWinPosX.Text) - ModifFactor))
    DoEvents
End Sub
Private Sub spnWinPosY_SpinUp()
    SetWindowPos CurrhWnd, 0, _
        ConvertToPix(Val(txtWinPosX.Text)), _
        ConvertToPix(Val(txtWinPosY.Text) + ModifFactor), 0, 0, SWP_NOSIZE Or SWP_NOACTIVATE
    txtWinPosY.Text = LTrim(Str(Val(txtWinPosY.Text) + ModifFactor))
    DoEvents
End Sub
Private Sub spnWinPosY_SpinDown()
    SetWindowPos CurrhWnd, 0, _
        ConvertToPix(Val(txtWinPosX.Text)), _
        ConvertToPix(Val(txtWinPosY.Text) - ModifFactor), 0, 0, SWP_NOSIZE Or SWP_NOACTIVATE
    txtWinPosY.Text = LTrim(Str(Val(txtWinPosY.Text) - ModifFactor))
    DoEvents
End Sub

Private Sub spnClientPosX_SpinUp()
    SetWindowPos CurrhWnd, 0, _
        ConvertToPix(Val(txtWinPosX_Client.Text) + ModifFactor), _
        ConvertToPix(Val(txtWinPosY_Client.Text)), 0, 0, SWP_NOSIZE Or SWP_NOACTIVATE
    txtWinPosX_Client.Text = LTrim(Str(Val(txtWinPosX_Client.Text) + ModifFactor))
    DoEvents
End Sub
Private Sub spnClientPosX_SpinDown()
    SetWindowPos CurrhWnd, 0, _
        ConvertToPix(Val(txtWinPosX_Client.Text) - ModifFactor), _
        ConvertToPix(Val(txtWinPosY_Client.Text)), 0, 0, SWP_NOSIZE Or SWP_NOACTIVATE
    txtWinPosX_Client.Text = LTrim(Str(Val(txtWinPosX_Client.Text) - ModifFactor))
    DoEvents
End Sub
Private Sub spnClientPosY_SpinUp()
    SetWindowPos CurrhWnd, 0, _
        ConvertToPix(Val(txtWinPosX_Client.Text)), _
        ConvertToPix(Val(txtWinPosY_Client.Text) + ModifFactor), 0, 0, SWP_NOSIZE Or SWP_NOACTIVATE
    txtWinPosY_Client.Text = LTrim(Str(Val(txtWinPosY_Client.Text) + ModifFactor))
    DoEvents
End Sub
Private Sub spnClientPosY_SpinDown()
    SetWindowPos CurrhWnd, 0, _
        ConvertToPix(Val(txtWinPosX_Client.Text)), _
        ConvertToPix(Val(txtWinPosY_Client.Text) - ModifFactor), 0, 0, SWP_NOSIZE Or SWP_NOACTIVATE
    txtWinPosY_Client.Text = LTrim(Str(Val(txtWinPosY_Client.Text) - ModifFactor))
    DoEvents
End Sub


Private Sub Form_Load()
Dim cpt As Integer
Dim pnt As POINTAPI

    On Error Resume Next
    ' Test if the XtTools DLL is present
    XtChildWindowFromPoint Me.hwnd, pnt
    If Err.Number = 48 Then
        MsgBox "Le fichier ""XtTools.dll"" est introuvable." & vbCrLf & _
                     "Veuillez vérifier qu'il se trouve dans le dossier """ & SystemDirectory() & """.", vbCritical + vbOKOnly
        Unload Me
        End
    End If
    
    Me.Caption = "Xt Tools    (v " & App.Major & "." & App.Minor & "." & App.Revision & ")"
    CurrhWnd = -1
    Tppx = Screen.TwipsPerPixelX
    Tppy = Screen.TwipsPerPixelY
    Unit = 0
    UnitScale = Tppx
    cboUnit.ListIndex = 0
    txtModifFactor.Text = "5"
    HexMode = True
    SysColor_Back = GetSysColor(15)
    txtWinName.BackColor = SysColor_Back
    txtWinClass.BackColor = SysColor_Back
    picFormIcon.BackColor = SysColor_Back
    picFormIconSmall.BackColor = SysColor_Back
    txtWinName.Tag = 0
    ModifFactor = 5
    TxtLength = 255
    WinIsCloseable = True
    ShowWinInfos = False
    ShowProcesses = False
    ShowThreads = False
    ShowWindows = False
    For cpt = 1 To 14
        Toolbar1.Buttons(cpt).MixedState = True
        Toolbar1.Buttons(cpt).Enabled = False
    Next cpt
    Toolbar1.Buttons(25).MixedState = True
    Toolbar1.Buttons(25).Enabled = False
    MyCurrPID = GetCurrentProcessId()

    Call BitBlt(picViseur.HDC, 2, 2, 17, 17, picMask.HDC, 0, 0, SRCAND)
    Call BitBlt(picViseur.HDC, 2, 2, 17, 17, picSpr.HDC, 0, 0, SRCINVERT)
    picViseur.Refresh
    picViseur.ScaleMode = 3
    
    SetWindowPos frmWindowsList.hwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE Or SWP_NOMOVE
    Comm1 = 4  'used in Form_Resize
End Sub


Private Sub spnAutoRefresh_SpinDown()
    If Val(txtAutoRefresh.Text) <= 0 Then Exit Sub
    txtAutoRefresh.Text = Val(txtAutoRefresh.Text) - 1
    Timer1.Interval = Val(txtAutoRefresh.Text)
    DoEvents
End Sub
Private Sub spnAutoRefresh_SpinUp()
    If Val(txtAutoRefresh.Text) >= 65000 Then Exit Sub
    txtAutoRefresh.Text = Val(txtAutoRefresh.Text) + 1
        Timer1.Interval = Val(txtAutoRefresh.Text)
    DoEvents
End Sub

Private Sub spnModifFactor_SpinDown()
    If Val(txtModifFactor.Text) <= 0 Then Exit Sub
    txtModifFactor.Text = Val(txtModifFactor.Text) - 1
        ModifFactor = Val(txtModifFactor.Text)
    DoEvents
End Sub
Private Sub spnModifFactor_SpinUp()
    If Val(txtModifFactor.Text) >= 250 Then Exit Sub
    txtModifFactor.Text = Val(txtModifFactor.Text) + 1
        ModifFactor = Val(txtModifFactor.Text)
    DoEvents
End Sub


Public Sub EnableXtTools()
Dim cpt As Byte
    
    txtWinName.Enabled = True: txtWinClass.Enabled = True
    spnWinWidth.Enabled = True: spnWinHeight.Enabled = True
    spnWinPosX.Enabled = True: spnWinPosY.Enabled = True
    txtWinWidth.Enabled = True:    txtWinHeight.Enabled = True
    txtWinPosX.Enabled = True:    txtWinPosY.Enabled = True
    cmdReleaseWindow.Enabled = True
    
    For cpt = 1 To 14
        Toolbar1.Buttons(cpt).MixedState = False
        Toolbar1.Buttons(cpt).Enabled = True
    Next cpt
    Toolbar1.Buttons(25).MixedState = False
    Toolbar1.Buttons(25).Enabled = True
End Sub
Public Sub DisableXtTools()
Dim cpt As Byte
Dim ret As Long

    txtWinName.Text = "":    txtWinClass.Text = ""
    txtWinName.Enabled = False:  txtWinClass.Enabled = False
    lblWinHandle.Caption = "": lblIsPureWindow.Caption = ""
    lblWinInstance.Caption = "": lblWinHDC.Caption = ""
    txtWinWidth.Text = "":    txtWinHeight.Text = ""
    txtWinPosX.Text = "":    txtWinPosY.Text = ""
    txtWinWidth.Enabled = False:    txtWinHeight.Enabled = False
    txtWinPosX.Enabled = False:    txtWinPosY.Enabled = False
    txtWinPosX_Client.Text = "": txtWinPosY_Client.Text = ""
    cmdReleaseWindow.Enabled = False

    picFormIcon.Cls
    picFormIconSmall.Cls

    spnWinWidth.Enabled = False:     spnWinHeight.Enabled = False
    spnWinPosX.Enabled = False:     spnWinPosY.Enabled = False
    
    For cpt = 1 To 14
        Toolbar1.Buttons(cpt).Value = tbrUnpressed
        Toolbar1.Buttons(cpt).MixedState = True
        Toolbar1.Buttons(cpt).Enabled = False
    Next cpt
    Toolbar1.Buttons(25).MixedState = True
    Toolbar1.Buttons(25).Enabled = False

End Sub

Private Sub Toolbar1_ButtonMenuClick(ByVal ButtonMenu As MSComctlLib.ButtonMenu)
Dim TID As Long, PID As Long
    
TID = GetWindowThreadProcessId(CurrhWnd, PID)

    If ButtonMenu.Parent.Key = "Infos" Then
        Select Case ButtonMenu.Index
            Case 1
                If Not ShowWinInfos Then frmWinInfos.Show Else frmWinInfos.SetFocus
            Case 2
                frmProcessInfos.PID = PID
                frmProcessInfos.RefreshProcessInfo
                frmProcessInfos.Visible = True
            Case 3
                frmThreadInfos.TID = TID
                frmThreadInfos.RefreshThreadInfo
                frmThreadInfos.Visible = True
        End Select
    ElseIf ButtonMenu.Parent.Key = "Other Tools" Then
        Select Case ButtonMenu.Index
            Case 1
                cmdLockRedraw_Click
            Case 2
                cmdSaveBitmap_Click
            Case 3
                cmdSwitchCloseable_Click
        End Select
    End If
End Sub


Private Sub Toolbar1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Dim i  As Long
    If (X < 0) Or (Y < 0) Then Exit Sub
    
    If (X < Toolbar1.Buttons(15).Left) Then
        i = (X \ Toolbar1.ButtonWidth) + 1
        StatusBar1.SimpleText = Toolbar1.Buttons(i).ToolTipText
        Toolbar1.ToolTipText = Toolbar1.Buttons(i).ToolTipText
    ElseIf (X < Toolbar1.Buttons(18).Left) Then
        i = (X \ Toolbar1.ButtonWidth) + 2
        StatusBar1.SimpleText = Toolbar1.Buttons(i).ToolTipText
        Toolbar1.ToolTipText = Toolbar1.Buttons(i).ToolTipText
    ElseIf (X < Toolbar1.Buttons(22).Left) Then
        i = (X \ Toolbar1.ButtonWidth) + 2
        StatusBar1.SimpleText = Toolbar1.Buttons(i).ToolTipText
        Toolbar1.ToolTipText = Toolbar1.Buttons(i).ToolTipText
    ElseIf (X < Toolbar1.Buttons(24).Left) Then
        StatusBar1.SimpleText = Toolbar1.Buttons(23).ToolTipText
        Toolbar1.ToolTipText = Toolbar1.Buttons(23).ToolTipText
    ElseIf (X < Toolbar1.Buttons(25).Left + Toolbar1.Buttons(25).Width) Then
        StatusBar1.SimpleText = Toolbar1.Buttons(25).ToolTipText
        Toolbar1.ToolTipText = Toolbar1.Buttons(25).ToolTipText
    Else
        Toolbar1.ToolTipText = ""
    End If

Fin:
    tmrStatusBar.Enabled = False: DoEvents
    tmrStatusBar.Enabled = True
End Sub

Private Sub txtAutoRefresh_Change()
    If Not IsNumeric(txtAutoRefresh.Text) Then txtAutoRefresh.Text = "20"
    txtAutoRefresh.Text = IIf(Val(txtAutoRefresh.Text) > 65530, "65530", txtAutoRefresh.Text)
    Timer1.Interval = Val(txtAutoRefresh.Text)
End Sub

Private Sub txtModifFactor_Change()
    If Not IsNumeric(txtModifFactor.Text) Then txtModifFactor.Text = "2"
    txtModifFactor.Text = IIf(Val(txtModifFactor.Text) <= 0, "1", txtModifFactor.Text)
    ModifFactor = Val(txtModifFactor.Text)
End Sub

Private Sub txtWinName_Change()
    If picViseur.Tag = 0 Then
        SetWindowText CurrhWnd, txtWinName.Text
        cmdRefresh_Click
    End If
End Sub

Private Sub txtWinName_DblClick()
    txtWinName.Locked = (txtWinName.Tag = 1)
    txtWinName.Tag = IIf(txtWinName.Tag = 0, 1, 0)
    txtWinName.BackColor = IIf(txtWinName.Tag = 0, SysColor_Back, QBColor(15))
    txtWinName.SetFocus
    txtWinName.SelStart = 0
    txtWinName.SelLength = 0
End Sub

Private Sub txtWinName_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then txtWinName_DblClick
End Sub

Public Sub ChangeUnit(u As Byte)
    Unit = u
    
    If Unit = 0 Then
        UnitScale = Tppx
        txtModifFactor.Text = Val(txtModifFactor.Text) \ Tppy
        
        If CurrhWnd <= 0 Then Exit Sub
        txtWinWidth.Text = Val(txtWinWidth.Text) \ Tppx
        txtWinHeight.Text = Val(txtWinHeight.Text) \ Tppy
        txtWinPosX.Text = Val(txtWinPosX.Text) \ Tppx
        txtWinPosY.Text = Val(txtWinPosY.Text) \ Tppy
    End If
    
    If Unit = 1 Then
        UnitScale = 1
        txtModifFactor.Text = Val(txtModifFactor.Text) * Tppy
        
        If CurrhWnd <= 0 Then Exit Sub
        txtWinWidth.Text = Val(txtWinWidth.Text) * Tppx
        txtWinHeight.Text = Val(txtWinHeight.Text) * Tppy
        txtWinPosX.Text = Val(txtWinPosX.Text) * Tppx
        txtWinPosY.Text = Val(txtWinPosY.Text) * Tppy
    End If
    
End Sub

Public Function ConvertToPix(ByVal a As Single) As Long
If Unit = 0 Then
    ConvertToPix = CLng(a)
Else
    ConvertToPix = CLng(a / Tppx)
End If
End Function
Public Function ConvertToCurrUnit(ByVal a As Single) As Long
If Unit = 0 Then
    ConvertToCurrUnit = CLng(a)
Else
    ConvertToCurrUnit = CLng(a * Tppx)
End If
End Function
Public Sub SelectWinInList()
Dim cpt As Long
    If frmWindowsList.Visible Then
        For cpt = 1 To frmWindowsList.ListView1.ListItems.Count
            If CLng(IIf(HexMode, "&H", "") _
             & frmWindowsList.ListView1.ListItems(cpt).SubItems(1)) = CurrhWnd Then
                frmWindowsList.ListView1.ListItems(cpt).Bold = True
                frmWindowsList.CurrWindowsIndex = cpt
            Else
                frmWindowsList.ListView1.ListItems(cpt).Bold = False
            End If
        Next cpt
    End If
End Sub

Private Sub InvertWindowDC(Handle As Long)
Dim MyRect As RECT
    GetWindowRect Handle, MyRect

    MyRect.Right = MyRect.Right - MyRect.Left
    MyRect.Bottom = MyRect.Bottom - MyRect.Top
    MyRect.Left = 0
    MyRect.Top = 0
    
    Call InvertRect(GetWindowDC(Handle), MyRect)
    DoEvents
End Sub

Private Sub txtWinWidth_Change()
Dim OldTimerState As Boolean
Dim WinRec As RECT

    If (txtWinWidth.Text = "") Or (txtWinWidth.Tag = 0) Then Exit Sub
    
    OldTimerState = Timer1.Enabled
    Timer1.Enabled = False
    DoEvents
    While (GettingPrimaryWinInfos):   DoEvents:   Wend    ' Wait for Timer1 to finished
    If Not IsNumeric(txtWinWidth.Text) Then
        MsgBox "Entrez ici un entier positif.", vbInformation + vbOKOnly, "Saise incorrecte"
        txtWinWidth.SetFocus
        Timer1.Enabled = OldTimerState
        Exit Sub
    End If
    
    GetWindowRect CurrhWnd, WinRec
    SetWindowPos CurrhWnd, 0, 0, 0, _
                        ConvertToPix(CLng(Val(txtWinWidth.Text))), _
                        ConvertToPix(WinRec.Bottom - WinRec.Top), SWP_NOMOVE Or SWP_NOACTIVATE
    txtWinWidth.Tag = 0: DoEvents
    txtWinWidth.Text = Trim(Str(CLng(Val(txtWinWidth.Text))))  'Reformating number  (prevent "056")
    txtWinWidth.Tag = 1
    Timer1.Enabled = OldTimerState
End Sub
Private Sub txtWinHeight_Change()
Dim OldTimerState As Boolean
Dim WinRec As RECT

    If (txtWinHeight.Text = "") Or (txtWinHeight.Tag = 0) Then Exit Sub
    
    OldTimerState = Timer1.Enabled
    Timer1.Enabled = False
    DoEvents
    While (GettingPrimaryWinInfos):   DoEvents:   Wend    ' Wait for Timer1 to finished
    If Not IsNumeric(txtWinHeight.Text) Then
        MsgBox "Entrez ici un entier positif.", vbInformation + vbOKOnly, "Saise incorrecte"
        txtWinHeight.SetFocus
        Timer1.Enabled = OldTimerState
        Exit Sub
    End If
    
    GetWindowRect CurrhWnd, WinRec
    SetWindowPos CurrhWnd, 0, 0, 0, _
                        ConvertToPix(WinRec.Right - WinRec.Left), _
                        ConvertToPix(CLng(Val(txtWinHeight.Text))), SWP_NOMOVE Or SWP_NOACTIVATE
    txtWinHeight.Tag = 0: DoEvents
    txtWinHeight.Text = Trim(Str(CLng(Val(txtWinHeight.Text))))  'Reformating number  (prevent "056")
    txtWinHeight.Tag = 1
    Timer1.Enabled = OldTimerState
End Sub

Private Sub txtWinPosX_Change()
Dim OldTimerState As Boolean
Dim WinRec As RECT

    If (txtWinPosX.Text = "") Or (txtWinPosX.Tag = 0) Then Exit Sub
    
    OldTimerState = Timer1.Enabled
    Timer1.Enabled = False
    DoEvents
    While (GettingPrimaryWinInfos):   DoEvents:   Wend    ' Wait for Timer1 to finished
    If Not IsNumeric(txtWinPosX.Text) Then
        MsgBox "Entrez ici un entier positif.", vbInformation + vbOKOnly, "Saise incorrecte"
        txtWinPosX.SetFocus
        Timer1.Enabled = OldTimerState
        Exit Sub
    End If
    
    GetWindowRect CurrhWnd, WinRec
    SetWindowPos CurrhWnd, 0, _
                        ConvertToPix(CLng(Val(txtWinPosX.Text))), _
                        ConvertToPix(WinRec.Top), 0, 0, SWP_NOSIZE Or SWP_NOACTIVATE
    txtWinPosX.Tag = 0: DoEvents
    txtWinPosX.Text = Trim(Str(CLng(Val(txtWinPosX.Text))))  'Reformating number  (prevent "056")
    txtWinPosX.Tag = 1
    Timer1.Enabled = OldTimerState
End Sub
Private Sub txtWinPosY_Change()
Dim OldTimerState As Boolean
Dim WinRec As RECT

    If (txtWinPosY.Text = "") Or (txtWinPosY.Tag = 0) Then Exit Sub
    
    OldTimerState = Timer1.Enabled
    Timer1.Enabled = False
    DoEvents
    While (GettingPrimaryWinInfos):   DoEvents:   Wend    ' Wait for Timer1 to finished
    If Not IsNumeric(txtWinPosY.Text) Then
        MsgBox "Entrez ici un entier positif.", vbInformation + vbOKOnly, "Saise incorrecte"
        txtWinPosY.SetFocus
        Timer1.Enabled = OldTimerState
        Exit Sub
    End If
    
    GetWindowRect CurrhWnd, WinRec
    SetWindowPos CurrhWnd, 0, _
                        ConvertToPix(WinRec.Left), _
                        CLng(Val(txtWinPosY.Text)), 0, 0, SWP_NOSIZE Or SWP_NOACTIVATE
    txtWinPosY.Tag = 0: DoEvents
    txtWinPosY.Text = Trim(Str(CLng(Val(txtWinPosY.Text))))  'Reformating number  (prevent "056")
    txtWinPosY.Tag = 1
    Timer1.Enabled = OldTimerState
End Sub

Private Sub txtWinWidth_GotFocus()
    txtWinWidth.Tag = 1
End Sub
Private Sub txtWinWidth_LostFocus()
    txtWinWidth.Tag = 0
End Sub
Private Sub txtWinHeight_GotFocus()
    txtWinHeight.Tag = 1
End Sub
Private Sub txtWinHeight_LostFocus()
    txtWinHeight.Tag = 0
End Sub
Private Sub txtWinPosX_GotFocus()
    txtWinPosX.Tag = 1
End Sub
Private Sub txtWinPosX_LostFocus()
    txtWinPosX.Tag = 0
End Sub
Private Sub txtWinPosY_GotFocus()
    txtWinPosY.Tag = 1
End Sub
Private Sub txtWinPosY_LostFocus()
    txtWinPosY.Tag = 0
End Sub

