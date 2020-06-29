// TstCOM_1Ppg.cpp : Implementation of the CTstCOM_1PropPage property page class.

#include "stdafx.h"
#include "tstCOM_1.h"
#include "TstCOM_1Ppg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif


IMPLEMENT_DYNCREATE(CTstCOM_1PropPage, COlePropertyPage)


/////////////////////////////////////////////////////////////////////////////
// Message map

BEGIN_MESSAGE_MAP(CTstCOM_1PropPage, COlePropertyPage)
	//{{AFX_MSG_MAP(CTstCOM_1PropPage)
	// NOTE - ClassWizard will add and remove message map entries
	//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()


/////////////////////////////////////////////////////////////////////////////
// Initialize class factory and guid

IMPLEMENT_OLECREATE_EX(CTstCOM_1PropPage, "TSTCOM1.TstCOM1PropPage.1",
	0x6e781e28, 0x1237, 0x422f, 0x84, 0x5, 0xa2, 0xf0, 0x42, 0x2a, 0xb0, 0xb6)


/////////////////////////////////////////////////////////////////////////////
// CTstCOM_1PropPage::CTstCOM_1PropPageFactory::UpdateRegistry -
// Adds or removes system registry entries for CTstCOM_1PropPage

BOOL CTstCOM_1PropPage::CTstCOM_1PropPageFactory::UpdateRegistry(BOOL bRegister)
{
	if (bRegister)
		return AfxOleRegisterPropertyPageClass(AfxGetInstanceHandle(),
			m_clsid, IDS_TSTCOM_1_PPG);
	else
		return AfxOleUnregisterClass(m_clsid, NULL);
}


/////////////////////////////////////////////////////////////////////////////
// CTstCOM_1PropPage::CTstCOM_1PropPage - Constructor

CTstCOM_1PropPage::CTstCOM_1PropPage() :
	COlePropertyPage(IDD, IDS_TSTCOM_1_PPG_CAPTION)
{
	//{{AFX_DATA_INIT(CTstCOM_1PropPage)
	// NOTE: ClassWizard will add member initialization here
	//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_DATA_INIT
}


/////////////////////////////////////////////////////////////////////////////
// CTstCOM_1PropPage::DoDataExchange - Moves data between page and properties

void CTstCOM_1PropPage::DoDataExchange(CDataExchange* pDX)
{
	//{{AFX_DATA_MAP(CTstCOM_1PropPage)
	// NOTE: ClassWizard will add DDP, DDX, and DDV calls here
	//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_DATA_MAP
	DDP_PostProcessing(pDX);
}


/////////////////////////////////////////////////////////////////////////////
// CTstCOM_1PropPage message handlers
