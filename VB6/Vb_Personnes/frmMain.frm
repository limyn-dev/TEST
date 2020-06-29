VERSION 5.00
Begin VB.Form frmMain 
   Caption         =   "Main"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

'------------------------------------------------------------------------------
'   Initialisation, fermeture de la forme
'==============================================================================
Private Sub Form_Initialize()

   ' Ouverture des tables
   dtaEnv.tblCtn.Open
   dtaEnv.tblLoc.Open NOMTBLLOC, dbPrs
   'dtaEnv.tblNpa.Open NOMTBLNPA, dbPrs
   'dtaEnv.tblFam.Open NOMTBLFAM, dbPrs
   'dtaEnv.tblPrs.Open NOMTBLPRS, dbPrs
   dtaEnv.tblN_L.Open NOMTBLN_L, dbPrs
   'dtaEnv.tblP_L.Open NOMTBLP_L, dbPrs

End Sub
'------------------------------------------------------------------------------
Private Sub Form_Terminate()
 
   ' Fermeture des tables
   dtaEnv.tblN_L.Close
   'dtaEnv.tblP_L.Close
   'dtaEnv.tblPrs.Close
   'dtaEnv.tblFam.Close
   dtaEnv.tblNpa.Close
   dtaEnv.tblLoc.Close
   dtaEnv.tblCtn.Close
   
End Sub
