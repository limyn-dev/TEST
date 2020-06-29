Attribute VB_Name = "ModwND"
Option Explicit



'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ API §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

' Windows
Declare Function EnumWindows Lib "user32.dll" (ByVal lpEnumFunc As Long, ByVal lParam As Long) As Long
Declare Function GetWindowText Lib "user32.dll" Alias "GetWindowTextA" (ByVal hWnd As Long, ByVal lpString As String, ByVal nMaxCount As Long) As Long
Declare Function GetWindowTextLength Lib "user32.dll" Alias "GetWindowTextLengthA" (ByVal hWnd As Long) As Long

' Classe
Declare Function GetClassLong Lib "user32.dll" Alias "GetClassLongA" (ByVal hWnd As Long, ByVal nIndex As Long) As Long
Declare Function GetClassName Lib "user32.dll" Alias "GetClassNameA" (ByVal hWnd As Long, ByVal lpClassName As String, ByVal nMaxCount As Long) As Long
   
' Child
Declare Function EnumChildWindows Lib "user32.dll" (ByVal hWndParent As Long, ByVal lpEnumFunc As Long, ByVal lParam As Long) As Long
Declare Function GetProp Lib "user32.dll" Alias "GetPropA" (ByVal hWnd As Long, ByVal lpString As String) As Long
   
' Propriétés
Declare Function EnumPropsEx Lib "user32.dll" Alias "EnumPropsExA" (ByVal hWnd As Long, ByVal lpEnumFunc As Long, ByVal lParam As Long) As Long

' Fonctions kernel
Declare Function lstrlen Lib "kernel32.dll" Alias "lstrlenA" (ByVal lpString As Any) As Long
Declare Function lstrcpy Lib "kernel32.dll" Alias "lstrcpyA" (ByVal lpString1 As Any, ByVal lpString2 As Any) As Long
Declare Function GlobalLock Lib "kernel32.dll" (ByVal hMem As Long) As Long
Declare Function GlobalUnlock Lib "kernel32.dll" (ByVal hMem As Long) As Long

'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ TYPES §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

Type T_Pos
   left As Long
   top As Long
   right As Long
   bottom As Long
End Type

Type T_Wnd
   Hdl As Long
   Nom As String
   ClsNom As String
   Pos As T_Pos
End Type



'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ GLOBALES §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
 
Public pros As ListView
Public wnds As TreeView
Private clePere As String
Public wndv As RichTextBox



'§§§§§§§§§§§§§§§§§§§§§§§§ AFFICHAGE DANS UN TREEVIEW §§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Initialise le trv
'==============================================================================
Public Sub trvIni()
   Dim result As Long
   
   With wnds
      .Nodes.Clear
      .FullRowSelect = True
      .Style = tvwTreelinesPlusMinusText
      .SingleSel = False
      .HideSelection = False
      .LabelEdit = tvwManual
   End With
   
   ' Chargement des windows du top
   result = EnumWindows(AddressOf wndTop_Bak, 0)
   
End Sub

'------------------------------------------------------------------------------
' Charge le treeview avec les enfants
'==============================================================================
Public Sub trvAdd(ByRef trv As TreeView, pere As String)
   Dim result As Long
   
   ' Initialisation de la cle du père
   clePere = pere
   
   ' Ajout des enfants dans le treeview
   result = EnumChildWindows(cleHdl(clePere), AddressOf wndChd_Bak, 0)
   
End Sub



'§§§§§§§§§§§§§§§§§§§§§§§§§§ VALEURS D'UNE WINDOWS §§§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Affichage des valeur de la windows dans une textbox
'==============================================================================
Public Sub txtSet(cle As String)
   Dim wnd As T_Wnd
   
   ' Valorisation de la variable
   wnd = wndSet(cleHdl(cle))
   
   ' Affichage des valeurs
   With wndv
      .Text = "NOM DE LA FENETRE    : " & vbNewLine & vbTab & _
               wnd.Nom & vbNewLine & _
              "HANDEL DE LA FENETRE : " & vbNewLine & vbTab & _
               CStr(wnd.Hdl) & vbNewLine & _
              "nOM DE LA CLASSE     : " & vbNewLine & vbTab & _
               wnd.ClsNom
   End With
   
End Sub




'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ WINDOWS §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Valorisation d'une variable de type t_Wnd
'==============================================================================
Private Function wndSet(hdlwnd As Long) As T_Wnd

   wndSet.Hdl = hdlwnd
   
   ' Nom de la nouvelle windows
   wndNom wndSet
   
   ' Nom de la classe de la nouvelle windows
   ClsNom wndSet
   
End Function

'------------------------------------------------------------------------------
' Nom d'une fenêtre en fonction de son handel
'==============================================================================
Private Sub wndNom(ByRef wnd As T_Wnd)
   Dim nomLng As Long
   
   If wnd.Hdl > 0 Then
   
      ' Longueur du nom
      nomLng = GetWindowTextLength(wnd.Hdl) + 1
      
      ' Contrôle l'existance du nom de la windows
      If nomLng <= 1 Then
         'wnd.Nom = "Sans nom (" & CStr(wnd.Hdl) & ")"
         wnd.Nom = ""
      Else
         wnd.Nom = Space(nomLng)
         nomLng = GetWindowText(wnd.Hdl, wnd.Nom, nomLng)
         If Not nomLng > 0 Then wnd.Nom = "Erreur wndNom"
      End If
      
   Else
      wnd.Nom = ""
   End If
   
End Sub

'------------------------------------------------------------------------------
' Fonction de call back de la fonction d'énumération des windows
'==============================================================================
Private Function wndTop_Bak(ByVal hdlwnd As Long, ByVal lParam As Long) As Long
   Dim wnd As T_Wnd
   Dim cle As String
   
   Dim numHdl As Integer
   
   ' Valorisation de la windows
   wnd = wndSet(hdlwnd)
   
   ' insértion des valeurs des windows
   If wnd.Nom <> "" Then
      With wnds.Nodes
  
         ' Ajout de l'élément
         On Error Resume Next
         .Add , , hdlCle(wnd.Hdl), wnd.ClsNom & " - " & wnd.Nom
      
      End With
   End If
   
   wndTop_Bak = 1
   
End Function

'------------------------------------------------------------------------------
' Windows enfant de la windows
'==============================================================================
Public Function wndChd_Bak(ByVal hdlwnd As Long, ByVal lParam As Long) As Long
   Dim wnd As T_Wnd
   Dim dsc As String
   
   ' Valorisation de la windows
   wnd = wndSet(hdlwnd)
   
   ' Déscription
   dsc = wnd.ClsNom & ": " & wnd.Nom
   
   ' Ajout dans le treeview
   With wnds.Nodes
   
      ' Contrôle si noeud racine
      If clePere = "" Then
         On Error Resume Next
         .Add , , hdlCle(hdlwnd), dsc
      Else
         On Error Resume Next
         .Add clePere, tvwChild, hdlCle(hdlwnd, clePere), dsc
      End If
      
   End With
  
   wndChd_Bak = 1
   
End Function

'------------------------------------------------------------------------------
' Gestion des clefs
'==============================================================================
Private Function hdlCle(ByVal hdlwnd As Long, Optional clePere As String = "") As String

   hdlCle = CStr(hdlwnd) & "_" & clePere
      
End Function
Private Function cleHdl(ByVal cle As String) As Long
   Dim numCar As Integer
   
   numCar = 1
   While Mid(cle, numCar, 1) <> "_"
      numCar = numCar + 1
   Wend
   
   cleHdl = CLng(left(cle, numCar - 1))
   
End Function



'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ CLASSES §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Numéro de la classe d'une fenêtre
'==============================================================================
Private Sub ClsNom(wnd As T_Wnd)
   Dim nomLng As Long

   ' Initialisation du nom de la classe
   wnd.ClsNom = Space(255)
   
   ' Saisie du nom de la classe
   nomLng = GetClassName(wnd.Hdl, wnd.ClsNom, 255)

   ' Suppression des caractères superflus
   wnd.ClsNom = left(wnd.ClsNom, nomLng)

End Sub



'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ PROPRIETES §§§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Liste les propriétés d'une windows
'==============================================================================
Public Function proVal(ByVal hdata As Long) As String
   Dim pData As Long  ' handle and pointer to the property's data
   Dim strvalue As String  ' receives the value of the window property (in this case)
   Dim retval As Long  ' return value
   
   ' If that property didn't exist, alert the user.
   If hdata > 0 Then
      
      ' Get a pointer to the data retrieved.
      pData = GlobalLock(hdata)
      
      ' Copy the string data into the string.
      strvalue = Space(lstrlen(pData))
      retval = lstrcpy(strvalue, pData)
      
      ' Unlock the data block.
      retval = GlobalUnlock(hdata)
      
      ' Display the string gotten from the data block.
      MsgBox "Valeur: " & strvalue
      
   End If

End Function

'------------------------------------------------------------------------------
' Liste les propriétés d'une windows
'==============================================================================
Public Sub proSet(cle As String)
   Dim hdlwnd As Long
   Dim retval As Long
   
   ' Calcul du handel
   hdlwnd = cleHdl(cle)
   
   ' Initialisation de la listeview
   With pros
   
      ' Suppression des élément existants
      If .ListItems.Count > 0 Then .ListItems.Clear
      
      ' Mode d'affichage rapport
      .View = lvwReport
      
      ' Nombre de colonnes
      While .ColumnHeaders.Count < 3
         .ColumnHeaders.Add
      Wend
      
      ' Nom des colonnes
      .ColumnHeaders(1).Text = "HANDEL"
      .ColumnHeaders(2).Text = "NOM"
      .ColumnHeaders(3).Text = "hData"
   
   End With
   
   ' Insértion des valeurs
   retval = EnumPropsEx(hdlwnd, AddressOf proLst_Bak, 0)

End Sub

'------------------------------------------------------------------------------
' Liste les propriétés d'une windows
'==============================================================================
Private Function proLst_Bak(ByVal hWnd As Long, ByVal lpszString As Long, ByVal hdata As Long, ByVal dwData As Long) As Long
   Dim str As String
   Dim cle As String
   Dim retval As Long

   
   With pros.ListItems
      
      ' Calcul de la clef
      cle = CStr(.Count + 1) & "_"
   
      ' Ajout de la propriété
      .Add , cle, CStr(hWnd)
      
      ' Ajout du nom
      str = Space(lstrlen(lpszString))
      retval = lstrcpy(str, lpszString)
      .Item(cle).SubItems(1) = str
      
      ' Ajout du hData
      str = Space(lstrlen(hdata))
      retval = lstrcpy(str, hdata)
      .Item(cle).SubItems(2) = str
      
   End With
   
   ' Propriétés suivante
   proLst_Bak = 1
  
End Function


