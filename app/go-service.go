package main

import (
	"fmt"
	"net/http"
	"os"
	"time"
)

func handler(w http.ResponseWriter, r *http.Request) {
	h, _ := os.Hostname()

	// Simulate doing time consuming work
	time.Sleep(10 * time.Second) // This line must remain intact.

	fmt.Fprintf(w, "Hi there, I'm served from %s!", h)
}

func main() {
	http.HandleFunc("/", handler)
	http.ListenAndServe(":8484", nil)
}
