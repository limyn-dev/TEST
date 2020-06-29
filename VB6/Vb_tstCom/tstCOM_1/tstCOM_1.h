#if !defined(AFX_TSTCOM_1_H__20E4C3C2_6679_48D1_837C_3F9DB2BDDA8C__INCLUDED_)
#define AFX_TSTCOM_1_H__20E4C3C2_6679_48D1_837C_3F9DB2BDDA8C__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

// tstCOM_1.h : main header file for TSTCOM_1.DLL

#if !defined( __AFXCTL_H__ )
	#error include 'afxctl.h' before including this file
#endif

#include "resource.h"       // main symbols

/////////////////////////////////////////////////////////////////////////////
// CTstCOM_1App : See tstCOM_1.cpp for implementation.

class CTstCOM_1App : public COleControlModule
{
public:
	BOOL InitInstance();
	int ExitInstance();
};

extern const GUID CDECL _tlid;
extern const WORD _wVerMajor;
extern const WORD _wVerMinor;

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_TSTCOM_1_H__20E4C3C2_6679_48D1_837C_3F9DB2BDDA8C__INCLUDED)
