package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
)

func rootHandler(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "text/html")
	w.WriteHeader(http.StatusOK)
	data, err := ioutil.ReadFile("index.html")
	if err != nil {
		panic(err)
	}
	w.Header().Set("Content-Length", fmt.Sprint(len(data)))
	fmt.Fprint(w, string(data))
}

func main() {
	fmt.Printf("START\n")
	http.HandleFunc("/", rootHandler)
	fmt.Printf("Lisen to 8080\n")
	log.Fatal(http.ListenAndServe(":8080", nil))
	fmt.Printf("END\n")
}