Attribute VB_Name = "APIComboBox"

'============================================================================='
'                 API de gestion des comboBox                    '
'-----------------------------------------------------------------------------'
' Création                                                                    '
' Date         : 04.03.02                                                     '
' Hauteur      : Y.Delay                                                      '
' Documentation: http://www.vbapi.com/ref/msgc.html                           '
'-----------------------------------------------------------------------------'
'                                                                             '
'============================================================================='



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
' CB_GETLBTEXTLEN: Retrieves the length of the text of one of the items in the
'                  list box portion of a combo box control. The reported length
'                  does not include its terminating null character. When
'                  determining how long to size a string to receive the list
'                  box item's text, remember to add one to include the null.
' Param          : wParam -> The zero-based index of the list box item to
'                            retrieve the length of the text of. (The first
'                            item has an index of 0, etc.)
'                  lParam -> Not used -- set to 0.
' Return         : If successful, the message returns the length of the list box
'                  item's text, not including the terminating null character.
'                  If an error occured, the message returns CB_ERR.
'==============================================================================
Const CB_GETLBTEXTLEN = &H149

'------------------------------------------------------------------------------
' CB_INSERTSTRING: inserts a string into its drop-down box. The string is
'                  placed at the position specified in the parameters,
'                  regardless of whether the combo box is sorted or not.
' Param          : wParam -> The zero-based index of the position to insert the
'                            string in the combo box's drop-down box. If this
'                            is -1, the string is added to the end of the list.
'                  lParam -> The string to add to the combo box's drop-down box.
' Return         : If successful, the message returns the zero-based index of
'                  the newly added string's position in the combo box's drop-
'                  down box. If there is insufficient space to store the new
'                  string, the message returns CB_ERRSTRING. If some other error
'                  occurs, the message returns CB_ERR.
'==============================================================================
Const CB_INSERTSTRING = &H14A

'------------------------------------------------------------------------------
' CB_RESETCONTENT: Removes all the items from its drop-down box and edit control.
' Param          : wParam -> Not used -- set to 0.
'                  lParam -> Not used -- set to 0.
' Return         : This message always returns zero.
'==============================================================================
Const CB_RESETCONTENT = &H14B

'------------------------------------------------------------------------------
' CB_SETCURSEL: chooses which item in the list box portion of a combo box
'               control is selected. Doing so erases the user 's previous
'               selection, as well as any other text he may have entered in the
'               text box portion of the control.
' Param       : wParam -> The zero-based index of the list box item to select.
'               lParam -> Not used -- set to 0.
' Return      : The message returns the zero-based index of the item that is
'               now selected (the first item has an index of 0, etc.). If an
'               error occured, or if the message specified a list box item that
'               does not exist, the message returns CB_ERR.
'==============================================================================
Const CB_SETCURSEL = &H14E

'------------------------------------------------------------------------------
' CB_SHOWDROPDOWN: Opens or closes its drop-down list box section. Naturally,
'                  this message only works if the combo box has a list that can
'                  be dropped down, instead of always or never displaying it.
' Param          : wParam -> If zero, closes the drop-down list of the combo
'                            box. If non-zero, opens the drop-down list of the
'                            combo box.
'                  lParam -> Not used -- set to 0.
' Return         : This message always returns a non-zero value.
'==============================================================================
Const CB_SHOWDROPDOWN = &H14F
