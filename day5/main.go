package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

func main() {
	dir := "./shared"

	if _, err := os.Stat(dir); os.IsNotExist(err) {
		log.Fatalf("Directory '%s' does not exist. Please create it.", dir)
	}

	fileServer := http.FileServer(http.Dir(dir))

	http.Handle("/", fileServer)

	port := "8080"
	fmt.Printf("Serving files on http://localhost:%s/\n", port)
	err := http.ListenAndServe(":"+port, nil)
	if err != nil {
		log.Fatalf("Error starting server: %s", err)
	}
}
