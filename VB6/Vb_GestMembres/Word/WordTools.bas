Attribute VB_Name = "NewMacros"
Sub testFusion()
Attribute testFusion.VB_Description = "Macro enregistrée le 25.09.2002 par _ _"
Attribute testFusion.VB_ProcData.VB_Invoke_Func = "TemplateProject.NewMacros.testFusion"

   With ActiveDocument.MailMerge
      .MainDocumentType = wdFormLetters
      .OpenDataSource _
         Name:="F:\Projets\Software\VB\GestMembres\Membres.mdb", _
         ConfirmConversions:=False, _
         ReadOnly:=False, _
         LinkToSource:=True, _
         AddToRecentFiles:=False, _
         PasswordDocument:="", _
         PasswordTemplate:="", _
         WritePasswordDocument:="", _
         WritePasswordTemplate:="", _
         Revert:=False, _
         Format:=wdOpenFormatAuto, _
         Connection:="TABLE Membres", _
         SQLStatement:="SELECT * FROM [Membres]", _
         SQLStatement1:=""
      .EditMainDocument
      .Fields.Add Range:=Selection.Range, Name:="mbrNom"
      .Fields.Add Range:=Selection.Range, Name:="mbrPrenom"
      .Fields.Add Range:=Selection.Range, Name:="mbrAdresse"
   End With
   
End Sub
