package main

import (
	"github.com/gorilla/mux"
	"github.com/joho/godotenv"
	"log"
	"net/http"
	"net/http/httputil"
	"net/url"
	"os"
	"strings"
)

/*
	reverse proxy redirecting to golang server or django server
 */

func getEnv(key string) string{
	return os.Getenv(key)
}

func getListenAddress() string {
	port := getEnv("PORT")
	return ":" + port
}


func getProxyUrl(r *http.Request) string{


	proxyCondition := strings.ToLower(r.URL.Query().Get("condition"))

	markUpdateCondition := getEnv("UPDATE_MARKS_CONDITION")
	//defaultCondition := getEnv("DEFAULT_CONDITION")


	if proxyCondition == markUpdateCondition {
		return getEnv("UPDATE_MARKS_URL")
	}

	deleteURLParam("condition", r.URL)

	return getEnv("DEFAULT_URL")

}


func serveReverseProxy(target string, w http.ResponseWriter, r *http.Request){
	url, _ := url.Parse(target)

	proxy := httputil.NewSingleHostReverseProxy(url)

	r.URL.Host = url.Host
	r.URL.Scheme = url.Scheme
	r.Header.Set("X-Forwarded-Host", r.Header.Get("Host"))
	r.Host = url.Host

	log.Printf("Redirected to %s", r.URL)

	proxy.ServeHTTP(w, r)
}

func deleteURLParam(key string, u *url.URL){
	query, _ := url.ParseQuery(u.RawQuery)
	query.Del(key)
	u.RawQuery = query.Encode()
}

func handleRequestAndRedirect(w http.ResponseWriter, r *http.Request){
	url := getProxyUrl(r)
	serveReverseProxy(url, w, r)
}


func logSetup() {
	updateMarksURL := getEnv("UPDATE_MARKS_URL")
	updateMarksCondition := getEnv("UPDATE_MARKS_CONDITION")
	defaultURL := getEnv("DEFAULT_URL")
	defaultCondition := getEnv("DEFAULT_CONDITION")

	log.Printf("Server will run on: %s\n", getListenAddress())
	log.Printf("Redirecting %s to url: %s\n", updateMarksCondition, updateMarksURL)
	log.Printf("Redirecting %s to url: %s\n", defaultCondition, defaultURL)
}


func main(){
	godotenv.Load(".env")
	router := mux.NewRouter()
	router.Path("/{path}/").HandlerFunc(handleRequestAndRedirect)

	logSetup()
	log.Fatal(http.ListenAndServe(getListenAddress(), router))
}