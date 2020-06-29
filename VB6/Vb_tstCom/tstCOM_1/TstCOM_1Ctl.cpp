// TstCOM_1Ctl.cpp : Implementation of the CTstCOM_1Ctrl ActiveX Control class.

#include "stdafx.h"
#include "tstCOM_1.h"
#include "TstCOM_1Ctl.h"
#include "TstCOM_1Ppg.h"


#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif


IMPLEMENT_DYNCREATE(CTstCOM_1Ctrl, COleControl)


/////////////////////////////////////////////////////////////////////////////
// Message map

BEGIN_MESSAGE_MAP(CTstCOM_1Ctrl, COleControl)
	//{{AFX_MSG_MAP(CTstCOM_1Ctrl)
	// NOTE - ClassWizard will add and remove message map entries
	//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG_MAP
	ON_OLEVERB(AFX_IDS_VERB_EDIT, OnEdit)
	ON_OLEVERB(AFX_IDS_VERB_PROPERTIES, OnProperties)
END_MESSAGE_MAP()


/////////////////////////////////////////////////////////////////////////////
// Dispatch map

BEGIN_DISPATCH_MAP(CTstCOM_1Ctrl, COleControl)
	//{{AFX_DISPATCH_MAP(CTstCOM_1Ctrl)
	// NOTE - ClassWizard will add and remove dispatch map entries
	//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_DISPATCH_MAP
	DISP_FUNCTION_ID(CTstCOM_1Ctrl, "AboutBox", DISPID_ABOUTBOX, AboutBox, VT_EMPTY, VTS_NONE)
END_DISPATCH_MAP()


/////////////////////////////////////////////////////////////////////////////
// Event map

BEGIN_EVENT_MAP(CTstCOM_1Ctrl, COleControl)
	//{{AFX_EVENT_MAP(CTstCOM_1Ctrl)
	// NOTE - ClassWizard will add and remove event map entries
	//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_EVENT_MAP
END_EVENT_MAP()


/////////////////////////////////////////////////////////////////////////////
// Property pages

// TODO: Add more property pages as needed.  Remember to increase the count!
BEGIN_PROPPAGEIDS(CTstCOM_1Ctrl, 1)
	PROPPAGEID(CTstCOM_1PropPage::guid)
END_PROPPAGEIDS(CTstCOM_1Ctrl)


/////////////////////////////////////////////////////////////////////////////
// Initialize class factory and guid

IMPLEMENT_OLECREATE_EX(CTstCOM_1Ctrl, "TSTCOM1.TstCOM1Ctrl.1",
	0xd1dd1b51, 0xf682, 0x40f2, 0x84, 0x7b, 0xc8, 0xc1, 0x2a, 0x50, 0xe7, 0x4e)


/////////////////////////////////////////////////////////////////////////////
// Type library ID and version

IMPLEMENT_OLETYPELIB(CTstCOM_1Ctrl, _tlid, _wVerMajor, _wVerMinor)


/////////////////////////////////////////////////////////////////////////////
// Interface IDs

const IID BASED_CODE IID_DTstCOM_1 =
		{ 0xd012e5e1, 0xa027, 0x4d92, { 0x86, 0xb, 0x39, 0x68, 0x33, 0xf, 0x9f, 0xf3 } };
const IID BASED_CODE IID_DTstCOM_1Events =
		{ 0x6c76db98, 0xe9bc, 0x48c2, { 0x8c, 0xd6, 0x20, 0xd6, 0xec, 0xc5, 0x18, 0xdc } };


/////////////////////////////////////////////////////////////////////////////
// Control type information

static const DWORD BASED_CODE _dwTstCOM_1OleMisc =
	OLEMISC_SETCLIENTSITEFIRST |
	OLEMISC_INSIDEOUT |
	OLEMISC_CANTLINKINSIDE |
	OLEMISC_RECOMPOSEONRESIZE;

IMPLEMENT_OLECTLTYPE(CTstCOM_1Ctrl, IDS_TSTCOM_1, _dwTstCOM_1OleMisc)


/////////////////////////////////////////////////////////////////////////////
// CTstCOM_1Ctrl::CTstCOM_1CtrlFactory::UpdateRegistry -
// Adds or removes system registry entries for CTstCOM_1Ctrl

BOOL CTstCOM_1Ctrl::CTstCOM_1CtrlFactory::UpdateRegistry(BOOL bRegister)
{
	// TODO: Verify that your control follows apartment-model threading rules.
	// Refer to MFC TechNote 64 for more information.
	// If your control does not conform to the apartment-model rules, then
	// you must modify the code below, changing the 6th parameter from
	// afxRegInsertable | afxRegApartmentThreading to afxRegInsertable.

	if (bRegister)
		return AfxOleRegisterControlClass(
			AfxGetInstanceHandle(),
			m_clsid,
			m_lpszProgID,
			IDS_TSTCOM_1,
			IDB_TSTCOM_1,
			afxRegInsertable | afxRegApartmentThreading,
			_dwTstCOM_1OleMisc,
			_tlid,
			_wVerMajor,
			_wVerMinor);
	else
		return AfxOleUnregisterClass(m_clsid, m_lpszProgID);
}


/////////////////////////////////////////////////////////////////////////////
// CTstCOM_1Ctrl::CTstCOM_1Ctrl - Constructor

CTstCOM_1Ctrl::CTstCOM_1Ctrl()
{
	InitializeIIDs(&IID_DTstCOM_1, &IID_DTstCOM_1Events);

	// TODO: Initialize your control's instance data here.
}


/////////////////////////////////////////////////////////////////////////////
// CTstCOM_1Ctrl::~CTstCOM_1Ctrl - Destructor

CTstCOM_1Ctrl::~CTstCOM_1Ctrl()
{
	// TODO: Cleanup your control's instance data here.
}


/////////////////////////////////////////////////////////////////////////////
// CTstCOM_1Ctrl::OnDraw - Drawing function

void CTstCOM_1Ctrl::OnDraw(
			CDC* pdc, const CRect& rcBounds, const CRect& rcInvalid)
{
	// TODO: Replace the following code with your own drawing code.
	pdc->FillRect(rcBounds, CBrush::FromHandle((HBRUSH)GetStockObject(WHITE_BRUSH)));
	pdc->Ellipse(rcBounds);
}


/////////////////////////////////////////////////////////////////////////////
// CTstCOM_1Ctrl::DoPropExchange - Persistence support

void CTstCOM_1Ctrl::DoPropExchange(CPropExchange* pPX)
{
	ExchangeVersion(pPX, MAKELONG(_wVerMinor, _wVerMajor));
	COleControl::DoPropExchange(pPX);

	// TODO: Call PX_ functions for each persistent custom property.

}


/////////////////////////////////////////////////////////////////////////////
// CTstCOM_1Ctrl::OnResetState - Reset control to default state

void CTstCOM_1Ctrl::OnResetState()
{
	COleControl::OnResetState();  // Resets defaults found in DoPropExchange

	// TODO: Reset any other control state here.
}


/////////////////////////////////////////////////////////////////////////////
// CTstCOM_1Ctrl::AboutBox - Display an "About" box to the user

void CTstCOM_1Ctrl::AboutBox()
{
	CDialog dlgAbout(IDD_ABOUTBOX_TSTCOM_1);
	dlgAbout.DoModal();
}


/////////////////////////////////////////////////////////////////////////////
// CTstCOM_1Ctrl message handlers
