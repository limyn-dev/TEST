Option Explicit



MsgBox Convert("{1F892EE5-62AC-4EA0-A0BC-EB9FA03D28A7}")



' 
'----------------------------------------------------------------------------------------------------------------------
Function Convert(sCde)
	Dim nPos
	Dim nInc
	Dim sNcd
	
	' Wild char remouve
	RemouveStr sCde, " "
	RemouveStr sCde, "{"
	RemouveStr sCde, "}"
	RemouveStr sCde, "-"
	
	' String conversion
	nPos = 1
	Do
		Select case nPos
			Case 1
				nInc=8
			Case 9, 13
				nInc=4
			Case 17,19,21,23,25,27,29,31
				nInc=2
			Case Else
				nInc=0
		End Select
		If Not nInc=0 Then sNcd = sNcd & StrReverse(Mid(sCde,nPos,nInc))
		nPos = nPos+nInc
	Loop While nPos<Len(sCde)
	
	Convert = sNcd
	
End Function



' 
'----------------------------------------------------------------------------------------------------------------------
Sub RemouveStr(sStr, sRmv)
	Dim nPos : nPos=1
	Do
		nPos = InStr(nPos, sStr, sRmv)
		if npos>0 Then 
			sStr = Left(sStr,nPos-1) & Right(sStr,Len(sStr)-nPos)
		Else
			nPos = Len(sStr)+1
		End If
	Loop While nPos<=Len(sStr)
End Sub