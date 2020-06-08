# smart-trash-bin-iot-based
Smart Trash Bin is a trash bin that  integrated with the Internet of Things. Users who will dispose of waste, will receive compensation in the form of electronic money that can be used to buy sponsored products. The advantage of partners who will work together with this party is that they can market their products widely while reducing waste in the environment.

Database: 
To configure database, click functions.php and change the name of username, password and database name.

Electronic :
1. Use Arduino IDE
2. Change the SSID and password name to your access point
3. Use nodemcu board
4. Install library :
include <ArduinoJson.h>
#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>
#include <Servo.h> 
5. Plug this these pin :
a. Trigger Pin of ultrasonic to D0
b. Echo pin of ultrasonic to D1
c. servo pin to D2

*Since the minimum input voltage of ultrasonic and servo motor is 5V, use external power supply or make a step up voltage circuit
