package main

import (
   "bytes"
   "strings"
   "strconv"
   "fmt"
   "os"
   "path/filepath" 
)

var myITM_LST map[string]map[string]string
var myCHK_NME string
/*
 * Entry
 */
func main() {      
   var sPth string
   var sUin string
   
   myITM_LST = make(map[string]map[string]string)
   //                                                                               -----------------------------------
   myCHK_NME = "A"                                                                  // First scan
   sPth = "C:\\_\\TEST"                                                             //
   ScanDirectory(sPth)                                                              //
   //                                                                               -----------------------------------
   fmt.Println("Make system change")                                                //
   fmt.Scanln(&sUin)                                                                //
    //                                                                               -----------------------------------
    myCHK_NME = "B"                                                                  // Second scan
    ScanDirectory(sPth)                                                              //
    //                                                                               -----------------------------------
    ItemsShow()
    //                                                                               -----------------------------------   
}
/*
 * Events
 */
var CallBackWalkFunc = func (path string, f os.FileInfo, err error) error {
   var sPth string
   var sTag string
   var mTgl map[string]string
   var bFnd bool
   //                                                                               -----------------------------------   
   sPth = strings.ToLower(path)                                                     // Set item path
   //                                                                               -----------------------------------
   if f.IsDir() {                                                                   // Set item TAG
      sTag = "DIR"                                                                  //    
      sTag = SCat(sTag, ";")                                                        //
      sTag = SCat(sTag, strings.ToLower(f.Name()))                                  //
   } else {                                                                         //
      sTag = "FILE"                                                                 //
      sTag = SCat(sTag, ";")                                                        //
      sTag = SCat(sTag, strings.ToLower(f.Name()))                                  //
      sTag = SCat(sTag, ";")                                                        //
      sTag = SCat(sTag,strconv.FormatInt(f.Size(), 10))                             //
      sTag = SCat(sTag, ";")                                                        //
      sTag = SCat(sTag,f.ModTime().String())                                        //
      sTag = SCat(sTag, ";")                                                        //
      sTag = SCat(sTag,path)                                                        //
   }                                                                                //
   //                                                                               -----------------------------------   
   mTgl, bFnd = myITM_LST[sPth]                                                     // Get TAG list of path
   if bFnd {                                                                        //    Path exists
      _, bFnd := mTgl[sTag]                                                         //    Check if TAG exists
      if bFnd {                                                                     //
         mTgl[sTag] = SCat(mTgl[sTag], myCHK_NME)                                   //       TAG exists update
      } else {                                                                      //
         mTgl[sTag] = myCHK_NME                                                     //       TAG not exists
      }                                                                             //
   } else {                                                                         //    Path not exists, create it
      mTgl            = make(map[string]string)                                     //
      mTgl[sTag]      = myCHK_NME                                                   //
      myITM_LST[sPth] = mTgl                                                        //
   }                                                                                //
   //                                                                               -----------------------------------      
   return nil                                                                       //
}
/*
 * Functions
 */
func ScanDirectory (sDirectory string)  {
   fmt.Printf("Scan directory [%v]\n", sDirectory)
   var err error = filepath.Walk(sDirectory, CallBackWalkFunc)
   if err != nil { fmt.Println("ERROR durring path scanning") }
}
func ItemsResult   ()                   {
    var mTgl map[string]string
    var sVal string
    var tMod map[string]string
    var tNew map[string]string
    var tDel map[string]string

    tMod = make(map[string]string)
    tNew = make(map[string]string)
    tDel = make(map[string]string)

    for P := range myITM_LST  {
        mTgl = myITM_LST[P]
        if len(mTgl) == 2 {
            for K := range mTgl {
                sVal = SCat(sVal, "[")
                sVal = SCat(sVal, K)
                sVal = SCat(sVal, "]")
            }
            tMod[P] = sVal     
        } else {
            for K := range mTgl { sVal = K }
            switch os := runtime.GOOS; os {
            case "darwin":
                fmt.Println("OS X.")
            case "linux":
                fmt.Println("Linux.")
            default:
                // freebsd, openbsd,
                // plan9, windows...
                fmt.Printf("%s.", os)
            }
        }


     }
   

}
func ItemsShow     ()                   {
   var mTgl map[string]string
   var sVal string
   
   for P := range myITM_LST  {
      fmt.Printf("Path [%v]\n", P)
      mTgl = myITM_LST[P]
      for T := range mTgl  {
         sVal = mTgl[T]
         fmt.Printf("   TAG [%v] -> [%v]\n", T, sVal)
      }
   }

}   
func SCat (S1 string, S2 string) string {
   var oBuf bytes.Buffer
   oBuf.WriteString(S1)      
   oBuf.WriteString(S2)      
   return oBuf.String()
}