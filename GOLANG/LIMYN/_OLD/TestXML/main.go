package main

import (
	"os"
	"fmt"
	"xml"
)

type oItem struct {
    sPropA string `xml:"property,attr"`
    sPropB string `xml:",chardata"`
}
type oList struct {
    aItems []oItem `xml:"oItem"`
}

func XmlRead {
/*
	var q Query

	oFle, oErr := os.Open("Test.xml")
	if oErr != nil {
		fmt.Println("Error opening file:", err)
		return
	}
	defer xmlFile.Close()
	
	
	xml.Unmarshal(oFle, &q)
	fmt.Println(q.Series)
*/
}
func main() {
	
		oIt1 := fact{"some_property","This is the data!"}
		oIt2 := fact{"another_property","This is some more data!"}
		f    := []fact{fact_1, fact_2}
		oLst := aList{f}
	
		// The Magic
		b, err := xml.Marshal(c)
		if err != nil {
			panic(err)
		}
	
		println(string(b))

}