//---------------------------------------------------------------------------

#include <windows.h>

#include "CNative.cpp"

//---------------------------------------------------------------------------
//   Remarque importante � propos de la gestion m�moire de la DLL lorsque votre
//   DLL utilise la version statique de la Biblioth�que d'ex�cution :
//
//   Si votre DLL exporte des fonctions passant des objets String (ou des structures
//   ou classes contenant des Strings) comme param�tres ou r�sultats de fonctions,
//   vous devez ajouter la biblioth�que MEMMGR.LIB � votre projet DLL et � tous
//   les projets utilisant la DLL.  Vous devez �galement utiliser MEMMGR.LIB si
//   d'autres projets qui utilisent la DLL effectuent des op�rations de cr�ation ou de 
//   suppression sur des classes non d�riv�es de TObject, export�es par la DLL.
//   Ajouter MEMMGR.LIB � votre projet DLL modifie la DLL et les EXE appelant
//   pour qu'ils utilisent BORLNDMM.DLL comme gestionnaire de m�moire. Dans ce
//   cas, le fichier BORLNDMM.DLL doit �tre d�ploy� en m�me temps que la DLL.
//
//   Pour �viter d'utiliser BORLNDMM.DLL, passez les cha�nes comme param�tres
//   "char" ou ShortString.
//
//   Si votre DLL utilise la version dynamique de la RTL, vous n'avez pas besoin
//   d'ajouter MEMMGR.LIB car cela est fait automatiquement.
//---------------------------------------------------------------------------


//---------------------------------------------------------------------------
