#if !defined(AFX_TSTCOM_1PPG_H__3F0322E4_01DD_4E51_87BC_D5FA8DB190B3__INCLUDED_)
#define AFX_TSTCOM_1PPG_H__3F0322E4_01DD_4E51_87BC_D5FA8DB190B3__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

// TstCOM_1Ppg.h : Declaration of the CTstCOM_1PropPage property page class.

////////////////////////////////////////////////////////////////////////////
// CTstCOM_1PropPage : See TstCOM_1Ppg.cpp.cpp for implementation.

class CTstCOM_1PropPage : public COlePropertyPage
{
	DECLARE_DYNCREATE(CTstCOM_1PropPage)
	DECLARE_OLECREATE_EX(CTstCOM_1PropPage)

// Constructor
public:
	CTstCOM_1PropPage();

// Dialog Data
	//{{AFX_DATA(CTstCOM_1PropPage)
	enum { IDD = IDD_PROPPAGE_TSTCOM_1 };
		// NOTE - ClassWizard will add data members here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_DATA

// Implementation
protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support

// Message maps
protected:
	//{{AFX_MSG(CTstCOM_1PropPage)
		// NOTE - ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_TSTCOM_1PPG_H__3F0322E4_01DD_4E51_87BC_D5FA8DB190B3__INCLUDED)
