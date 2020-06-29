Attribute VB_Name = "ModMsg"
'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ FONCTIONS §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

' Api pour l'envoi de message
Public Declare Function SendMessage Lib "user32.dll" Alias "SendMessageA" _
    (ByVal hWnd As Long, ByVal Msg As Long, wParam As Any, lParam As Any) As Long
    




'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ Buttons §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

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
'==============================================================================
Const BM_CLICK = &HF5

'------------------------------------------------------------------------------
' BM_GETCHECK : Sending to a button determines if that button is currently checked
' Param       : wParam -> Not used -- set to 0.
'               lParam -> Not used -- set to 0.
' Return      : BST_CHECKED / BST_INDETERMINATE / BST_UNCHECKED
'==============================================================================
Const BM_GETCHECK = &HF0

'------------------------------------------------------------------------------
' BM_GETSTATE : Sending to a button retrieves information about the state of the button.
'               This message works will all types of buttons, including command buttons,
'               check boxes, and radio buttons.
' Param       : wParam -> Not used -- set to 0.
'               lParam -> Not used -- set to 0.
' Return      : BST_CHECKED / BST_FOCUS / BST_INDETERMINATE / BST_UNCHECKED / BST_PUSHED
'==============================================================================
Const BM_GETSTATE = &HF2

'------------------------------------------------------------------------------
' BM_SETCHECK : Use to place a check mark inside of Check1. Do this when a button
'               is pressed. To run this example, place a check box control named
'               Check1 and a command button named Command1 inside a form window.
' Param       : wParam -> BST_CHECKED / BST_INDETERMINATE / BST_UNCHECKED
'               lParam -> Not used -- set to 0.
' Return      : always returns 0
'==============================================================================
Const BM_SETCHECK = &HF1

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
Const BM_SETSTATE = &HF4



'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ Combo Boxes §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' CB_ERR       -> Other error.
' CB_ERRSPACE  -> Insufficient space to store the new string.
'==============================================================================
Const CB_ERR = -1
Const CB_ERRSPACE = -2

'------------------------------------------------------------------------------
' CB_ADDSTRING: adds a string to the control's drop-down list. If the combo box
'               is sorted, the new string is added in its proper position according
'               to the sort. If the combo box is not sorted, the new string is
'               Added to the end. To control where the string is added, use the
'               CB_INSERTSTRING message instead.
' Param       : wParam -> Not used -- set to 0.
'               lParam -> The string to add to the combo box's drop-down box.
' Return      : If successful, the message returns the zero-based index of the
'               newly added string's position in the combo box's drop-down box.
'               If there is insufficient space to store the new string, the
'               message returns CB_ERRSTRING. If some other error occurs, the
'               message returns CB_ERR.
'==============================================================================
Const CB_ADDSTRING = &H143

'------------------------------------------------------------------------------
' CB_DELETESTRING: Removes one of the items from its drop-down box.
' Param          : wParam -> The zero-based index of the string to delete from
'                            the combo box's drop-down box.
'                  lParam -> Not used -- set to zero.
' Return         : If successful, the message returns the number of items
'                  remaining in the combo box's drop-down box. If an error
'                  occured, the message returns CB_ERR.
'==============================================================================
Const CB_DELETESTRING = &H144

'------------------------------------------------------------------------------
' CB_GETCOUNT : determines how many items exist in the list box portion of a co
'               mbo box control. Keep in mind that the list box items are zero-
'               based; the first item has an index of zero, and the last one has
'               an index of the count minus one.
' Param       : wParam -> Not used -- set to 0.
'               lParam -> Not used -- set to 0.
' Return      : If successful, the message returns the number of items that are
'               in the list box portion of a combo box control. If an error occ
'               ured, the message returns CB_ERR.
'==============================================================================
Const CB_GETCOUNT = &H146

'------------------------------------------------------------------------------
' CB_GETCURSEL: finds out which list-box item is currently selected in a combo
'               box control. This message only returns useful information if the
'               combo box's selection is one of the items available in its list
'               box portion. If the user types different data into the tex box
'               portion, the function merely reports that no item is selected.
' Param       : wParam -> Not used -- set to 0.
'               lParam -> Not used -- set to 0.
' Return      : The message returns the zero-based index of the selected item
'               (the first item has an index of 0, etc.). If none of the items
'               in the list box portion are selected, the message returns
'               CB_ERR.
'==============================================================================
Const CB_GETCURSEL = &H147

'------------------------------------------------------------------------------
' CB_GETDROPPEDSTATE : Determines if its list box portion is currently visible.
'                      In most combo boxes, the list box can be either dropped
'                      down or hidden. This message only works if the combo box
'                      has that capability.
' Param              : wParam -> Not used -- set to 0.
'                      lParam -> Not used -- set to 0.
' Return             : If the message returns 0, the list box portion is
'                      currently hidden. If the message returns a non-zero
'                      value, the listbox is visible.
'==============================================================================
Const CB_GETDROPPEDSTATE = &H157

'------------------------------------------------------------------------------
' CB_GETLBTEXT : retrieves the text of one of the items in the list box portion
'                of a combo box control.
' Param        : wParam -> The zero-based index of the list box item to
'                          retrieve the text of. (The first item has an index
'                          of 0, etc.)
'                lParam -> The string to copy the list box item text into. The
'                          string must have enough room to receive the entire
'                          string along with a terminating null character.
' Return       : If successful, the message returns the length of the string
'                copied into the string passed as lParam, not including the
'                terminating null character. If an error occured, the message
'                returns CB_ERR.
'==============================================================================
Const CB_GETLBTEXT = &H148

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================
'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================
'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================
Const CB_GETCOUNT = &H146

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================
'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================
Const CB_GETCOUNT = &H146

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================
'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================
Const CB_GETCOUNT = &H146

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================

'------------------------------------------------------------------------------
'                : Removes one of the items from its drop-down box.
' Param          : wParam ->
'                  lParam ->
' Return         :
'==============================================================================





Buttons
BM_CLICK
BM_GETCHECK
BM_GETSTATE
BM_SETCHECK
BM_SETSTATE
Combo Boxes
CB_ADDSTRING
CB_DELETESTRING
CB_GETCOUNT
CB_GETCURSEL
CB_GETDROPPEDSTATE
CB_GETLBTEXT
CB_GETLBTEXTLEN
CB_INSERTSTRING
CB_RESETCONTENT
CB_SETCURSEL
CB_SHOWDROPDOWN
Edit Controls
EM_CANUNDO
EM_GETFIRSTVISIBLELINE
EM_GETLINE
EM_GETPASSWORDCHAR
EM_GETSEL
EM_LINEINDEX
EM_LINELENGTH
EM_REPLACESEL
EM_SETPASSWORDCHAR
EM_SETSEL
EM_UNDO
IP Address Control
IPM_CLEARADDRESS
IPM_GETADDRESS
IPM_ISBLANK
IPM_SETADDRESS
IPM_SETFOCUS
IPM_SETRANGE
List Boxes
LB_ADDSTRING
LB_DELETESTRING
LB_GETCOUNT
LB_GETCURSEL NEW
LB_GETSEL NEW
LB_GETSELCOUNT NEW
LB_GETSELITEMS NEW
LB_GETTEXT
LB_GETTEXTLEN
LB_INSERTSTRING
LB_RESETCONTENT
LB_SETCURSEL NEW
LB_SETSEL NEW
Media Control Interface (MCI)
MM_MCINOTIFY
Menus
WM_COMMAND
WM_INITMENU
WM_SYSCOMMAND
Mouse
WM_LBUTTONDBLCLK
WM_LBUTTONDOWN
WM_LBUTTONUP
WM_MBUTTONDBLCLK
WM_MBUTTONDOWN
WM_MBUTTONUP
WM_MOUSEMOVE
WM_RBUTTONDBLCLK
WM_RBUTTONDOWN
WM_RBUTTONUP
Timers
WM_TIMER
Windows
WM_CLOSE
WM_GETTEXT
WM_GETTEXTLENGTH
WM_HELP
WM_SETTEXT

