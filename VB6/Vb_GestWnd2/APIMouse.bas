Attribute VB_Name = "APIMouse"

'============================================================================='
'                 API pour la gestion de la souris                     '
'-----------------------------------------------------------------------------'
' Création                                                                    '
' Date         : 04.03.02                                                     '
' Hauteur      : Y.Delay                                                      '
' Documentation: http://www.vbapi.com/ref/msgc.html                           '
'-----------------------------------------------------------------------------'
'                                                                             '
'============================================================================='



'------------------------------------------------------------------------------
' MK_CONTROL  -> The Ctrl key is down. .
' MK_LBUTTON  -> The left mouse button is down.
' MK_MBUTTON  -> The middle mouse button is down.
' MK_RBUTTON  -> The right mouse button is down.
' MK_SHIFT    -> The Shift key is down.
' MK_XBUTTON1 -> The first X button is down (Windows 2000).
' MK_XBUTTON2 -> The second X button is down(Windows 2000).
'==============================================================================
Const MK_CONTROL = &H8
Const MK_LBUTTON = &H1
Const MK_MBUTTON = &H10
Const MK_RBUTTON = &H2
Const MK_SHIFT = &H4
Const MK_XBUTTON1 = &H20
Const MK_XBUTTON2 = &H40
'------------------------------------------------------------------------------
' WM_LBUTTONDBLCLK: Tells a window that the mouse button has been double-clicked
' WM_MBUTTONDBLCLK  while the cursor is inside the window's client area.
' WM_RBUTTONDBLCLK  The information sent with the message identifies the cursor
'                   postion relative to the window as well as the state of various
'                   modifier keys and mouse buttons. The target window's window
'                   procedure processes the message. When handling the message,
'                   the GET_X_LPARAM, GET_Y_LPARAM, and MAKEPOINTS macros can be
'                   used to unpack the coordinate information easily.
'                   It is not necessary to create a special hander for the
'                   WM_LBUTTONDBLCLK message. The DblClick event handler provided
'                   by Visual Basic actually process WM_LBUTTONDBLCLK and unpacks
'                   some of the information passed with it for easier use.
' Param           : wParam -> A combination of the following flags specifying
'                             which modifer keys, if any, are currently depressed:
'                             MK_CONTROL/MK_LBUTTON/MK_MBUTTON/MK_RBUTTON/MK_SHIFT/
'                             MK_XBUTTON1/MK_XBUTTON2
'                   lParam -> The (x,y) coordinates of the mouse cursor relative
'                             to the window. The low-order word contains the x-
'                             coordinate, and the high-order word contains the
'                             y-coordinate.
' Return          : always return 0.
'==============================================================================
Const WM_LBUTTONDBLCLK = &H203
Const WM_MBUTTONDBLCLK = &H209
Const WM_RBUTTONDBLCLK = &H206

'------------------------------------------------------------------------------
' WM_LBUTTONDOWN: tells a window that the mouse button has been pressed while the
' WM_MBUTTONDOWN  cursor is inside the Window 's client area. The information
' WM_RBUTTONDOWN  sent with the message identifies the cursor postion relative to
'                 the window as well as the state of various modifier keys and
'                 mouse buttons. The target window's window procedure processes
'                 the message. When handling the message, the GET_X_LPARAM, GET_
'                 Y_LPARAM, and MAKEPOINTS macros can be used to unpack the
'                 coordinate information easily.
'                 It is not necessary to create a special hander for the
'                 WM_LBUTTONDOWN message. The MouseDown event handler provided
'                 by Visual Basic actually process WM_LBUTTONDOWN and unpacks
'                 some of the information passed with it for easier use.
' Param         : wParam -> A combination of the following flags specifying
'                           which modifer keys, if any, are currently depressed:
'                           MK_CONTROL/MK_LBUTTON/MK_MBUTTON/MK_RBUTTON/MK_SHIFT/
'                           MK_XBUTTON1/MK_XBUTTON2
'                 lParam -> The (x,y) coordinates of the mouse cursor relative
'                           to the window. The low-order word contains the x-
'                           coordinate, and the high-order word contains the
'                           y-coordinate.
' Return        : Always return 0.
'==============================================================================
Const WM_LBUTTONDOWN = &H201
Const WM_MBUTTONDOWN = &H207
Const WM_RBUTTONDOWN = &H204

'------------------------------------------------------------------------------
' WM_LBUTTONUP: Tells a window that the mouse button has been released while the
' WM_MBUTTONUP  cursor is inside the Window 's client area. The information sent
' WM_RBUTTONUP  with the message identifies the cursor postion relative to the
'               window as well as the state of various modifier keys and mouse
'               buttons. The target window's window procedure processes the
'               message. When handling the message, the GET_X_LPARAM, GET_Y_LPARAM,
'               and MAKEPOINTS macros can be used to unpack the coordinate
'               information easily.
'               It is not necessary to create a special hander for the WM_LBUTTONUP
'               message. The MouseUp event handler provided by Visual Basic
'               actually process WM_LBUTTONUP and unpacks some of the information
'               passed with it for easier use.
' Param         : wParam -> A combination of the following flags specifying
'                           which modifer keys, if any, are currently depressed:
'                           MK_CONTROL/MK_LBUTTON/MK_MBUTTON/MK_RBUTTON/MK_SHIFT/
'                           MK_XBUTTON1/MK_XBUTTON2
'                 lParam -> The (x,y) coordinates of the mouse cursor relative
'                           to the window. The low-order word contains the x-
'                           coordinate, and the high-order word contains the
'                           y-coordinate.
' Return        : Always return 0.
'==============================================================================
Const WM_LBUTTONUP = &H202
Const WM_MBUTTONUP = &H208
Const WM_RBUTTONUP = &H205

