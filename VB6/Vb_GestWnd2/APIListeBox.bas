Attribute VB_Name = "APIListeBox"

         
'============================================================================='
'                 API pour la gestion des listesboxes                    '
'-----------------------------------------------------------------------------'
' Création                                                                    '
' Date         : 04.03.02                                                     '
' Hauteur      : Y.Delay                                                      '
' Documentation: http://www.vbapi.com/ref/msgc.html                           '
'-----------------------------------------------------------------------------'
'                                                                             '
'============================================================================='



'------------------------------------------------------------------------------
' LB_ERR       -> Other error.
' LB_ERRSPACE  -> Insufficient space to store the new string.
'==============================================================================
Const LB_ERR = -1
Const LB_ERRSPACE = -2

'------------------------------------------------------------------------------
' LB_ADDSTRING: Sending the LB_ADDSTRING message to a list box control adds a
'               string to its list. If the list box is sorted, the new string
'               is added in its proper position according to the sort. If the
'               list box is not sorted, the new string is added to the end. To
'               control where the string is added, use the LB_INSERTSTRING message
'               instead.
' Param       : wParam -> Not used -- set to 0.
'               lParam -> The string to add to the list box.
' Return      : If successful, the message returns the zero-based index of the
'               newly added string's position in the list box. If there is
'               insufficient space to store the new string, the message returns
'               LB_ERRSTRING. If some other error occurs, the message returns
'               LB_ERR.
'==============================================================================
Const LB_ADDSTRING = &H180

'------------------------------------------------------------------------------
' LB_DELETESTRING: Sending the LB_DELETESTRING message to a list box removes one
'                  of the items in it.
' Param          : wParam -> The zero-based index of the string to delete from the list box.
'                  lParam -> Not used -- set to zero.
' Return         : If successful, the message returns the number of items remaining
'                  in the list box. If an error occured, the message returns
'                  LB_ERR.
'==============================================================================
Const LB_DELETESTRING = &H182

'------------------------------------------------------------------------------
' LB_GETCOUNT: Determines how many items exist in a list box. Keep in mind that
'              the list box items are zero-based; the first item has an index
'              of zero, and the last one has an index of the count minus one.
' Param      : wParam -> Not used -- set to 0.
'              lParam -> Not used -- set to 0.
' Return     : If successful, the message returns the number of items that are
'              in the list box control. If an error occured, the message returns
'              LB_ERR.
'==============================================================================
Const LB_GETCOUNT = &H18B

'------------------------------------------------------------------------------
' LB_GETCURSEL: Sending to a single-selection list box gets the index of the
'               selected item. To get the items selected in a multiple-selection
'               list box, send the LB_GETSELITEMS message instead.
' Param       : wParam -> Not used -- set to zero.
'               lParam -> Not used -- set to zero.
' Return      : If successful, the message returns the zero-based index of the
'               selected item. If no item is selected, or if an error occured,
'               the message returns LB_ERR.
'==============================================================================
Const LB_GETCURSEL = &H188

'------------------------------------------------------------------------------
' LB_GETSEL: Sending the LB_GETSEL message to a list box checks to see if a
'            particular item is selected.
' Param    : wParam -> The zero-based index of the item to check the selection
'            state of.
'            lParam -> Not used -- set to zero.
' Return   : If the item is selected, the message returns a value greater than
'            zero. If the item is not selected, the message returns zero. If an
'            error occured, the message returns LB_ERR.
'==============================================================================
Const LB_GETSEL = &H187

'------------------------------------------------------------------------------
' LB_GETSELCOUNT: Sending  to a multiple-selection message box counts the number
'                 of items that are selected.
' Param         : wParam -> Not used -- set to zero.
'                 lParam -> Not used -- set to zero.
' Return        : If successful, the message returns the number of items that are
'                 selected in the list box. If an error occured, the message
'                 returns LB_ERR.
'==============================================================================
Const LB_GETSELCOUNT = &H190

'------------------------------------------------------------------------------
' LB_GETSELITEMS: Sending the LB_GETSELITEMS message to a multiple-selection list
'                 box retrieves an list of all the selected items. The index of
'                 each selected item is copied into an array passed with the
'                 message. For single-selection list boxes, send the LB_GETCURSEL
'                 message instead.
' Param         : wParam -> The number of list box item indexes that the array
'                           passed as lParam can hold.
'                 lParam -> The array that receives the indexes of the selected
'                           items. If the array is too small, then only some of
'                           the indexes are copied over. To get the minimum length
'                           needed for all the indexes, use the LB_GETSELCOUNT
'                           message.
' Return        : If successful, the message returns the number of item indexes
'                 copied into the array. If an error occured, the function returns
'                 LB_ERR.
'==============================================================================
Const LB_GETSELITEMS = &H191

'------------------------------------------------------------------------------
' LB_GETTEXT: retrieves the text of one of the items in a list box control.
' Param     : wParam -> The zero-based index of the list box item to retrieve
'                       the text of. (The first item has an index of 0, etc.)
'             lParam -> The string to copy the list box item text into. The string
'                       must have enough room to receive the entire string along
'                       with a terminating null character.
' Return    : If successful, the message returns the length of the string copied
'             into the string passed as lParam, not including the terminating
'             null character. If an error occured, the message returns LB_ERR.
'==============================================================================
Const LB_GETTEXT = &H189

'------------------------------------------------------------------------------
' LB_GETTEXTLEN: retrieves the length of the text of one of the items in a list
'                box control. The reported length does not include its terminating
'                null character. When determining how long to size a string to
'                receive the list box item's text, remember to add one to include
'                the null.
' Param        : wParam -> The zero-based index of the list box item to retrieve
'                          the length of the text of. (The first item has an index
'                          of 0, etc.)
'                lParam -> Not used -- set to 0.
' Return       : If successful, the message returns the length of the list box
'                item's text, not including the terminating null character. If
'                an error occured, the message returns LB_ERR.
'==============================================================================
Const LB_GETTEXTLEN = &H18A

'------------------------------------------------------------------------------
' LB_INSERTSTRING: Sending the LB_INSERTSTRING message to a list box inserts a
'                  string into it. The string is placed at the position specified
'                  in the parameters, regardless of whether the list box is sorted
'                  or not.
' Param          : wParam -> The zero-based index of the position to insert the
'                            string in the list box. If this is -1, the string
'                            is added to the end of the list.
'                  lParam -> The string to add to the list box.
' Return         : If successful, the message returns the zero-based index of the
'                  newly added string's position in the list box. If there is
'                  insufficient space to store the new string, the message returns
'                  LB_ERRSTRING. If some other error occurs, the message returns
'                  LB_ERR.
'==============================================================================
Const LB_INSERTSTRING = &H181

'------------------------------------------------------------------------------
' LB_RESETCONTENT: removes all items from it.
' Param          : wParam -> Not used -- set to 0.
'                  lParam -> Not used -- set to 0.
' Return         : This message always returns zero.
'==============================================================================
Const LB_RESETCONTENT = &H184

'------------------------------------------------------------------------------
' LB_SETCURSEL: Sending to a single-selection list box sets the item that is
'               currently selected, or clears the selection entirely. For multiple
'               -selection list boxes, send the LB_SETSEL message instead.
' Param       : wParam -> The zero-based index of the item to select. To clear
'                         the selection, set this to -1.
'               lParam -> Not used -- set to zero.
' Return      : If successful, the message returns 1. If an error occured, or
'               if the selection was cleared, the message returns LB_ERR.
'==============================================================================
Const LB_SETCURSEL = &H186

'------------------------------------------------------------------------------
' LB_SETSEL: Sending the LB_SETSEL to a multiple-selection list box selects or
'            deselects one of its items. Alternatively, the message can select
'            or deselect all of the items simultaneously. For a single-selection
'            list box, sned the LB_SETCURSEL message instead.
' Param    : wParam -> If this is zero, the item is deselected. If this is a non
'                      -zero value, the item is selected.
'            lParam -> The zero-based index of the item to select or deselect.
'                      If this is -1, all items in the list box are selected or
'                      deselected.
' Return   : If successful, the message returns zero. If an error occured, the
'            message returns LB_ERR.
'==============================================================================
Const LB_SETSEL = &H185
