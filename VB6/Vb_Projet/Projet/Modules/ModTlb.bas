Attribute VB_Name = "ModTlb"
Option Explicit

'------------------------------------------------------------------------------
' Initialisation de la toolbar
'==============================================================================
Public Sub initialise(ByRef tlb As Toolbar, ByRef iml As ImageList)
   
   ' Initialisation de l'image list
   With tlb
      .ImageList = iml
      .DisabledImageList = iml
      .HotImageList = iml
      .Appearance = cc3D
      .AllowCustomize = True
      .TextAlignment = tbrTextAlignBottom
      .Style = tbrFlat
   End With
   
End Sub

'------------------------------------------------------------------------------
' Ajout d'un boutton dans la toolbar
'==============================================================================
Sub btnAdd(ByRef tlb As Toolbar, stl As ButtonStyleConstants, txt As Variant, Optional img As Integer = 0)

   ' Ajout du boutton dans la toolbar
   If img = 0 Then
      tlb.Buttons.Add , , txt, stl
   Else
      tlb.Buttons.Add , , txt, stl, img
   End If
   
End Sub

'------------------------------------------------------------------------------
' Ajout d'un menu dans un boutton menu
'==============================================================================
Sub btmAdd(ByRef btm As ButtonMenus, txt As String, cle As String)
    
   ' Ajout du bouton
   btm.Add , cle, txt
   
End Sub

'------------------------------------------------------------------------------
' Calcul de la clef du type en fonction de son id
'==============================================================================
Public Function tpe_Key(TpeId As Long) As String

   tpe_Key = "tpe" & "_" & CStr(TpeId)
   
End Function

'------------------------------------------------------------------------------
' Calcul de l'id du type en fonction de la clef de l'item de la lsv
'==============================================================================
Public Function key_Tpe(itmKey As String) As Long

   key_Tpe = CLng(Right(itmKey, Len(itmKey) - 4))
   
End Function
