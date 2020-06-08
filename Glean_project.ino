#include <ArduinoJson.h>
#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>
#include <Servo.h> 

// atur koneksi
const char* ssid     = "hotspotku"; //nama wifi
const char* password = "password"; //password
const char* host = "192.168.43.134"; //IP PC

const int pTrig = D0;
const int pEcho = D1;
int servoPin = D2;
 
int jarak;
long durasi = 0;
int intensitas;

// KODE DEFAULT
String kode_default = "KNMS123";

// Create a servo object 
Servo Servo1;

void setup() {
  pinMode(pTrig, OUTPUT);
  pinMode(pEcho, INPUT);
  // We need to attach the servo to the used pin number 
  Servo1.attach(servoPin);
  // Make servo go to 0 degrees 
   Servo1.write(0);  
  Serial.begin(115200);
  delay(10);
 
  Serial.println();
  Serial.println();
  Serial.print("Connecting to ");
  Serial.println(ssid);
 
  WiFi.begin(ssid, password);
 
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
 
  Serial.println("");
  Serial.println("WiFi connected");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());

}

void loop() {
  //membaca data
 String url = "http://192.168.43.134/webprog/template/dashboard/back.php";
  if (WiFi.status() == WL_CONNECTED) { 
    HTTPClient http;  
    http.begin(url);
    int httpCode = http.GET();                                                       
    if (httpCode > 0) {
      String payload = http.getString();
      Serial.println("HTTP Response Code : ");
      Serial.println(httpCode);
      Serial.println("HTTP Response Payload : ");
      
      //Parsing
      const size_t bufferSize = JSON_OBJECT_SIZE(3);
      DynamicJsonBuffer jsonBuffer(bufferSize);
      JsonObject& root = jsonBuffer.parseObject(http.getString());
      // Parameters
      const char* username = root["username"]; // "username"
      const char* kode = root["kode"]; // "kode"
      const int acak = root["acak"]; //kode acak
      // Output to serial monitor
      Serial.print("Username:");
      Serial.println(username);
      Serial.print("kode tempat sampah:");
      Serial.println(kode);
      Serial.print("kode acak: ");
      Serial.println(acak);
      String kode_string = String(kode);
      //kalau kode sesuai
      if (kode_string == kode_default ){
      //eksekusi perintah
      Serial.println ("Eksekusi tulisan ini");
      
      delay(500);
      //Ultrasonik sesnsing
      digitalWrite(pTrig, HIGH);
      delayMicroseconds(10);
      digitalWrite(pTrig, LOW);
      durasi = pulseIn(pEcho, HIGH);
      jarak = (durasi *0.034)/2;
    while(jarak>0){
    digitalWrite(pTrig, HIGH);
    delayMicroseconds(10);
    digitalWrite(pTrig, LOW);
    durasi = pulseIn(pEcho, HIGH);
    jarak = (durasi *0.034)/2;
    Serial.println(jarak);
    delay(500);
    if(jarak<5){
      Serial.println("Ok");
      break;
      }
    }
       // tempat sampah terbuka
       Servo1.write(90);  
       //kirim data tersebut ke database
       Serial.println("Mengirim data...");
       WiFiClient client;
  const int httpPort = 80;
  if (!client.connect(host, httpPort)) {
    Serial.println("connection failed");
    return;
  }
 
  // We now create a URI for the request
  String url = "/webprog/template/dashboard/datasensor/add.php?";
  url += "username=";
  url += username;
  url += "&";
  url += "kode=";
  url += kode;
  url += "&";
  url += "acak=";
  url += acak;
 
  Serial.print("Requesting URL: ");
  Serial.println(url);

// Mengirimkan Request ke Server -----------------------------------------------
  client.print(String("GET ") + url + " HTTP/1.1\r\n" +
               "Host: " + host + "\r\n" +
               "Connection: close\r\n\r\n");
  unsigned long timeout = millis();
  while (client.available() == 0) {
    if (millis() - timeout > 1000) {
      Serial.println(">>> Client Timeout !");
      client.stop();
      return;
    }
  }

// Read all the lines of the reply from server and print them to Serial
  while (client.available()) {
    String line = client.readStringUntil('\r');
    //Serial.print(line);
  }

  Serial.println();
  Serial.println("closing connection");
  
  //end kirim  
      }
      else{
        Serial.print("Kode gak sama");}
    }
   http.end();  
  }else
  if (WiFi.status() != WL_CONNECTED) {
    Serial.println("NodeMCU tidak terhubung ke Access Point");
    wifiConnecting();
  }
  // Make servo go to 0 degrees 
   Servo1.write(0); 
}

  
void wifiConnecting(){
  while (WiFi.status() != WL_CONNECTED) {
    Serial.println("Menghubungkan ke Access Point");
    for(int c=0;c<3;c++){
      Serial.print(" .");
      delay(1000);
    }
    Serial.println();
  }
}

