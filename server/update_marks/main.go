package main

import (
	"fmt"
	"net/http"
)

func temp(w http.ResponseWriter, r *http.Request){
	w.Write([]byte("ok"))
}

func main(){
	http.HandleFunc("/", temp)
	fmt.Println("Listening on: 8001")
	http.ListenAndServe(":8001", nil)
}