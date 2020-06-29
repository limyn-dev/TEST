Attribute VB_Name = "APIButton"

'============================================================================='
'                 API de gestion des bouttons                    '
'-----------------------------------------------------------------------------'
' Création                                                                    '
' Date         : 04.03.02                                                     '
' Hauteur      : Y.Delay                                                      '
' Documentation: http://www.vbapi.com/ref/msgc.html                           '
'-----------------------------------------------------------------------------'
'                                                                             '
'============================================================================='




'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ Réferances §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

' Envoi de message
Public Declare Function SendMessage Lib "user32.dll" Alias "SendMessageA" (ByVal hWnd As Long, ByVal Msg As Long, wParam As Any, lParam As Any) As Long



'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ Messages §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' BST_CHECKED       -> The button is checked.
' BST_FOCUS         -> The button has the keyboard focus.
' BST_INDETERMINATE -> The button is grayed, in an indeterminate state. This only works with check boxes that have three possible states.
' BST_PUSHED        -> The button is being pushed. This is typically caused by the left button being held down on top of the button, making it look pushed in
' BST_UNCHECKED     -> The button is unchecked
'==============================================================================
Const BST_CHECKED = &H1
Const BST_FOCUS = &H8
Const BST_INDETERMINATE = &H2
Const BST_PUSHED = &H4
Const BST_UNCHECKED = &H0

'------------------------------------------------------------------------------
' BM_CLICK    : Sending to a button simulates the user clicking on that button
' Param       : wParam -> Not used -- set to 0.
'               lParam -> Not used -- set to 0.
' Return      : -
'------------------------------------------------------------------------------
' BM_GETCHECK : Sending to a button determines if that button is currently checked
' Param       : wParam -> Not used -- set to 0.
'               lParam -> Not used -- set to 0.
' Return      : BST_CHECKED / BST_INDETERMINATE / BST_UNCHECKED
'------------------------------------------------------------------------------
' BM_GETSTATE : Sending to a button retrieves information about the state of the button.
'               This message works will all types of buttons, including command buttons,
'               check boxes, and radio buttons.
' Param       : wParam -> Not used -- set to 0.
'               lParam -> Not used -- set to 0.
' Return      : BST_CHECKED / BST_FOCUS / BST_INDETERMINATE / BST_UNCHECKED / BST_PUSHED
'------------------------------------------------------------------------------
' BM_SETCHECK : Use to place a check mark inside of Check1. Do this when a button
'               is pressed. To run this example, place a check box control named
'               Check1 and a command button named Command1 inside a form window.
' Param       : wParam -> BST_CHECKED / BST_INDETERMINATE / BST_UNCHECKED
'               lParam -> Not used -- set to 0.
' Return      : always returns 0
'------------------------------------------------------------------------------
' BM_SETSTATE : changes the pushed state of a button. This message allows you to
'               control whether a button looks pushed down or not. The appearance
'               of the button has no other effect on its state or checked/unchecked
'               value, if applicable. In reality, this message only affects command
'               buttons.
' Param       : wParam -> If this is a non-zero value, the button's appearance
'                         is changed to make it looked pushed down. If this is zero,
'                         the Button 's appearance is changed to make it look normal.
'               lParam -> Not used -- set to 0.
' Return      : always returns 0
'==============================================================================
Const BM_CLICK = &HF5
Const BM_GETCHECK = &HF0
Const BM_GETSTATE = &HF2
Const BM_SETCHECK = &HF1
Const BM_SETSTATE = &HF4



'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ Outils §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§


