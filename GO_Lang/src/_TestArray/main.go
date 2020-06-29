package main

import "fmt"

func main() {

   fmt.Println("")
   fmt.Println("Static array")
   var tStr [3]string
   tStr[0] = "S1"
   tStr[1] = "S2"
   tStr[2] = "S3"
   fmt.Println(tStr)
   
   fmt.Println("")
   fmt.Println("Slice")
   var tAr2 []string
   tAr2 = make([]string, 3)
   tAr2[0] = "AR2-A"
   tAr2[1] = "AR2-B"
   tAr2[2] = "AR2-C"
   fmt.Println(tAr2)
   
   fmt.Println("")
   fmt.Println("Append")
   tAr3 := []string {"A3-A", "A3-B", "A3-C"}
   fmt.Println(tAr3)
   tAr3 = append(tAr3, "A3-NEW")
   fmt.Println(tAr3)
   
}