VERSION 5.00
Object = "{98C453C0-5030-11D0-B2C5-444553540000}#1.0#0"; "SYSINFO.OCX"
Begin VB.Form Form1 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "System Info OCX Demo"
   ClientHeight    =   7080
   ClientLeft      =   1050
   ClientTop       =   1440
   ClientWidth     =   6660
   Icon            =   "SysInfo.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   7080
   ScaleWidth      =   6660
   ShowInTaskbar   =   0   'False
   Begin VB.Timer Timer 
      Interval        =   1000
      Left            =   5520
      Top             =   120
   End
   Begin VB.Frame Frame5 
      Caption         =   "Memory"
      Height          =   1815
      Left            =   3480
      TabIndex        =   42
      Top             =   600
      Width           =   3015
      Begin VB.TextBox txtSwapSize 
         Height          =   315
         Left            =   1560
         TabIndex        =   50
         Top             =   1320
         Width           =   1215
      End
      Begin VB.TextBox txtVirtualMemory 
         Height          =   315
         Left            =   1560
         TabIndex        =   48
         Top             =   960
         Width           =   1215
      End
      Begin VB.TextBox txtFreePhysical 
         Height          =   315
         Left            =   1560
         TabIndex        =   46
         Top             =   600
         Width           =   1215
      End
      Begin VB.TextBox txtPhysicalMemory 
         Height          =   315
         Left            =   1560
         TabIndex        =   43
         Top             =   240
         Width           =   1215
      End
      Begin VB.Label Label24 
         Caption         =   "Swap File Size:"
         Height          =   255
         Left            =   240
         TabIndex        =   51
         Top             =   1365
         Width           =   1335
      End
      Begin VB.Label Label23 
         Caption         =   "Virtual Memory:"
         Height          =   255
         Left            =   240
         TabIndex        =   49
         Top             =   1005
         Width           =   1335
      End
      Begin VB.Label Label22 
         Caption         =   "Free Physical:"
         Height          =   255
         Left            =   240
         TabIndex        =   47
         Top             =   645
         Width           =   1335
      End
      Begin VB.Label Label20 
         Caption         =   "Physical Memory:"
         Height          =   255
         Left            =   240
         TabIndex        =   44
         Top             =   285
         Width           =   1335
      End
   End
   Begin VB.Frame Frame4 
      Caption         =   "Disk"
      Height          =   1815
      Left            =   3480
      TabIndex        =   33
      Top             =   2520
      Width           =   3015
      Begin VB.TextBox txtFreeSpace 
         Height          =   315
         Left            =   1320
         TabIndex        =   40
         Top             =   1320
         Width           =   1455
      End
      Begin VB.TextBox txtFileSystem 
         Height          =   315
         Left            =   1320
         TabIndex        =   38
         Top             =   600
         Width           =   1455
      End
      Begin VB.TextBox txtDiskSpace 
         Height          =   315
         Left            =   1320
         TabIndex        =   36
         Top             =   960
         Width           =   1455
      End
      Begin VB.DriveListBox Drive 
         Height          =   315
         Left            =   1320
         TabIndex        =   35
         Top             =   240
         Width           =   1455
      End
      Begin VB.Label Label19 
         Caption         =   "Free Space:"
         Height          =   255
         Left            =   240
         TabIndex        =   41
         Top             =   1365
         Width           =   1095
      End
      Begin VB.Label Label18 
         Caption         =   "File System:"
         Height          =   255
         Left            =   240
         TabIndex        =   39
         Top             =   645
         Width           =   1095
      End
      Begin VB.Label Label17 
         Caption         =   "Space:"
         Height          =   255
         Left            =   240
         TabIndex        =   37
         Top             =   1005
         Width           =   1095
      End
      Begin VB.Label Label16 
         Caption         =   "Disk Name:"
         Height          =   255
         Left            =   240
         TabIndex        =   34
         Top             =   285
         Width           =   975
      End
   End
   Begin VB.Frame Frame3 
      Caption         =   "Hardware devices and Components"
      Height          =   1935
      Left            =   3480
      TabIndex        =   29
      Top             =   4440
      Width           =   3015
      Begin VB.TextBox txtDevice 
         Height          =   975
         Left            =   240
         MultiLine       =   -1  'True
         ScrollBars      =   3  'Both
         TabIndex        =   32
         Text            =   "SysInfo.frx":000C
         Top             =   840
         Width           =   2535
      End
      Begin VB.ComboBox comDevice 
         Height          =   315
         Left            =   960
         Style           =   2  'Dropdown List
         TabIndex        =   30
         Top             =   360
         Width           =   1815
      End
      Begin VB.Label Label15 
         Caption         =   "Name:"
         Height          =   255
         Left            =   240
         TabIndex        =   31
         Top             =   400
         Width           =   615
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "System"
      Height          =   3735
      Left            =   120
      TabIndex        =   9
      Top             =   600
      Width           =   3135
      Begin VB.TextBox txtBuildNumber 
         Height          =   315
         Left            =   1560
         TabIndex        =   28
         Top             =   3240
         Width           =   1335
      End
      Begin VB.TextBox txtPlatform 
         Height          =   315
         Left            =   1560
         TabIndex        =   26
         Top             =   2520
         Width           =   1335
      End
      Begin VB.TextBox txtOSVersion 
         Height          =   315
         Left            =   1560
         TabIndex        =   24
         Top             =   2880
         Width           =   1335
      End
      Begin VB.TextBox txtVirtualMachines 
         Height          =   315
         Left            =   1560
         TabIndex        =   22
         Top             =   2160
         Width           =   1335
      End
      Begin VB.TextBox txtThreads 
         Height          =   315
         Left            =   1560
         TabIndex        =   20
         Top             =   1800
         Width           =   1335
      End
      Begin VB.TextBox txtProcessorUsage 
         Height          =   315
         Left            =   1560
         TabIndex        =   17
         Top             =   1440
         Width           =   1335
      End
      Begin VB.TextBox txtProcessorType 
         Height          =   315
         Left            =   1560
         TabIndex        =   15
         Top             =   1080
         Width           =   1335
      End
      Begin VB.TextBox txtUserName 
         Height          =   315
         Left            =   1560
         TabIndex        =   13
         Top             =   720
         Width           =   1335
      End
      Begin VB.TextBox txtComputerName 
         Height          =   315
         Left            =   1560
         TabIndex        =   11
         Top             =   360
         Width           =   1335
      End
      Begin VB.Label Label14 
         Caption         =   "BuildNumber:"
         Height          =   255
         Left            =   240
         TabIndex        =   27
         Top             =   3285
         Width           =   1335
      End
      Begin VB.Label Label13 
         Caption         =   "Platform:"
         Height          =   255
         Left            =   240
         TabIndex        =   25
         Top             =   2565
         Width           =   1335
      End
      Begin VB.Label Label12 
         Caption         =   "OS Version:"
         Height          =   255
         Left            =   240
         TabIndex        =   23
         Top             =   2925
         Width           =   1335
      End
      Begin VB.Label Label10 
         Caption         =   "VirtualMachines:"
         Height          =   255
         Left            =   240
         TabIndex        =   21
         Top             =   2205
         Width           =   1335
      End
      Begin VB.Label Label9 
         Caption         =   "Threads"
         Height          =   255
         Left            =   240
         TabIndex        =   19
         Top             =   1845
         Width           =   1335
      End
      Begin VB.Label Label8 
         Caption         =   "ProcessorUsage:"
         Height          =   255
         Left            =   240
         TabIndex        =   16
         Top             =   1485
         Width           =   1335
      End
      Begin VB.Label Label7 
         Caption         =   "ProcessorType:"
         Height          =   255
         Left            =   240
         TabIndex        =   14
         Top             =   1125
         Width           =   1215
      End
      Begin VB.Label Label6 
         Caption         =   "UserName:"
         Height          =   255
         Left            =   240
         TabIndex        =   12
         Top             =   765
         Width           =   855
      End
      Begin VB.Label Label5 
         Caption         =   "ComputerName:"
         Height          =   255
         Left            =   240
         TabIndex        =   10
         Top             =   405
         Width           =   1215
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Battery"
      Height          =   1935
      Left            =   120
      TabIndex        =   0
      Top             =   4440
      Width           =   3135
      Begin VB.TextBox txtPercent 
         Height          =   315
         Left            =   1080
         TabIndex        =   8
         Top             =   1080
         Width           =   1815
      End
      Begin VB.TextBox txtStatus 
         Height          =   285
         Left            =   1080
         TabIndex        =   6
         Top             =   1440
         Width           =   1815
      End
      Begin VB.TextBox txtLifeTime 
         Height          =   315
         Left            =   1080
         TabIndex        =   4
         Top             =   720
         Width           =   1815
      End
      Begin VB.TextBox txtACOnLine 
         Height          =   315
         Left            =   1080
         TabIndex        =   2
         Top             =   360
         Width           =   1815
      End
      Begin VB.Label Label4 
         Caption         =   "Percent:"
         Height          =   255
         Left            =   240
         TabIndex        =   7
         Top             =   1125
         Width           =   855
      End
      Begin VB.Label Label3 
         Caption         =   "Status:"
         Height          =   255
         Left            =   240
         TabIndex        =   5
         Top             =   1485
         Width           =   855
      End
      Begin VB.Label Label2 
         Caption         =   "LifeTime:"
         Height          =   255
         Left            =   240
         TabIndex        =   3
         Top             =   760
         Width           =   855
      End
      Begin VB.Label Label1 
         Caption         =   "ACOnLine:"
         Height          =   255
         Left            =   240
         TabIndex        =   1
         Top             =   400
         Width           =   855
      End
   End
   Begin SysInfo.SysInfo SysInfo 
      Left            =   6000
      Top             =   120
      MajorVer        =   1
      MinorVer        =   0
   End
   Begin VB.Label Label21 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   $"SysInfo.frx":0012
      ForeColor       =   &H00FF0000&
      Height          =   495
      Left            =   120
      TabIndex        =   45
      Top             =   6480
      Width           =   6375
   End
   Begin VB.Label Label11 
      Caption         =   "System Info OCX"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   495
      Left            =   120
      TabIndex        =   18
      Top             =   120
      Width           =   4215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Sub UpdateAll()
  Drive_Change

  txtComputerName = SysInfo.ComputerName
  txtUserName = SysInfo.UserName
  txtProcessorType = SysInfo.ProcessorType
  txtProcessorUsage = SysInfo.ProcessorUsage
  txtThreads = SysInfo.Threads
  txtVirtualMachines = SysInfo.VirtualMachines
  txtPlatform = SysInfo.Platform
  txtOSVersion = SysInfo.OSMajorVersion & "." & SysInfo.OSMinorVersion
  txtBuildNumber = SysInfo.BuildNumber
  
  txtACOnLine = SysInfo.ACOnLine
  txtLifeTime = SysInfo.BatteryLifeTime
  txtPercent = SysInfo.BatteryPercent
  txtStatus = SysInfo.BatteryStatus
  
  txtPhysicalMemory = SysInfo.PhysicalMemory
  txtFreePhysical = SysInfo.FreePhysicalMemory
  txtVirtualMemory = SysInfo.VirtualMemory
  txtSwapSize = SysInfo.SwapSize
End Sub



Private Sub comDevice_Click()
  Select Case comDevice
    Case "CDROM"
      txtDevice = ""
      I = 0
      While SysInfo.CDROM(I) <> ""
        txtDevice = txtDevice & SysInfo.CDROM(I) & Chr(13) & Chr(10)
        I = I + 1
      Wend
    Case "Disk Drives"
      txtDevice = ""
      I = 0
      While SysInfo.DiskDrive(I) <> ""
        txtDevice = txtDevice & SysInfo.DiskDrive(I) & Chr(13) & Chr(10)
        I = I + 1
      Wend
    Case "Display Adapters"
      txtDevice = ""
      I = 0
      While SysInfo.Display(I) <> ""
        txtDevice = txtDevice & SysInfo.Display(I) & Chr(13) & Chr(10)
        I = I + 1
      Wend
    Case "Floppy disk controllers"
      txtDevice = ""
      I = 0
      While SysInfo.FDC(I) <> ""
        txtDevice = txtDevice & SysInfo.FDC(I) & Chr(13) & Chr(10)
        I = I + 1
      Wend
    Case "Hard disk controllers"
      txtDevice = ""
      I = 0
      While SysInfo.hDC(I) <> ""
        txtDevice = txtDevice & SysInfo.hDC(I) & Chr(13) & Chr(10)
        I = I + 1
      Wend
    Case "Keyboard"
      txtDevice = ""
      I = 0
      While SysInfo.Keyboard(I) <> ""
        txtDevice = txtDevice & SysInfo.Keyboard(I) & Chr(13) & Chr(10)
        I = I + 1
      Wend
    Case "Modem"
      txtDevice = ""
      I = 0
      While SysInfo.Modem(I) <> ""
        txtDevice = txtDevice & SysInfo.Modem(I) & Chr(13) & Chr(10)
        I = I + 1
      Wend
    Case "Monitor"
      txtDevice = ""
      I = 0
      While SysInfo.Monitor(I) <> ""
        txtDevice = txtDevice & SysInfo.Monitor(I) & Chr(13) & Chr(10)
        I = I + 1
      Wend
    Case "Mouse"
      txtDevice = ""
      I = 0
      While SysInfo.Mouse(I) <> ""
        txtDevice = txtDevice & SysInfo.Mouse(I) & Chr(13) & Chr(10)
        I = I + 1
      Wend
    Case "Network adapters"
      txtDevice = ""
      I = 0
      While SysInfo.NetworkAdapter(I) <> ""
        txtDevice = txtDevice & SysInfo.NetworkAdapter(I) & Chr(13) & Chr(10)
        I = I + 1
      Wend
    Case "Ports (COM & LPT)"
      txtDevice = ""
      I = 0
      While SysInfo.Port(I) <> ""
        txtDevice = txtDevice & SysInfo.Port(I) & Chr(13) & Chr(10)
        I = I + 1
      Wend
    Case "Sound, video and game controllers"
      txtDevice = ""
      I = 0
      While SysInfo.Multimedia(I) <> ""
        txtDevice = txtDevice & SysInfo.multimeda(I) & Chr(13) & Chr(10)
        I = I + 1
      Wend
    Case "System devices"
      txtDevice = ""
      I = 0
      While SysInfo.SystemDevice(I) <> ""
        txtDevice = txtDevice & SysInfo.SystemDevice(I) & Chr(13) & Chr(10)
        I = I + 1
      Wend
    Case "Net clients"
      txtDevice = ""
      I = 0
      While SysInfo.NetClient(I) <> ""
        txtDevice = txtDevice & SysInfo.NetClient(I) & Chr(13) & Chr(10)
        I = I + 1
      Wend
    Case "Protocols"
      txtDevice = ""
      I = 0
      While SysInfo.Protocol(I) <> ""
        txtDevice = txtDevice & SysInfo.Protocol(I) & Chr(13) & Chr(10)
        I = I + 1
      Wend
  End Select
End Sub



Private Sub Drive_Change()
  SysInfo.Disk = Left$(Drive, 2)
  txtFileSystem = SysInfo.DiskFileSystem
  txtDiskSpace = SysInfo.DiskSpace
  txtFreeSpace = SysInfo.DiskFreeSpace
End Sub

Private Sub Form_Load()
  UpdateAll

  comDevice.AddItem "CDROM"
  comDevice.AddItem "Disk Drives"
  comDevice.AddItem "Display Adapters"
  comDevice.AddItem "Floppy disk controllers"
  comDevice.AddItem "Hard disk controllers"
  comDevice.AddItem "Keyboard"
  comDevice.AddItem "Modem"
  comDevice.AddItem "Monitor"
  comDevice.AddItem "Mouse"
  comDevice.AddItem "Network adapters"
  comDevice.AddItem "Ports (COM & LPT)"
  comDevice.AddItem "Sound, video and game controllers"
  comDevice.AddItem "System devices"
  comDevice.AddItem "Net clients"
  comDevice.AddItem "Protocols"
  comDevice.ListIndex = 0
End Sub


Private Sub Timer_Timer()
  UpdateAll
End Sub

