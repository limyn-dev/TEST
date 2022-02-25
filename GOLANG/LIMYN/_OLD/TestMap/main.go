package main

import "fmt"

func main() {
   var oMap map[int]string
   var oMp2 map[string]map[int]string
   var nItm int = 2
  
   fmt.Println("-----------------------------------------------------------------")
  
   fmt.Println("")
   fmt.Println("Create map")
   oMap = make(map[int]string)
   fmt.Println(oMap)
  
   fmt.Println("")
   fmt.Println("Add item to map")
   oMap[1] = "string 1"
   oMap[2] = "string 2"
   oMap[3] = "string 3"
   fmt.Println(oMap)
  
   fmt.Println("")
   fmt.Printf("Change item [%d]\n", nItm)
   oMap[nItm] = "NEW ITEM"
   fmt.Println(oMap)
  
   fmt.Println("")
   fmt.Printf("Remove item[%d]\n", nItm)
   delete(oMap, nItm)
   fmt.Println(oMap)
  
   fmt.Println("")
   fmt.Println("Check if key exists")
   for nItm=1;nItm<=3;nItm++{
      sVal, ok := oMap[nItm]
      if ok {
         fmt.Printf("Value of item [%v] = [%v]\n", nItm, sVal)
      } else {
         fmt.Printf("Item with key [%v] not exists\n", nItm)
      }
   }
  
   fmt.Println("")
   fmt.Println("Create a Map of map")
   oMp2 = make(map[string]map[int]string)
   oMap = make(map[int]string)
   oMap[1] = "V11"
   oMap[2] = "V12"
   oMp2["ITEM1"] = oMap
   oMap = make(map[int]string)
   oMap[1] = "V21"
   oMap[2] = "V22"
   oMp2["ITEM2"] = oMap
   oMp2["ITEM2"] = oMap
   fmt.Println(oMp2)
  
   fmt.Println("")
   fmt.Println("Update a Map of map")
   oMp2["ITEM2"][1] = "NEW-VALUE"
   fmt.Println(oMp2)
  
  
}