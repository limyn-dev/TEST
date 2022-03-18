#include <stdlib.h>
#include <ctype.h>
#include <iostream>
#include <string>
#include <stdio.h>
#include <vector>
#include <windows.h>
#include <wincrypt.h>
#include <cryptuiapi.h>
#include <tchar.h>
#pragma comment (lib, "crypt32.lib")
#pragma comment (lib, "cryptui.lib")

using namespace std;

/* ==========[ GLOBAL            ]==================================================*/
//                                                                                  -----------------------------------
string         sPRM_SEP = ";"                                                    ;  //
vector<string> aPRM_LST = {}                                                     ;  //
HCERTSTORE     hSTORE                                                            ;  //
PCCERT_CONTEXT pCRT_CTX = NULL                                                   ;  //
DWORD          nPROP_ID = 0                                                      ;  //
//                                                                                  -----------------------------------
/* ==========[ FUNCTIONS LOG     ]==================================================*/
string myToStr(wchar_t* pWchar)                 {
   /*-------------------------------------------------------------------------------*/
   /*-------------------------------------------------------------------------------*/
   wstring sWst(pWchar)                                                          ;  //
   string  sStr(sWst.begin(), sWst.end())                                        ;  //
   //                                                                               -----------------------------------
   return sStr                                                                   ;  //
}
void   myLe   (string sMessage)                 {
   /*-------------------------------------------------------------------------------*/
   /*-------------------------------------------------------------------------------*/
   //                                                                               -----------------------------------
   cout << "\n"                                                                  ;  //
   cout << "TERMINATING ERROR:\n"                                                ;  //
   cout << sMessage << "\n"                                                      ;  //
   cout << "Error number [" << GetLastError() << "]\n"                           ;  //
   cout << "Program terminating.\n"                                              ;  //
   exit(1)                                                                       ;  //
   //                                                                               -----------------------------------
}
void   myLg   (string sCaller, string sMessage) {
   //-------------------------------------------------------------------------------//
   //-------------------------------------------------------------------------------//
   string sStr = ""                                                              ;  //
   //                                                                               -----------------------------------
   while (sStr.length() + sCaller.length() < 15)                                 {  //
      sStr += " "                                                               ;}  //
   //                                                                               -----------------------------------
   cout << sCaller << sStr << " : " << sMessage << "\n"                          ;  //
   //                                                                               -----------------------------------
}
/* ==========[ FUNCTIONS STORE   ]==================================================*/
void   StoreOpen                    (string sStoreName)                          {
   //-------------------------------------------------------------------------------//
   //-------------------------------------------------------------------------------//
   string sFct = "StoreOpen"                                                     ;  //
   LPCSTR pSps = CERT_STORE_PROV_SYSTEM                                          ;  //
   DWORD  nStl = 0                                                               ;  //
   //                                                                               -----------------------------------
   myLg(sFct, "Open Certificate store [" + sStoreName + "]")                     ;  //
   if        (sStoreName == "CURRENT_USER:ROOT"                      )           {  //    User Trusted Root
      nStl   = CERT_SYSTEM_STORE_CURRENT_USER                                   ;   //
      hSTORE = CertOpenStore(pSps, 0, 0, nStl , L"ROOT"              )          ;}  //
   else if   (sStoreName == "CURRENT_USER:AuthRoot"                  )           {  //    User AuthRoot
      nStl   = CERT_SYSTEM_STORE_CURRENT_USER                                   ;   //
      hSTORE = CertOpenStore(pSps, 0, 0, nStl , L"AuthRoot"          )          ;}  //
   else if   (sStoreName == "CURRENT_USER:CA"                        )           {  //    User intermediate authority
      nStl   = CERT_SYSTEM_STORE_CURRENT_USER                                   ;   //
      hSTORE = CertOpenStore(pSps, 0, 0, nStl , L"Ca"                )          ;}  //
   else if   (sStoreName == "CURRENT_USER:TRUST"                     )           {  //    User trusted
      nStl   = CERT_SYSTEM_STORE_CURRENT_USER                                   ;   //
      hSTORE = CertOpenStore(pSps, 0, 0, nStl , L"Trust"             )          ;}  //
   else if   (sStoreName == "CURRENT_USER:TrustedPublisher"          )           {  //    User TrustedPublisher
      nStl   = CERT_SYSTEM_STORE_CURRENT_USER                                   ;   //
      hSTORE = CertOpenStore(pSps, 0, 0, nStl , L"TrustedPublisher"  )          ;}  //
   else if   (sStoreName == "CURRENT_USER:TrustedPeople"             )           {  //    User TrustedPeople
      nStl   = CERT_SYSTEM_STORE_CURRENT_USER                                   ;   //
      hSTORE = CertOpenStore(pSps, 0, 0, nStl , L"TrustedPeople"     )          ;}  //
   else if   (sStoreName == "CURRENT_USER:MY"                        )           {  //    User MY
      nStl   = CERT_SYSTEM_STORE_CURRENT_USER                                   ;   //
      hSTORE = CertOpenStore(pSps, 0, 0, nStl , L"MY"                )          ;}  //
   else if   (sStoreName == "CURRENT_USER:Disallowed"                )           {  //    User personal
      nStl   = CERT_SYSTEM_STORE_CURRENT_USER                                   ;   //
      hSTORE = CertOpenStore(pSps, 0, 0, nStl , L"Disallowed"        )          ;}  //
   else if   (sStoreName == "LOCAL_MACHINE:AuthRoot"                 )           {  //    Machine AuthRoot
      nStl   = CERT_SYSTEM_STORE_LOCAL_MACHINE                                  ;   //
      hSTORE = CertOpenStore(pSps, 0, 0, nStl , L"AuthRoot"          )          ;}  //
   else if   (sStoreName == "LOCAL_MACHINE:ROOT"                     )           {  //    Machine Trusted ROOT
      nStl   = CERT_SYSTEM_STORE_LOCAL_MACHINE                                  ;   //
      hSTORE = CertOpenStore(pSps, 0, 0, nStl , L"ROOT"              )          ;}  //
   else if   (sStoreName == "LOCAL_MACHINE:CA"                       )           {  //    Machine intermediate authority
      nStl   = CERT_SYSTEM_STORE_LOCAL_MACHINE                                  ;   //
      hSTORE = CertOpenStore(pSps, 0, 0, nStl , L"Ca"                )          ;}  //
   else if   (sStoreName == "LOCAL_MACHINE:AAD Token Issuer"         )           {  //    Machine AAD Token Issuer
      nStl   = CERT_SYSTEM_STORE_LOCAL_MACHINE                                  ;   //
      hSTORE = CertOpenStore(pSps, 0, 0, nStl , L"AAD Token Issuer"  )          ;}  //
   else if   (sStoreName == "LOCAL_MACHINE:Remote Desktop"           )           {  //    Machine Remote Desktop
      nStl   = CERT_SYSTEM_STORE_LOCAL_MACHINE                                  ;   //
      hSTORE = CertOpenStore(pSps, 0, 0, nStl , L"Remote Desktop"    )          ;}  //
   else if   (sStoreName == "LOCAL_MACHINE:TrustedAppRoot"           )           {  //    Machine TrustedAppRoot
      nStl   = CERT_SYSTEM_STORE_LOCAL_MACHINE                                  ;   //
      hSTORE = CertOpenStore(pSps, 0, 0, nStl , L"TrustedAppRoot"    )          ;}  //
   else if   (sStoreName == "LOCAL_MACHINE:TrustedPeople"            )           {  //    Machine TrustedPeople
      nStl   = CERT_SYSTEM_STORE_LOCAL_MACHINE                                  ;   //
      hSTORE = CertOpenStore(pSps, 0, 0, nStl , L"TrustedPeople"     )          ;}  //
   else if   (sStoreName == "LOCAL_MACHINE:TRUST"                    )           {  //    Machine TRUST
      nStl   = CERT_SYSTEM_STORE_LOCAL_MACHINE                                  ;   //
      hSTORE = CertOpenStore(pSps, 0, 0, nStl , L"Trust"             )          ;}  //
   else if   (sStoreName == "LOCAL_MACHINE:MY"                       )           {  //    Machine Personal
      nStl   = CERT_SYSTEM_STORE_LOCAL_MACHINE                                  ;   //
      hSTORE = CertOpenStore(pSps, 0, 0, nStl , L"MY"                )          ;}  //
   else                                                                          {  //
      myLe("Unknow store name[" + sStoreName + "].")                            ;}  //
   //                                                                               -----------------------------------
   if (!hSTORE)                                                                  {  //
      myLe("ERROR: The store was not opened.")                                  ;}  //
   //                                                                               -----------------------------------
}
void   CertInfoEcho                 (PCCERT_CONTEXT oContext)                    {
   //-------------------------------------------------------------------------------//
   //-------------------------------------------------------------------------------//
   string sFct       = "CertInfoEcho    : "                                      ;  //
   DWORD  nCnt       = CERT_NAME_SIMPLE_DISPLAY_TYPE                             ;  // Certificate name type
   char   sCnm[256]                                                              ;  // Certificate name buffer
   PCERT_INFO  pCif  = oContext->pCertInfo                                       ;  //
   //                                                                               -----------------------------------
   if (CertGetNameString(oContext, nCnt, 0, NULL, sCnm, 128))                    {  // Certificate name
      cout << sFct << "Certificate [" << string(sCnm) << "]\n"                  ;}  //
   else                                                                          {  //
      cout << sFct << "CertGetName failed.\n"                                   ;}  //
   //                                                                               -----------------------------------
   cout << sFct << "   dwVersion   [" << pCif->dwVersion   << "]\n"              ;  //
   cout << sFct << "   cExtension  [" << pCif->cExtension  << "]\n"              ;  // DWORD
   cout << sFct << "   rgExtension [" << pCif->rgExtension << "]\n"              ;  // PCERT_EXTENSION
   //cout << "SignatureAlgorithm   [" << pCif->SignatureAlgorithm   << "]"         ;  // CRYPT_ALGORITHM_IDENTIFIER
   //cout << "Issuer               [" << pCif->Issuer               << "]"         ;  // CERT_NAME_BLOB
   //cout << "NotBefore            [" << pCif->NotBefore            << "]"         ;  // FILETIME
   //cout << "NotAfter             [" << pCif->NotAfter             << "]"         ;  // FILETIME
   //cout << "Subject              [" << pCif->Subject              << "]"         ;  // CERT_NAME_BLOB
   //cout << "SubjectPublicKeyInfo [" << pCif->SubjectPublicKeyInfo << "]"         ;  // CERT_PUBLIC_KEY_INFO
   //cout << "IssuerUniqueId       [" << pCif->IssuerUniqueId       << "]"         ;  // CRYPT_BIT_BLOB
   //cout << "SubjectUniqueId      [" << pCif->SubjectUniqueId      << "]"         ;  // CRYPT_BIT_BLOB
   //   cout << "SerialNumber [" << pCRT_CTX->pCertInfo->SerialNumber << "]";
   //                                                                               -----------------------------------
}
string CertPGet_DWORD               (PCCERT_CONTEXT oContext, DWORD nProperty)   {
   //-------------------------------------------------------------------------------//
   //-------------------------------------------------------------------------------//
   string  sFct = "CertPet_PBYTE_WCHAR"                                          ;  //
   DWORD   nSze = 0                                                              ;  // Value buffer size
   DWORD*  pVal = NULL                                                           ;  // Value buffer
   string  sVal = ""                                                             ;  // Value buffer size
   //                                                                               -----------------------------------
   if(!(CertGetCertificateContextProperty(oContext, nProperty, NULL, &nSze)))    {  // Get value size
      myLe("Call #1 to GetCertContextProperty failed.")                         ;}  //
   //                                                                               -----------------------------------
   if(!(pVal=(DWORD*)malloc(nSze * sizeof(DWORD))))                              {  // Alloc buffer
      myLe("Memory allocation failed.")                                         ;}  //
   //                                                                               -----------------------------------
   if(!(CertGetCertificateContextProperty(oContext, nProperty, pVal, &nSze)))    {  // Get value
      myLe("Call #2 failed.")                                                   ;}  //
   //                                                                               -----------------------------------
   sVal = to_string(pVal[0])                                                     ;  //
   //                                                                               -----------------------------------
   free(pVal)                                                                    ;  //
   //                                                                               -----------------------------------
   return sVal                                                                   ;  // return string
}
string CertPGet_PBYTE_WCHAR         (PCCERT_CONTEXT oContext, DWORD nProperty)   {
   //-------------------------------------------------------------------------------//
   //-------------------------------------------------------------------------------//
   string  sFct = "CertPet_PBYTE_WCHAR"                                          ;  //
   DWORD   nSze = 0                                                              ;  // Value buffer size
   BYTE*   pVal = NULL                                                           ;  // Value buffer
   string  sVal = ""                                                             ;  // Value buffer size
   //                                                                               -----------------------------------
   if(!(CertGetCertificateContextProperty(oContext, nProperty, NULL, &nSze)))    {  // Get value size
      myLe("Call #1 to GetCertContextProperty failed.")                         ;}  //
   //                                                                               -----------------------------------
   if(!(pVal=(BYTE*)malloc(nSze * sizeof(BYTE))))                                {  // Alloc buffer
      myLe("Memory allocation failed.")                                         ;}  //
   //                                                                               -----------------------------------
   if(!(CertGetCertificateContextProperty(oContext, nProperty, pVal, &nSze)))    {  // Get value
      myLe("Call #2 failed.")                                                   ;}  //
   //                                                                               -----------------------------------
   for (int i=0; i<nSze; i++)                                                    {  // Build string
      //cout << "[" << pVal[i] << "][" <<  to_string(pVal[i]) << "][" <<  WCHAR(pVal[i]) << "]\n" ;
      if (pVal[i] != 0)                                                         {   //
         sVal += pVal[i]                                                       ;}}  //
   //                                                                               -----------------------------------
   free(pVal)                                                                    ;  //
   //                                                                               -----------------------------------
   return sVal                                                                   ;  // return string
}
string CertPGet_PBYTE_ARRAY         (PCCERT_CONTEXT oContext, DWORD nProperty)   {
   //-------------------------------------------------------------------------------//
   //-------------------------------------------------------------------------------//
   string sFct = "CertPGet_PBYTE_ARRAY"                                          ;  //
   DWORD  nSze = 0                                                               ;  // Value buffer size
   BYTE*  pVal = NULL                                                            ;  // Value buffer
   string sVal = ""                                                              ;  // Value buffer size
   //                                                                               -----------------------------------
   if(!(CertGetCertificateContextProperty(oContext, nProperty, NULL, &nSze)))    {  // Get value size
      myLe("Call #1 to GetCertContextProperty failed.")                         ;}  //
   //                                                                               -----------------------------------
   if(!(pVal=(BYTE*)malloc(nSze * sizeof(BYTE))))                                {  // Alloc buffer
      myLe("Memory allocation failed.")                                         ;}  //
   //                                                                               -----------------------------------
   if(!(CertGetCertificateContextProperty(oContext, nProperty, pVal, &nSze)))    {  // Get value
      myLe("Call #2 failed.")                                                   ;}  //
   //                                                                               -----------------------------------
   for (int i=0; i<nSze; i++)                                                    {  // Build string
      if (i==0)                                                                 {   //
         sVal += to_string(pVal[i])                                            ;}   //
      else                                                                      {   //
         sVal += ":" + to_string(pVal[i])                                      ;}}  //
   //                                                                               -----------------------------------
   free(pVal)                                                                    ;  //
   //                                                                               -----------------------------------
   return sVal                                                                   ;  // return string
}
string CertPGet_CRYPT_KEY_PROV_INFO (PCCERT_CONTEXT oContext, DWORD nProperty)   {
   //-------------------------------------------------------------------------------//
   // typedef struct _CRYPT_KEY_PROV_INFO {
   //    LPWSTR                pwszContainerName;
   //    LPWSTR                pwszProvName;
   //    DWORD                 dwProvType;
   //    DWORD                 dwFlags;
   //    DWORD                 cProvParam;
   //    PCRYPT_KEY_PROV_PARAM rgProvParam;
   //    DWORD                 dwKeySpec;
   // } CRYPT_KEY_PROV_INFO, *PCRYPT_KEY_PROV_INFO;
   //-------------------------------------------------------------------------------//
   string               sFct = "CertPGet_CRYPT_KEY_PROV_INFO"                    ;  //
   DWORD                nSze = 0                                                 ;  // Value buffer size
   CRYPT_KEY_PROV_INFO* pVal = NULL                                              ;  // Value buffer
   string               sVal = ""                                                ;  // Value buffer size
   //                                                                               -----------------------------------
   if(!(CertGetCertificateContextProperty(oContext, nProperty, NULL, &nSze)))    {  // Get value size
      myLe("Call #1 to GetCertContextProperty failed.")                         ;}  //
   //                                                                               -----------------------------------
   if(!(pVal=(CRYPT_KEY_PROV_INFO*)malloc(nSze * sizeof(CRYPT_KEY_PROV_INFO))))  {  // Alloc buffer
      myLe("Memory allocation failed.")                                         ;}  //
   //                                                                               -----------------------------------
   if(!(CertGetCertificateContextProperty(oContext, nProperty, pVal, &nSze)))    {  // Get value
      myLe("Call #2 failed.")                                                   ;}  //
   //                                                                               -----------------------------------
   sVal += "[" + myToStr(pVal->pwszContainerName) + "]"                          ;  // Set value
   sVal += "[" + myToStr(pVal->pwszProvName)      + "]"                          ;  //
   //                                                                               -----------------------------------
   free(pVal)                                                                    ;  //
   //                                                                               -----------------------------------
   return sVal                                                                   ;  // Return value
}
string CertPGet_CRYPT_CTL_USAGE     (PCCERT_CONTEXT oContext, DWORD nProperty)   {
   //-------------------------------------------------------------------------------//
   //typedef struct _CTL_USAGE {                                                    //
   //   DWORD cUsageIdentifier;                                                     //
   //   LPSTR *rgpszUsageIdentifier;                                                //
   //   } CTL_USAGE, *PCTL_USAGE, CERT_ENHKEY_USAGE, *PCERT_ENHKEY_USAGE;           //
   //-------------------------------------------------------------------------------//
   string     sFct = "CertPGet_CRYPT_CTL_USAGE"                                  ;  //
   DWORD      nSze = 0                                                           ;  // Value buffer size
   CTL_USAGE* pVal = NULL                                                        ;  // Value buffer
   string     sVal = ""                                                          ;  // Value buffer size
   //                                                                               -----------------------------------
   if(!(CertGetCertificateContextProperty(oContext, nProperty, NULL, &nSze)))    {  // Get value size
      myLe("Call #1 to GetCertContextProperty failed.")                         ;}  //
   //                                                                               -----------------------------------
   if(!(pVal=(CTL_USAGE*)malloc(nSze * sizeof(CTL_USAGE))))                      {  // Alloc buffer
      myLe("Memory allocation failed.")                                         ;}  //
   //                                                                               -----------------------------------
   if(!(CertGetCertificateContextProperty(oContext, nProperty, pVal, &nSze)))    {  // Get value
      myLe("Call #2 failed.")                                                   ;}  //
   //                                                                               -----------------------------------
   sVal += to_string(pVal->cUsageIdentifier) ;
//   for (int i=0; i<pVal->cUsageIdentifier; i++)                                  {  // Get value
//   sVal += to_string(i) ;}
//      sVal += "[" + string(pVal->rgpszUsageIdentifier[i]) + "]"                 ;}  //
   //                                                                               -----------------------------------
   free(pVal)                                                                    ;  //
   //                                                                               -----------------------------------      
   return sVal                                                                   ;  // return value
}
void   CertPropEcho                 (PCCERT_CONTEXT oContext, DWORD nProperty)   {
   //-------------------------------------------------------------------------------//
   //-------------------------------------------------------------------------------//
   string sFct = "CertPropEcho"                                                  ;  //
   string sVal = ""                                                              ;  // Property value
   string sPty = ""                                                              ;  // Property name   
   string aPid[256]                                                              ;  //
   //                                                                               -----------------------------------   
   for (int i=0; i<256; i++)                                                     {  // Set property list
      aPid[i]=""                                                                ;}  //
   aPid[1]   = "CERT_KEY_PROV_HANDLE"                                            ;  //
   aPid[2]   = "CERT_KEY_PROV_INFO"                                              ;  //
   aPid[3]   = "CERT_HASH/CERT_SHA1_HASH"                                        ;  //
   aPid[4]   = "CERT_MD5_HASH"                                                   ;  //
   aPid[5]   = "CERT_KEY_CONTEXT"                                                ;  //
   aPid[6]   = "CERT_KEY_SPEC"                                                   ;  //
   aPid[7]   = "CERT_IE30_RESERVED"                                              ;  //
   aPid[8]   = "CERT_PUBKEY_HASH_RESERVED"                                       ;  //
   aPid[9]   = "CERT_ENHKEY_USAGE/CERT_CTL_USAGE"                                ;  //
   aPid[10]  = "CERT_NEXT_UPDATE_LOCATION"                                       ;  //
   aPid[11]  = "CERT_FRIENDLY_NAME"                                              ;  //
   aPid[12]  = "CERT_PVK_FILE"                                                   ;  //
   aPid[13]  = "CERT_DESCRIPTION"                                                ;  //
   aPid[14]  = "CERT_ACCESS_STATE"                                               ;  //
   aPid[15]  = "CERT_SIGNATURE_HASH"                                             ;  //
   aPid[16]  = "CERT_SMART_CARD_DATA"                                            ;  //
   aPid[17]  = "CERT_EFS"                                                        ;  //
   aPid[18]  = "CERT_FORTEZZA_DATA"                                              ;  //
   aPid[19]  = "CERT_ARCHIVED"                                                   ;  //
   aPid[20]  = "CERT_KEY_IDENTIFIER"                                             ;  //
   aPid[21]  = "CERT_AUTO_ENROLL"                                                ;  //
   aPid[22]  = "CERT_PUBKEY_ALG_PARA"                                            ;  //
   aPid[23]  = "CERT_CROSS_CERT_DIST_POINTS"                                     ;  //
   aPid[24]  = "CERT_ISSUER_PUBLIC_KEY_MD5_HASH"                                 ;  //
   aPid[25]  = "CERT_SUBJECT_PUBLIC_KEY_MD5_HASH"                                ;  //
   aPid[26]  = "CERT_ENROLLMENT"                                                 ;  //
   aPid[27]  = "CERT_DATE_STAMP"                                                 ;  //
   aPid[28]  = "CERT_ISSUER_SERIAL_NUMBER_MD5_HASH"                              ;  //
   aPid[29]  = "CERT_SUBJECT_NAME_MD5_HASH"                                      ;  //
   aPid[30]  = "CERT_EXTENDED_ERROR_INFO"                                        ;  //
   aPid[64]  = "CERT_RENEWAL"                                                    ;  //
   aPid[65]  = "CERT_ARCHIVED_KEY_HASH"                                          ;  // Encrypted key hash
   aPid[66]  = "CERT_AUTO_ENROLL_RETRY"                                          ;  // AE_RETRY_INFO:cb+cRetry+FILETIME
   aPid[67]  = "CERT_AIA_URL_RETRIEVED"                                          ;  //
   aPid[68]  = "CERT_AUTHORITY_INFO_ACCESS"                                      ;  //
   aPid[69]  = "CERT_BACKED_UP"                                                  ;  // VARIANT_BOOL+FILETIME
   aPid[70]  = "CERT_OCSP_RESPONSE"                                              ;  //
   aPid[71]  = "CERT_REQUEST_ORIGINATOR"                                         ;  // string:machine DNS name
   aPid[72]  = "CERT_SOURCE_LOCATION"                                            ;  // string
   aPid[73]  = "CERT_SOURCE_URL"                                                 ;  // string
   aPid[74]  = "CERT_NEW_KEY"                                                    ;  //
   aPid[75]  = "CERT_OCSP_CACHE_PREFIX"                                          ;  // string
   aPid[76]  = "CERT_SMART_CARD_ROOT_INFO"                                       ;  // CRYPT_SMART_CARD_ROOT_INFO
   aPid[77]  = "CERT_NO_AUTO_EXPIRE_CHECK"                                       ;  //
   aPid[78]  = "CERT_NCRYPT_KEY_HANDLE"                                          ;  //
   aPid[79]  = "CERT_HCRYPTPROV_OR_NCRYPT_KEY_HANDLE"                            ;  //
   aPid[80]  = "CERT_SUBJECT_INFO_ACCESS"                                        ;  //
   aPid[81]  = "CERT_CA_OCSP_AUTHORITY_INFO_ACCESS"                              ;  //
   aPid[82]  = "CERT_CA_DISABLE_CRL"                                             ;  //
   aPid[83]  = "CERT_ROOT_PROGRAM_CERT_POLICIES"                                 ;  //
   aPid[84]  = "CERT_ROOT_PROGRAM_NAME_CONSTRAINTS"                              ;  //
   aPid[85]  = "CERT_SUBJECT_OCSP_AUTHORITY_INFO_ACCESS"                         ;  //
   aPid[86]  = "CERT_SUBJECT_DISABLE_CRL"                                        ;  //
   aPid[87]  = "CERT_CEP"                                                        ;  // Version+PropFlags+AuthType+UrlFlags+CESAuthType+Url+Id+CESUrl+ReqId
   aPid[89]  = "CERT_SIGN_HASH_CNG_ALG"                                          ;  // eg: "RSA/SHA1"
   aPid[90]  = "CERT_SCARD_PIN_ID"                                               ;  //
   aPid[91]  = "CERT_SCARD_PIN_INFO"                                             ;  //
   aPid[92]  = "CERT_SUBJECT_PUB_KEY_BIT_LENGTH"                                 ;  //
   aPid[93]  = "CERT_PUB_KEY_CNG_ALG_BIT_LENGTH"                                 ;  //
   aPid[94]  = "CERT_ISSUER_PUB_KEY_BIT_LENGTH"                                  ;  //
   aPid[95]  = "CERT_ISSUER_CHAIN_SIGN_HASH_CNG_ALG"                             ;  //
   aPid[96]  = "CERT_ISSUER_CHAIN_PUB_KEY_CNG_ALG_BIT_LENGTH"                    ;  //
   aPid[97]  = "CERT_NO_EXPIRE_NOTIFICATION"                                     ;  //
   aPid[98]  = "CERT_AUTH_ROOT_SHA256_HASH"                                      ;  //
   aPid[99]  = "CERT_NCRYPT_KEY_HANDLE_TRANSFER"                                 ;  //
   aPid[100] = "CERT_HCRYPTPROV_TRANSFER"                                        ;  //
   aPid[101] = "CERT_SMART_CARD_READER"                                          ;  // string
   aPid[102] = "CERT_SEND_AS_TRUSTED_ISSUER"                                     ;  // boolean
   aPid[103] = "CERT_KEY_REPAIR_ATTEMPTED"                                       ;  // FILETME
   aPid[104] = "CERT_DISALLOWED_FILETIME"                                        ;  //
   aPid[105] = "CERT_ROOT_PROGRAM_CHAIN_POLICIES"                                ;  //
   aPid[106] = "CERT_SMART_CARD_READER_NON_REMOVABLE"                            ;  // boolean
   aPid[107] = "CERT_SHA256_HASH"                                                ;  //
   aPid[108] = "CERT_SCEP_SERVER_CERTS"                                          ;  // Pkcs7
   aPid[109] = "CERT_SCEP_RA_SIGNATURE_CERT"                                     ;  // sha1 Thumbprint
   aPid[110] = "CERT_SCEP_RA_ENCRYPTION_CERT"                                    ;  // sha1 Thumbprint
   aPid[111] = "CERT_SCEP_CA_CERT"                                               ;  // sha1 Thumbprint
   aPid[112] = "CERT_SCEP_SIGNER_CERT"                                           ;  // sha1 Thumbprint
   aPid[113] = "CERT_SCEP_NONCE"                                                 ;  // blob
   aPid[114] = "CERT_SCEP_ENCRYPT_HASH_CNG_ALG"                                  ;  //
   aPid[115] = "CERT_SCEP_FLAGS"                                                 ;  // DWORD
   aPid[116] = "CERT_SCEP_GUID"                                                  ;  // string
   aPid[117] = "CERT_SERIALIZABLE_KEY_CONTEXT"                                   ;  // CERT_KEY_CONTEXT
   aPid[118] = "CERT_ISOLATED_KEY"                                               ;  // blob
   aPid[119] = "CERT_SERIAL_CHAIN"                                               ;  //
   aPid[120] = "CERT_KEY_CLASSIFICATION"                                         ;  // DWORD CertKeyType
   aPid[121] = "CERT_OCSP_MUST_STAPLE"                                           ;  //
   aPid[122] = "CERT_DISALLOWED_ENHKEY_USAGE"                                    ;  //
   aPid[123] = "CERT_NONCOMPLIANT_ROOT_URL"                                      ;  // NULL terminated UNICODE string
   aPid[124] = "CERT_PIN_SHA256_HASH"                                            ;  //
   aPid[125] = "CERT_CLR_DELETE_KEY"                                             ;  //
   aPid[126] = "CERT_NOT_BEFORE_FILETIME"                                        ;  //
   aPid[127] = "CERT_NOT_BEFORE_ENHKEY_USAGE"                                    ;  //
   aPid[128] = "CERT_FIRST_RESERVED"                                             ;  //
   //                                                                               -----------------------------------
   switch(nProperty)                                                             {  // Get property
      case CERT_KEY_PROV_INFO_PROP_ID                                           :   //
         sVal = CertPGet_CRYPT_KEY_PROV_INFO(oContext, nProperty) ; break      ;    // CRYPT_KEY_PROV_INFO
      case CERT_CTL_USAGE_PROP_ID                                              :    //   9
         sVal = CertPGet_CRYPT_CTL_USAGE(oContext, nProperty)     ; break      ;    // CTL_USAGE
      case CERT_FRIENDLY_NAME_PROP_ID                                           :   //  11
      case CERT_DESCRIPTION_PROP_ID                                             :   //  13
      case CERT_ACCESS_STATE_PROP_ID                                            :   //  14
      case CERT_EXTENDED_ERROR_INFO_PROP_ID                                     :   //  30
      case CERT_REQUEST_ORIGINATOR_PROP_ID                                      :   //  71
      case CERT_SOURCE_LOCATION_PROP_ID                                         :   //  72
      case CERT_SOURCE_URL_PROP_ID                                              :   //  73
      case CERT_SMART_CARD_READER_PROP_ID                                       :   // 101
         sVal = CertPGet_PBYTE_WCHAR(oContext, nProperty)         ; break      ;    // BYTE ARRAY as string
      case CERT_SUBJECT_PUB_KEY_BIT_LENGTH_PROP_ID                              :   //  92
      case CERT_SCEP_FLAGS_PROP_ID                                              :   // 115
         sVal = CertPGet_DWORD(oContext, nProperty)               ; break      ;    // DWORD
      default                                                                   :   //
         sVal = CertPGet_PBYTE_ARRAY(oContext, nProperty)         ; break      ; }  // BYTE ARRAY
   //                                                                               -----------------------------------
   sPty = "   Property (" + to_string(nProperty) + ")"                           ;  //
   while (sPty.length() < 17){sPty += " ";} sPty += aPid[nProperty]              ;  //
   while (sPty.length() < 60){sPty += " ";} sPty += "[" + sVal + "]"             ;  //
   myLg(sFct, sPty)                                                              ;  //
   //                                                                               -----------------------------------
}
void CertEkuEcho  (PCCERT_CONTEXT oContext)                    {
   //-------------------------------------------------------------------------------//
   // typedef struct _CTL_USAGE {
   //    DWORD cUsageIdentifier;
   //    LPSTR* rgpszUsageIdentifier;
   // } CTL_USAGE, *PCTL_USAGE, CERT_ENHKEY_USAGE, *PCERT_ENHKEY_USAGE;
   //-------------------------------------------------------------------------------//
   string             sFct = "CertEkuEcho"                                       ;  //
   DWORD              nFlg = 0                                                   ;  //
   DWORD              nSze = 0                                                   ;  //
   CERT_ENHKEY_USAGE* pEku = NULL                                                ;  //
   string             sStr = ""                                                  ;  //
   string             sVal = ""                                                  ;  //
   //                                                                               -----------------------------------
   if (!(CertGetEnhancedKeyUsage(oContext, nFlg, NULL, &nSze)))                  {  //
      myLe("Unable to get EKU size.")                                           ;}  //
   //                                                                               -----------------------------------
   if(!(pEku=(CERT_ENHKEY_USAGE*)malloc(nSze * sizeof(CERT_ENHKEY_USAGE))))      {  // Alloc buffer
      myLe("Memory allocation failed.")                                         ;}  //
   //                                                                               -----------------------------------
   if (!(CertGetEnhancedKeyUsage(oContext, nFlg, pEku, &nSze)))                  {  //
      myLe("Unable to get EKU values.")                                         ;}  //
   //                                                                               -----------------------------------
   for (int i=0; i<pEku->cUsageIdentifier; i++)                                  {  //
      sStr  = "   EKU (" + to_string(i)+ ")"                                    ;   //
      sStr += " [" + string(pEku->rgpszUsageIdentifier[i]) + "]"                ;   //
      myLg(sFct, sStr)                                                          ;}  //
   //                                                                               -----------------------------------
}
/*
DWORD GetCertificate(IN WCHAR* pwcTrustRootCA,  IN PBYTE  pbCertHash, IN DWORD* pcbCertHash){
   HCERTSTORE     hCertStore;
   WCHAR*         pwcSubjectName;
   DWORD          cwcSubjectName;
   PBYTE          pbSHA1;
   DWORD          cbSHA1;
   PCCERT_CONTEXT pCertContext = NULL;
   DWORD          dwRet;
                  dwRet = NO_ERROR;
   BOOL   bFoundCert = FALSE;

   if((              hCertStore     = CertOpenStore(CERT_STORE_PROV_SYSTEM, X509_ASN_ENCODING | PKCS_7_ASN_ENCODING,(HCRYPTPROV) NULL,CERT_SYSTEM_STORE_LOCAL_MACHINE,L"ROOT"))){
      while( (       pCertContext   = CertEnumCertificatesInStore( hCertStore, pCertContext ) ) && bFoundCert == FALSE )                          {
         if((        cwcSubjectName = CertGetNameString(pCertContext, CERT_NAME_SIMPLE_DISPLAY_TYPE, 0, NULL, NULL, 0)) > 0 )                  {
            if((     pwcSubjectName = (WCHAR*) malloc(cwcSubjectName * sizeof(WCHAR))))                                                       {
               if(                    CertGetNameStringW( pCertContext,CERT_NAME_SIMPLE_DISPLAY_TYPE,0,NULL,pwcSubjectName,cwcSubjectName ) > 0 )             {
                  printf("Found the certificate [%ws] in the system store\n", pwcSubjectName)                                               ;
                  if (                wcscmp(pwcTrustRootCA, pwcSubjectName) == 0)                                                                         {
                     bFoundCert = TRUE                                                                                                     ;
                     if(              CertGetCertificateContextProperty( pCertContext, CERT_SHA1_HASH_PROP_ID , NULL, &cbSHA1))                          {
                        if ( pbSHA1 = (BYTE *) malloc(cbSHA1 * sizeof(BYTE) ) )                                                           {
                           if(        CertGetCertificateContextProperty( pCertContext, CERT_SHA1_HASH_PROP_ID, pbSHA1, &cbSHA1))                 {
                              memcpy(pbCertHash, pbSHA1, cbSHA1)                                                                        ;
                              *pcbCertHash = cbSHA1;                                                                                      }
                           else                                                                                                           {
                              printf("->GetCertificate :: Error retrieving certificate HASH.\n")                                         ;
                              dwRet = ERROR_CANTOPEN                                                                                     ;}
                           free(pbSHA1)                                                                                                   ;}
                        else                                                                                                               {
                           printf("->GetCertificate :: Error allocating memory.\n")                                                       ;
                           dwRet = ERROR_NOT_ENOUGH_MEMORY                                                                                ;}}
                     else                                                                                                                   {
                        printf("->GetCertificate :: Error getting certificate property.\n")                                                ;
                        dwRet = ERROR_CANTOPEN                                                                                             ;}}}
               else                                                                                                                           {
                  printf("->GetCertificate :: Error getting certificate name string.\n")                                                     ;
                  dwRet = ERROR_CANTOPEN                                                                                                     ;}
               free( pwcSubjectName )                                                                                                         ;
               cwcSubjectName = 0                                                                                                             ;}
            else                                                                                                                               {
               printf("->GetCertificate :: Error allocating memory.\n")                                                                       ;
               dwRet = ERROR_NOT_ENOUGH_MEMORY                                                                                                ;}}
         else                                                                                                                                   {
            dwRet = ERROR_CANTOPEN                                                                                                             ;}}
      if( !bFoundCert )                                                                                                                          {
         printf("->GetCertificate :: Error looking for the certificate in the system store.\n")                                                 ;
         dwRet = ERROR_CANTOPEN                                                                                                                 ;}
      if( dwRet != NO_ERROR )                                                                                                                    {
         if( pCertContext )                                                                                                                     {
            CertFreeCertificateContext( pCertContext )                                                                                         ;}
      CertCloseStore( hCertStore, CERT_CLOSE_STORE_CHECK_FLAG )                                                                                 ;}}
   else                                                                                                                                           {
      printf("->GetCertificate :: Error opening system store.\n")                                                                                ;
      dwRet = ERROR_CANTOPEN                                                                                                                     ;}
   return dwRet;

}
*/
/*
typedef struct _STORE_ENUM                                                       {
    BOOL        fAll                                                            ;
    BOOL        fVerbose                                                        ;
    DWORD       dwFlags                                                         ;
    const void  *pvStoreLocationPara                                            ;
    HKEY        hKeyBase                                                        ;}
STORE_ENUM, *PSTORE_ENUM                                                         ;
static BOOL        StoreGetSysName (const void *pvSystemStore,DWORD dwFlags,PSTORE_ENUM pEnumArg,LPCWSTR *ppwszSystemame                              ){
   //-------------------------------------------------------------------------------//
   //-------------------------------------------------------------------------------//
   *ppwszSystemName = NULL                                                       ;  //
   //                                                                               -----------------------------------
   if (pEnumArg->hKeyBase && 0 == (dwFlags & CERT_SYSTEM_STORE_RELOCATE_FLAG))   {  //
      myLg(sFct, "Failed => RELOCATE_FLAG not set in callback. \n")                   ;   //
      return FALSE                                                              ;}  //
   else                                                                          {  //
      if (dwFlags & CERT_SYSTEM_STORE_RELOCATE_FLAG)                            {   //
         PCERT_SYSTEM_STORE_RELOCATE_PARA pRelocatePara                        ;    //
         if (!pEnumArg->hKeyBase)                                              {    //
            myLe("Failed => RELOCATE_FLAG is set in callback")                ;}    //
         pRelocatePara = (PCERT_SYSTEM_STORE_RELOCATE_PARA)pvSystemStore       ;    //
         if (pRelocatePara->hKeyBase != pEnumArg->hKeyBase)                    {    //
            myLe("Wrong hKeyBase passed to callback")                         ;}    //
         *ppwszSystemName = pRelocatePara->pwszSystemStore                     ;}   //
      else                                                                      {   //
         *ppwszSystemName = (LPCWSTR) pvSystemStore                            ;}}  //
   //                                                                               -----------------------------------
   return TRUE;
}
static BOOL WINAPI StoreEnumPhyCbk (const void *pvSystemStore,DWORD dwFlags,LPCWSTR pwszStoreName,PCERT_PHYSICAL_STORE_INFO pStoreInfo,void *pvReserved,void *pvArg  ){
   //-------------------------------------------------------------------------------//
   //-------------------------------------------------------------------------------//
   PSTORE_ENUM pEnumArg         = (PSTORE_ENUM) pvArg                            ;  //
   LPCWSTR   pwszSystemStore                                                     ;  //
   //                                                                               //---------------------------------
   if (StoreGetSysName(pvSystemStore,dwFlags,pEnumArg,&pwszSystemStore))            {
      myLg(sFct, "    StoreName [" + string(pwszStoreName) + "]")                        ;}
   else                                                                             {
      myLe("StoreGetSysName failed.")                                              ;}
   //                                                                               //---------------------------------
   if (pEnumArg->fVerbose&&(dwFlags&CERT_PHYSICAL_STORE_PREDEFINED_ENUM_FLAG))      {
      myLg(sFct, " (implicitly created)")                                                ;}
   //                                                                               //---------------------------------
   return TRUE                                                                      ;
}
static BOOL WINAPI StoreEnumSysCbk (const void *pvSystemStore,DWORD dwFlags,PCERT_SYSTEM_STORE_INFO pStoreInfo,void *pvReserved,void *pvArg                          ){
   //-------------------------------------------------------------------------------//
   //-------------------------------------------------------------------------------//
   PSTORE_ENUM   pEnumArg       = (PSTORE_ENUM)pvArg                             ;  //
   static int  line_counter   = 0                                                ;  //
   LPCWSTR     pwszSystemStore                                                   ;  //
   char        x                                                                 ;  //
   //                                                                               //---------------------------------
//   if(line_counter++ > 5){
//      printf("Enumeration of system store: Press Enter to continue.");
//      scanf_s("%c",&x);
//      line_counter=0;}
   //                                                                               //---------------------------------
   if (StoreGetSysName(pvSystemStore, dwFlags, pEnumArg, &pwszSystemStore))      {  //
      myLg(sFct, "SystemStore [" + string(pwszSystemStore) + "]")                     ;}  //
   else                                                                          {  //
      myLe("StoreGetSysName failed.")                                           ;}  //
   //                                                                               //---------------------------------
   if (pEnumArg->fAll || pEnumArg->fVerbose)                                     {  //
      dwFlags &= CERT_SYSTEM_STORE_MASK                                         ;   //
      dwFlags |= pEnumArg->dwFlags & ~CERT_SYSTEM_STORE_MASK                    ;   //
      if(!CertEnumPhysicalStore(pvSystemStore,dwFlags,pEnumArg,StoreEnumPhyCbk)){   //
         DWORD dwErr = GetLastError()                                          ;    //
         if (!(ERROR_FILE_NOT_FOUND == dwErr || ERROR_NOT_SUPPORTED == dwErr)) {    //
            myLg(sFct, "    CertEnumPhysicalStore");                                 }}}  //
   //                                                                               //---------------------------------
   return TRUE                                                                   ;  //
}
static BOOL WINAPI StoreEnumLocCbk (LPCWSTR pwszStoreLocation,DWORD dwFlags,void *pvReserved,void *pvArg                                                             ){
   //-------------------------------------------------------------------------------//
   //-------------------------------------------------------------------------------//
   PSTORE_ENUM   pEnumArg     = (PSTORE_ENUM) pvArg                              ;  //  Declare and initialize local variables.
   DWORD       dwLocationID = (dwFlags & CERT_SYSTEM_STORE_LOCATION_MASK)        ;  //
               dwLocationID = dwLocationID >> CERT_SYSTEM_STORE_LOCATION_SHIFT   ;  //
   static int  linecount    = 0                                                  ;  //
   void *      pSlp         = (void *) pEnumArg->pvStoreLocationPara             ;  //
   char        x                                                                 ;  //
   //-------------------------------------------------------------------------------//
//   if(linecount++ > 5)                                                           {  // Break if more than 5 lines have been printed.
//      myLg(sFct, "Enumeration of store locations: Press Enter to continue.");
//      scanf_s("%c",&x);
//      linecount=0;                                                               }
   //-------------------------------------------------------------------------------//
   myLg(sFct, "======   " + string(pwszStoreLocation) + "   ======\n")                 ;  // Prepare and display the next detail line.
   if (pEnumArg->fAll)                                                           {  //
      dwFlags &= CERT_SYSTEM_STORE_MASK                                         ;   //
      dwFlags |= pEnumArg->dwFlags & ~CERT_SYSTEM_STORE_LOCATION_MASK           ;   //
      CertEnumSystemStore(dwFlags, pSlp, pEnumArg, StoreEnumSysCbk )            ;}  //
   //-------------------------------------------------------------------------------//
   return TRUE;
}
void               StoreSelect     (                                                                                                                                 ){
   //-------------------------------------------------------------------------------//
   //-------------------------------------------------------------------------------//
   DWORD    dwLocationID          = CERT_SYSTEM_STORE_CURRENT_USER_ID            ;  //
   DWORD    dwFlags               = 0                                            ;  //
   STORE_ENUM EnumArg                                                            ;  //
   HKEY     hKeyBase              = NULL                                         ;  //
   LPWSTR   pwszStoreLocationPara = NULL                                         ;  //
   void     *pvStoreLocationPara  = pwszStoreLocationPara                        ;  //
   //                                                                               -----------------------------------
   dwFlags &= ~CERT_SYSTEM_STORE_LOCATION_MASK                                   ;  //
   dwFlags |= (dwLocationID << CERT_SYSTEM_STORE_LOCATION_SHIFT)                 ;  //
   dwFlags &= CERT_SYSTEM_STORE_LOCATION_MASK                                    ;  //
   //                                                                               -----------------------------------
   memset(&EnumArg, 0, sizeof(EnumArg))                                          ;  //
   EnumArg.dwFlags             = dwFlags                                         ;  //
   EnumArg.hKeyBase            = hKeyBase                                        ;  //
   EnumArg.pvStoreLocationPara = pvStoreLocationPara                             ;  //
   EnumArg.fAll                = TRUE                                            ;  //
   //                                                                               -----------------------------------
   myLg(sFct, "Begin enumeration of store locations. \n")                              ;  //
   if(!(CertEnumSystemStoreLocation(dwFlags,&EnumArg,StoreEnumLocCbk)))          {  //
      myLe("Enumeration of locations failed.")                                  ;}  //
   //                                                                               -----------------------------------
   myLg(sFct, "Begin enumeration of system stores.")                                   ;  //
   if(CertEnumSystemStore(dwFlags,pvStoreLocationPara,&EnumArg,StoreEnumSysCbk)) {  //
      printf("\nFinished enumerating system stores. \n")                        ;}  //
   else                                                                          {  //
      MyHandleError("Enumeration of system stores failed.")                     ;}  //
   //                                                                               -----------------------------------
   printf("\n\nEnumerate the physical stores for the MY system store.\n")        ;  //
   if(CertEnumPhysicalStore (L"MY", dwFlags, &EnumArg, StoreEnumPhyCbk))         {  //
      printf("Finished enumeration of the physical stores. \n")                 ;}  //
   else                                                                          {  //
      MyHandleError("Enumeration of physical stores failed.")                   ;}  //
   //                                                                               -----------------------------------
}
*/
/* ==========[ COMMANDS          ]==================================================*/
void CMD_CERT_ECHO()          {
   //-------------------------------------------------------------------------------//
   //-------------------------------------------------------------------------------//
   string         sFct = "CMD_CERT_ECHO"                                         ;  //
   PCCERT_CONTEXT oCtx = NULL                                                    ;  //
   DWORD          nPrp = 0                                                       ;  //
   //                                                                               -----------------------------------
   try                                                                           {  // Open store
      if (aPRM_LST.size() < 2)                                                  {   //
         myLg(sFct, "ERROR:Parameters requried."); return                      ;}   //
      else                                                                      {   //
         StoreOpen(aPRM_LST[1])                                                ;}}  //
   catch (const std::exception& e)                                               {
      cout << "\n ERROR:\n" << e.what() << "\n"                                 ;}
   //                                                                               -----------------------------------
   try                                                                           {  // Open store
      while((oCtx=CertEnumCertificatesInStore(hSTORE, oCtx)))                   {   // Liste certificats
         CertInfoEcho(oCtx)                                                    ;    //    Echo info
         while((nPrp=CertEnumCertificateContextProperties(oCtx, nPrp)))        {    //    Echo properties
            CertPropEcho(oCtx,nPrp )                                          ;}    //
         CertEkuEcho(oCtx)                                                     ;}}  //    Echo EKU
   catch (const std::exception& e)                                               {  //
      cout << "\n ERROR:\n" << e.what() << "\n"                                 ;}  //
   //                                                                               -----------------------------------
   CertCloseStore(hSTORE,0)                                                      ;  // Close store
   //                                                                               -----------------------------------
}
void CmdRun(string sCmdLine)  {
   //-------------------------------------------------------------------------------//
   //-------------------------------------------------------------------------------//
   string            sFct     = "CmdRun"                                         ;  //
   string            sCmd     = ""                                               ;  //
   string            sStr     = ""                                               ;  //
   string::size_type nIxs     = 0                                                ;  //
   string::size_type nIxe     = 0                                                ;  //
   //                                                                               -----------------------------------
   sStr = sCmdLine.substr(sCmdLine.length()-sPRM_SEP.length(),sPRM_SEP.length()) ;  // Get command line
   if ( sStr == sPRM_SEP  )                                                      {  //
      sCmd = sCmdLine                                                           ;}  //
   else                                                                          {  //
      sCmd = sCmdLine + sPRM_SEP                                                ;}  //
   //                                                                               -----------------------------------
   while ((nIxe = sCmd.find(sPRM_SEP, nIxe)) != string::npos)                    {  // Load parameters list
      aPRM_LST.push_back(sCmd.substr(nIxs, nIxe-nIxs))                          ;   //
      nIxe += sPRM_SEP.length()                                                 ;   //
      nIxs = nIxe                                                               ;}  //
   //                                                                               -----------------------------------
   myLg(sFct, "Command parameters:")                                             ;  // Echo params
   for (int I = 0; I<aPRM_LST.size(); I++)                                       {  //
      myLg(sFct, "Param [" + to_string(I) + "][" + aPRM_LST[I] + "]")           ;}  //
   //                                                                               -----------------------------------
   if (aPRM_LST[0]  == "CERT_ECHO")                                              {  //
      CMD_CERT_ECHO()                                                           ;}  //
   else                                                                          {  //
      myLg(sFct, "Unknow command [" + sCmd + "]")                               ;}  //
   //                                                                               -----------------------------------
}

/* ==========[ ENTRY POINT       ]==================================================*/
int main(int argc, char** argv)  {
   //-------------------------------------------------------------------------------//
   //-------------------------------------------------------------------------------//
   //                                                                               -----------------------------------
   myLg ("Main", "************************************************************") ;  //
   myLg ("Main", "* START                                                     ") ;  //
   myLg ("Main", "************************************************************") ;  //
   myLg ("Main", "                                                            ") ;  //
   //                                                                               -----------------------------------
   for (int i = 1; i < argc; i++)                                                {  //
      myLg("Main", "Run command [" + string(argv[i]) + "]")                      ;  //
      CmdRun(argv[i])                                                           ;}  //
   //                                                                               -----------------------------------
   myLg ("Main", "                                                            ") ;  //
   myLg ("Main", "************************************************************") ;  //
   myLg ("Main", "* END                                                       ") ;  //
   myLg ("Main", "************************************************************") ;  //
   //                                                                               -----------------------------------
   return 0                                                                      ;  //
}