package main

import (
	"bytes"
	"encoding/json"
	"github.com/joho/godotenv"
	"io/ioutil"
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

type requestPayloadStruct struct {
	ProxyCondition string `json:"proxy_condition"`
}


func getEnv(key string) string{
	return os.Getenv(key)
}

func getListenAddress() string {
	port := getEnv("PORT")
	return ":" + port
}


func requestBodyDecoder(r *http.Request) *json.Decoder{
	body, err := ioutil.ReadAll(r.Body)
	if err != nil{
		log.Fatalf("Error reading body: %v", err)
	}

	r.Body = ioutil.NopCloser(bytes.NewBuffer(body))

	return json.NewDecoder(ioutil.NopCloser(bytes.NewBuffer(body)))
}


func parseRequestBody(r *http.Request) requestPayloadStruct{
	decoder := requestBodyDecoder(r)

	var requestPayload requestPayloadStruct
	err := decoder.Decode(&requestPayload)

	if err != nil{
		panic(err)
	}

	return requestPayload
}



func getProxyUrl(proxyConditionRaw string) string{
	proxyCondition := strings.ToLower(proxyConditionRaw)

	markUpdateCondition := getEnv("UPDATE_MARKS_CONDITION")
	//defaultCondition := getEnv("DEFAULT_CONDITION")



	if proxyCondition == markUpdateCondition {
		return getEnv("UPDATE_MARKs_URL")
	}

	return getEnv("DEFAULT_URL")
}


func serveReverseProxy(target string, w http.ResponseWriter, r *http.Request){
	url, _ := url.Parse(target)

	proxy := httputil.NewSingleHostReverseProxy(url)

	r.URL.Host = url.Host
	r.URL.Scheme = url.Scheme
	r.Header.Set("X-Forwarded-Host", r.Header.Get("Host"))
	r.Host = url.Host

	proxy.ServeHTTP(w, r)
}


func handleRequestAndRedirect(w http.ResponseWriter, r *http.Request){
	requestPayload := parseRequestBody(r)
	url := getProxyUrl(requestPayload.ProxyCondition)

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
	http.HandleFunc("/", handleRequestAndRedirect)
	logSetup()
	if err := http.ListenAndServe(getListenAddress(), nil); err != nil{
		panic(err)
	}
}