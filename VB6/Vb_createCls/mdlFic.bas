Attribute VB_Name = "mdlFic"
Option Explicit



Public pathFic As String
Public packageName As String



' Création de toutes les classes des tables
'------------------------------------------------------------------------------
Public Sub createAll(txtInfo As TextBox)
    Dim tbl As Table
    
    
    If Not pathFic = "" Then
        For Each tbl In mdlDB.Catalogue.Tables
            If tbl.Type = "TABLE" Then
                txtInfo.Text = txtInfo.Text & "Create entity: " & tbl.Name & ".java" & vbCrLf
                txtInfo.Refresh
                createEntite tbl
                txtInfo.Text = txtInfo.Text & "Create vector: " & tbl.Name & "Vector.java" & vbCrLf
                txtInfo.Refresh
                createVector tbl
            End If
        Next
    End If
    
End Sub

' Création des vecteurs d'entités
'------------------------------------------------------------------------------
Private Sub createVector(tbl As Table)
    Dim numFic As Long
    Dim col As Column
    Dim nomFic As String
    
    nomFic = tbl.Name & "Vector"
    
    ' Ouverture du fichier
    numFic = FreeFile
    Open pathFic & nomFic & ".java" For Output Access Write As numFic

   ' Déclaration du package
    Print #numFic, "package " & packageName & " ;"

    ' Packages
    Print #numFic,
    Print #numFic,
    Print #numFic,
    Print #numFic, "import java.util.*;"

    ' Entête
    Print #numFic,
    Print #numFic,
    Print #numFic,
    Print #numFic, "/******************************************************************************"
    Print #numFic, "* Title      :"
    Print #numFic, "* Description:"
    Print #numFic, "* Copyright  : Copyright (c) 2002"
    Print #numFic, "* Company    : _"
    Print #numFic, "* @author    : Générateur"
    Print #numFic, "* @version   : 1.0"
    Print #numFic, "*****************************************************************************/"
    
    ' Déclaration de la class
    Print #numFic,
    Print #numFic,
    Print #numFic,
    Print #numFic, "public class C" & nomFic & " extends Vector"
    Print #numFic, "  {"

    ' Constructeur
    Print #numFic,
    Print #numFic, "  // Instanciation"
    Print #numFic, "  public C" & nomFic & "()" & "   {  super() ; myInit() ;  }"

    ' Methodes
    Print #numFic,
    Print #numFic, "  // Spécialisation de Vecteur"
    Print #numFic, "  public void     insertElementAt(C" & tbl.Name & " c, int i)  { super.insertElementAt(c, i) ; }"
    Print #numFic, "  public void     add            (int i, C" & tbl.Name & " c)  { super.add(i, c) ;             }"
    Print #numFic, "  public boolean  add            (C" & tbl.Name & " c)         { return super.add(c) ;         }"
    Print #numFic, "  public boolean  addAll         (C" & nomFic & " c)           { return super.addAll(c) ;      }"
    Print #numFic, "  public boolean  addAll         (int i, C" & nomFic & " c)    { return super.addAll(i, c) ;   }"
    Print #numFic, "  public void     addElement     (C" & tbl.Name & " c)         { super.addElement(c) ;         }"

    Print #numFic,
    Print #numFic,
    Print #numFic,
    Print #numFic, "  /**********************************************************/"
    
    ' Instanciation
    Print #numFic,
    Print #numFic,
    Print #numFic,
    Print #numFic, "  /* Instanciation"
    Print #numFic, "  ---------------------------------------------------------------------------*/"
    Print #numFic, "  private void myInit()"
    Print #numFic, "    {"
    Print #numFic, "    }"

    ' Fin de la classe
    Print #numFic,
    Print #numFic, "  }"
    
    ' Fermeture du fichier
    Close #numFic
    
End Sub

' Création d' class
'------------------------------------------------------------------------------
Private Sub createEntite(tbl As Table)
    Dim numFic As Long
    Dim col As Column
    Dim str As String
    
    ' Ouverture du fichier
    numFic = FreeFile
    Open pathFic & tbl.Name & ".java" For Output Access Write As numFic
    
    ' Déclaration du package
    Print #numFic, "package " & packageName & " ;"
    
    
    ' Entête
    Print #numFic,
    Print #numFic,
    Print #numFic,
    Print #numFic, "/******************************************************************************"
    Print #numFic, "* Title      :"
    Print #numFic, "* Description:"
    Print #numFic, "* Copyright  : Copyright (c) 2002"
    Print #numFic, "* Company    : _"
    Print #numFic, "* @author    : Générateur"
    Print #numFic, "* @version   : 1.0"
    Print #numFic, "*****************************************************************************/"
    
    ' Déclaration de la classe
    Print #numFic,
    Print #numFic,
    Print #numFic,
    Print #numFic, "public class C" & tbl.Name
    Print #numFic, "  {"
    
    ' Constructeur
    Print #numFic,
    Print #numFic, "  // Instanciation"
    Print #numFic, "  public C" & tbl.Name & "   { myInit() ;    }"
    
    ' membre
    Print #numFic, ""
    Print #numFic, "  // Membres"
    For Each col In tbl.Columns
        str = "  private " & strType(col) & " my" & col.Name & " ;"
        Print #numFic, str
    Next
    
    ' ligne des getters
    Print #numFic, ""
    Print #numFic, "  // Getters"
    For Each col In tbl.Columns
        Print #numFic, "  public " & strType(col) & " Get" & col.Name & "()  {  return my" & col.Name & ";  }"
    Next
    
    ' Ligne des setter
    Print #numFic, ""
    Print #numFic, "  // Setters"
    For Each col In tbl.Columns
        Print #numFic, "  public void " & " Set" & col.Name & "(" & strType(col) & " " & col.Name; ")  {  my" & col.Name & "=" & col.Name & ";  }"
    Next
    
    Print #numFic,
    Print #numFic,
    Print #numFic,
    Print #numFic, "  /**********************************************************/"
    
    ' Instanciation
    Print #numFic,
    Print #numFic,
    Print #numFic,
    Print #numFic, "  // Instanciation"
    Print #numFic, "  private void myInit()"
    Print #numFic, "    {"
    For Each col In tbl.Columns
        Print #numFic, "    my" & col.Name & strInit(col)
    Next
    Print #numFic, "    }"
    
    ' Fin de la classe
    Print #numFic,
    Print #numFic, "  }"
    
    ' Fermeture du fichier
    Close #numFic
    
End Sub

' Recherche du type java de la colonne de la table
'------------------------------------------------------------------------------
Private Function strType(col As Column) As String
    Select Case col.Type
        Case adBigInt, adInteger, adNumeric, adSmallInt, adTinyInt, adVarNumeric, adError, adIUnknown, adCurrency
            strType = "int "
        Case adUnsignedBigInt, adUnsignedInt, adUnsignedSmallInt, adUnsignedTinyInt
            strType = "unsigned int "
        Case adBinary, adBoolean, adVarBinary, adLongVarBinary
            strType = "boolean "
        Case adBSTR, adLongVarChar, adLongVarWChar, adVarChar, adVarWChar, adWChar
            strType = "String "
        Case adDouble, adFileTime, adDate, adDBDate, adDBTime, adDBTimeStamp
            strType = "double "
        Case adDecimal, adSingle
            strType = "single "
        Case Else
            strType = "void "
    End Select
End Function

' Recherche des valeurs d'initialisation
'------------------------------------------------------------------------------
Private Function strInit(col As Column) As String
    Select Case col.Type
        Case adBigInt, adInteger, adNumeric, adSmallInt, adTinyInt, adVarNumeric, adError, adIUnknown, adCurrency
            strInit = "= 0 ;"
        Case adUnsignedBigInt, adUnsignedInt, adUnsignedSmallInt, adUnsignedTinyInt
            strInit = "= 0 ;"
        Case adBinary, adBoolean, adVarBinary, adLongVarBinary
            strInit = "= true ;"
        Case adBSTR, adLongVarChar, adLongVarWChar, adVarChar, adVarWChar, adWChar
            strInit = "= ""No Data"" ;"
        Case adDouble, adFileTime, adDate, adDBDate, adDBTime, adDBTimeStamp
            strInit = "= 0.0 ;"
        Case adDecimal, adSingle
            strInit = "= 0.0 ; "
        Case Else
            strInit = ""
    End Select
End Function


