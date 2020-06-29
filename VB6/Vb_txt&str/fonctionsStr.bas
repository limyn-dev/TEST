Attribute VB_Name = "fonctionsStr"
Option Explicit

Public Function delDblEsp(str As String) As String
   Dim trouve As Boolean
   Dim numCar As Integer
   Dim nbrEsp As Integer
   Dim dimStr As Integer
   
   ' Calcul de la longueur de la chaine
   dimStr = Len(str)
   
   ' Suppression des doubles espaces
   trouve = False
   numCar = 1
   While numCar <= dimStr
      If Mid(str, numCar, 2) = "  " Then
         nbrEsp = nbrEsp + 1
         trouve = True
      Else
         If trouve Then
            str = Left(str, numCar - nbrEsp) & Right(str, dimStr - numCar)
            dimStr = dimStr - nbrEsp
            nbrEsp = 0
            trouve = False
         End If
      End If
      numCar = numCar + 1
   Wend
   
   ' Passage du paramètre
   delDblEsp = str
   
End Function

