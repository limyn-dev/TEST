__________
Public Sub LogLoadTxt(txt As TextBox)
   With txt
      .Text = ""
      .Text = myLog
   End With
End Sub



' Ajout d'un �l�ment dans le log
'______________________________________________________________________________________________________________________
Private Sub LogAdd(sTxt As String, eTpe As TypeLog)

   Select Case eTpe
      Case LOG_ERR
         myLog = myLog & "ERROR -> " & sTxt & vbCrLf
      Case Else
         myLog = myLog & "INFO  -> " & sTxt & vbCrLf
   End Select
   
End Sub

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           �       `��p a r a m C a t I D      [�  �    D ��[         �       `��p a r a m C a t N m e      [�  �    D ��[         �       `��p a r a m C a t D s c             d                     HZ      z     �  ����C a t _ P r c _ D e l D E L E T E   F R O M  
       t b l C a t  
 W H E R E  
       t b l C a t . c a t _ I D   =   p a r a m C a t _ I D      [