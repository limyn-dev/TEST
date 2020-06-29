#if !defined(AFX_TSTCOM_1CTL_H__A0252AE4_B5D8_4CD9_BA3E_58D21752EB6E__INCLUDED_)
#define AFX_TSTCOM_1CTL_H__A0252AE4_B5D8_4CD9_BA3E_58D21752EB6E__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

// TstCOM_1Ctl.h : Declaration of the CTstCOM_1Ctrl ActiveX Control class.

/////////////////////////////////////////////////////////////////////////////
// CTstCOM_1Ctrl : See TstCOM_1Ctl.cpp for implementation.

class CTstCOM_1Ctrl : public COleControl
{
	DECLARE_DYNCREATE(CTstCOM_1Ctrl)

// Constructor
public:
	CTstCOM_1Ctrl();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CTstCOM_1Ctrl)
	public:
	virtual void OnDraw(CDC* pdc, const CRect& rcBounds, const CRect& rcInvalid);
	virtual void DoPropExchange(CPropExchange* pPX);
	virtual void OnResetState();
	//}}AFX_VIRTUAL

// Implementation
protected:
	~CTstCOM_1Ctrl();

	DECLARE_OLECREATE_EX(CTstCOM_1Ctrl)    // Class factory and guid
	DECLARE_OLETYPELIB(CTstCOM_1Ctrl)      // GetTypeInfo
	DECLARE_PROPPAGEIDS(CTstCOM_1Ctrl)     // Property page IDs
	DECLARE_OLECTLTYPE(CTstCOM_1Ctrl)		// Type name and misc status

// Message maps
	//{{AFX_MSG(CTstCOM_1Ctrl)
		// NOTE - ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

// Dispatch maps
	//{{AFX_DISPATCH(CTstCOM_1Ctrl)
		// NOTE - ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_DISPATCH
	DECLARE_DISPATCH_MAP()

	afx_msg void AboutBox();

// Event maps
	//{{AFX_EVENT(CTstCOM_1Ctrl)
		// NOTE - ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_EVENT
	DECLARE_EVENT_MAP()

// Dispatch and event IDs
public:
	enum {
	//{{AFX_DISP_ID(CTstCOM_1Ctrl)
		// NOTE: ClassWizard will add and remove enumeration elements here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_DISP_ID
	};
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_TSTCOM_1CTL_H__A0252AE4_B5D8_4CD9_BA3E_58D21752EB6E__INCLUDED)
