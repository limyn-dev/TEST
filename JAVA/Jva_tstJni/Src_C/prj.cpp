//---------------------------------------------------------------------------

#include <windows.h>

#include "CNative.cpp"

//---------------------------------------------------------------------------
//   Remarque importante à propos de la gestion mémoire de la DLL lorsque votre
//   DLL utilise la version statique de la Bibliothèque d'exécution :
//
//   Si votre DLL exporte des fonctions passant des objets String (ou des structures
//   ou classes contenant des Strings) comme paramètres ou résultats de fonctions,
//   vous devez ajouter la bibliothèque MEMMGR.LIB à votre projet DLL et à tous
//   les projets utilisant la DLL.  Vous devez également utiliser MEMMGR.LIB si
//   d'autres projets qui utilisent la DLL effectuent des opérations de création ou de 
//   suppression sur des classes non dérivées de TObject, exportées par la DLL.
//   Ajouter MEMMGR.LIB à votre projet DLL modifie la DLL et les EXE appelant
//   pour qu'ils utilisent BORLNDMM.DLL comme gestionnaire de mémoire. Dans ce
//   cas, le fichier BORLNDMM.DLL doit être déployé en même temps que la DLL.
//
//   Pour éviter d'utiliser BORLNDMM.DLL, passez les chaînes comme paramètres
//   "char" ou ShortString.
//
//   Si votre DLL utilise la version dynamique de la RTL, vous n'avez pas besoin
//   d'ajouter MEMMGR.LIB car cela est fait automatiquement.
//---------------------------------------------------------------------------


//---------------------------------------------------------------------------
