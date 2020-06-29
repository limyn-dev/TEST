Attribute VB_Name = "APIEditCtrl"

         
'============================================================================='
'                API  de gestion des contrôles d'edition                      '
'-----------------------------------------------------------------------------'
' Création                                                                    '
' Date         : 04.03.02                                                     '
' Hauteur      : Y.Delay                                                      '
' Documentation: http://www.vbapi.com/ref/msgc.html                           '
'-----------------------------------------------------------------------------'
'                                                                             '
'============================================================================='



'------------------------------------------------------------------------------
' EM_CANUNDO: determines if the last operation can be undone. If an undo is
'             allowed, the user can select "Undo" from the control's context
'             menu, and the EM_UNDO message can also be sent to perform an undo.
' Param     : wParam -> Not used -- set to 0.
'             lParam -> Not used -- set to 0.
' Return    : If an undo operation is valid, the function returns a nonzero
'             value. If no undo is possible, the function returns 0.
'==============================================================================
Const EM_CANUNDO = &HC6

'------------------------------------------------------------------------------
' EM_GETFIRSTVISIBLELINE: Sending to a multi-line edit control finds out which
'                         line is the first line visible. This is the line that
'                         is currently displayed at the top of the control.
' Param                 : wParam -> Not used -- set to 0.
'                         lParam -> Not used -- set to 0.
' Return                : If the edit control is multi-line, the message
'                         returns the zero-based index of the first visible
'                         line at the top of the control. If the edit control
'                         is single-line, the message returns the zero-based
'                         index of the first visible character.
'==============================================================================
Const EM_GETFIRSTVISIBLELINE = &HCE


'------------------------------------------------------------------------------
' EM_GETLINE: retrieves the contents of one of its lines. The copied text is
'             placed into the string passed as lParam.
' Param     : wParam -> The zero-based index of the line to copy into the
'                       string passed as lParam.
'             lParam -> A string that receives a copy of the contents of the
'                       specified line of the edit control. This string must
'                       already be long enough to receive the copied text. Also
'                       , before sending the message, the first two bytes of
'                       the string must contain a 16-bit integer specifying the
'                       length of the string.
' Return    : If successful, the message returns the number of characters
'             copied into the string passed as lParam. If an error occured
'             (mostlikely if an invalid line was specified), the message
'             returns zero.
'==============================================================================
Const EM_GETLINE = &HC4

'------------------------------------------------------------------------------
' EM_GETPASSWORDCHAR: Identifies the password character used by an edit control
'                     . This characters appears in place of each character
'                     entered into the edit control, in order to hide its
'                     contents. As the name implies, this is typically done to
'                     hide a password entered into the control.
' Param             : wParam -> Not used -- set to 0.
'                     lParam -> Not used -- set to 0.
' Return            : The message returns the ASCII value of the password
'                     character used by the edit control. If the control does
'                     not use a password character, the message returns 0.
'==============================================================================
Const EM_GETPASSWORDCHAR = &HD2

'------------------------------------------------------------------------------
' EM_GETSEL: The EM_GETSEL message identifies what text is currently selected
'            in an edit control. The message effectively gives the character
'            positions of the beginning and end of the selection.
' Param    : wParam -> Receives the zero-based position of the first character
'                      in the selection.
'            lParam -> Receives the zero-based position of the character
'                      immediately after the end of the selection.
' Return   : The message returns the start and end positions of the text
'            selection, packed into a single 32-bit integer. The low-order word
'            contains the starting position of the selection and the high-order
'            word contains the position of the first character after the
'            selection. However, it is easier to use the values placed into
'            wParam and lParam to read the selection instead of using the return
'            value.
'==============================================================================
Const EM_GETSEL = &HB0

'------------------------------------------------------------------------------
' EM_LINEINDEX : Gets the index of the first character on a line. This index is
'                basically the number of characters between that character and
'                the first character in the edit control.
' Param        : wParam -> The zero-based index of the line. The message will
'                          return the index of this line's first character. A
'                          value of -1 for this parameter indicates the line
'                          that currently contains the caret.
'                lParam -> Not used -- set to 0.
' Return       : The message returns the zero-based index of the first character
'                on the specified line of the edit control. The message returns
'                -1 if wParam refers to a line that does not exist.
'==============================================================================
Const EM_LINEINDEX = &HBB

'------------------------------------------------------------------------------
' EM_LINELENGTH: Find out how many characters are on a particular line. This
'                message find out the length of one of the control's lines,
'                taking word wrapping into account. However, for some bizarre
'                reason, the line is idenified by a character position and not
'                a line index value.
' Param        : wParam -> The zero-based index of any character on the line to
'                          get the length of. Note that this is a character
'                          index, not a line index. (To get the index of the
'                          first character on a particular line, send the
'                          EM_LINEINDEX message before sending this message.)
'                          If this parameter is -1, the function returns the
'                          total number of unselected characters that are on
'                          lines that contain selected characters.
'                lParam -> Not used -- set to 0.
' Return       : For multi-line edit controls, the message returns the number
'                of characters on the specified line. For single-line edit
'                controls, the message returns the total number of characters
'                in the control.
'==============================================================================
Const EM_LINELENGTH = &HC1

'------------------------------------------------------------------------------
' EM_REPLACESEL: tells an edit control to replace the currently selected text
'                with a different string. If nothing in the edit control is
'                selected, then the text is instead inserted at the position of
'                the caret.
' Param        : wParam -> Specifies whether the text replacement should be
'                          added to the edit control's Undo list, which would
'                          allow the user to undo the operation. A nonzero value
'                          allows an undo; a value of 0 does not.
'                lParam -> The text to replace the selection with. If nothing in
'                          the edit control is selected, this text is inserted
'                          at the current position of the caret.
' Return       : This message does not return a meaningful value.
'==============================================================================
Const EM_REPLACESEL = &HC2

'------------------------------------------------------------------------------
' EM_SETPASSWORDCHAR: Sets the password character used by an edit control. This
'                     characters appears in place of each character entered into
'                     the edit control, in order to hide its contents. As the
'                     name implies, this is typically done to hide a password
'                     entered into the control. This message can also be used to
'                     tell an edit control not to use such a password character,
'                     instead telling it to actually display its contents.
' Param             : wParam -> The ASCII code of the character to use as the
'                               new password character. If this is 0, then the
'                               edit control will no longer use a password
'                               character.
'                     lParam -> Not used -- set to 0.
' Return            : Does not return a meaningful value.
'==============================================================================
Const EM_SETPASSWORDCHAR = &HCC

'------------------------------------------------------------------------------
' EM_SETSEL: Changes the current text selection inside an edit control. Once
'            this message sets the selection, the Edit Control 's caret is placed
'            immediately at the end of the selection.
' Param    : wParam -> The zero-based position of the first character in the
'                      selection. If this is -1, no text is selected.
'            lParam -> The zero-based position of the first character that appears
'                      immediately after the end of the selection. In other words,
'                      this is one plus the position of the last selected character.
'                      If this is -1, the selection extends to the end of the
'                      control.
' Return   : Does not return a meaningful value.
'==============================================================================
Const EM_SETSEL = &HB1

'------------------------------------------------------------------------------
' EM_UNDO: Undoes the last change made to the control's text. Most changes to
'          an edit control can be undone. However, programmatically setting the
'          text (such as using WM_SETTEXT, for example) cannot be undone. On the
'          other hand, though, undo operations themselves can be undone. The
'          EM_UNDO message has the same effect as selecting "Undo" from the edit
'          control's context menu.
' Param  : wParam -> Not used -- set to 0.
'          lParam -> Not used -- set to 0.
' Return : If the edit control is a single-line edit control, the message always
'          returns a nonzero value.
'          If the edit control is a multi-line edit control, the message returns
'          a nonzero value if the undo was successful and zero if the undo failed.
'==============================================================================
Const EM_UNDO = &HC7

