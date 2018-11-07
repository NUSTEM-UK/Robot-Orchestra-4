/*---------------------------------------------------------------------------------------------

First version of OSC-listening instrument

Based heavily on OSC example code.
Listening to specific IP.

--------------------------------------------------------------------------------------------- */
#ifdef ESP8266
#include <ESP8266WiFi.h>
#else
#include <WiFi.h>
#endif
#include <WiFiUdp.h>
#include <OSCMessage.h>
#include <OSCBundle.h>
#include <OSCData.h>
#include <Servo.h>

// I appear to need function prototypes?!
void twitch(Servo &theServo, int angle);
void playn();
void updateChannel();
void bong_handler(OSCMessage &msg);


char ssid[] = "nustem";          // your network SSID (name)
char password[] = "nustem123";                    // your network password

// A UDP instance to let us send and receive packets over UDP
WiFiUDP Udp;
//const IPAddress outIp(10,40,10,105);        // remote IP (not needed for receive)
const IPAddress outIp(10,0,1,3);        // remote IP (not needed for receive)
const unsigned int outPort = 4559;          // remote port (not needed for receive)
const unsigned int localPort = 4559;        // local port to listen for UDP packets (here's where we send the packets)


OSCErrorCode error;
unsigned int ledState = LOW;              // LOW means led is *on*
float received_value = 0.0;

#ifndef BUILTIN_LED
#ifdef LED_BUILTIN
#define BUILTIN_LED LED_BUILTIN
#else
#define BUILTIN_LED 13
#endif
#endif

// Pin definitions
#define PIN_SERVO D1

Servo myservo;

int myNote = 60; // Middle C

// Temp storage of channel data, read from pins in loop.
int units;
int twos;
int fours;
int eights;
int sixteens;

int baseNote = 48;

// Define how far the servo moves
// Fiddling with this is rare, and note that the servo rarely has time to reach angleTwitch
const int angleRest = 0;          // Initial angle of servo
const int angleTwitch = 180;      // Deflection target angle if we're playing a beat
const int actionTime = 100;       // Fro how many msec do we allow the servo to move?

void setup() {
  pinMode(BUILTIN_LED, OUTPUT);
  digitalWrite(BUILTIN_LED, ledState);    // turn *on* led

  // Set up 5-bit note addressing. Gives us 32 possible notes.
  pinMode(D0, INPUT_PULLUP);
  pinMode(D5, INPUT_PULLUP);
  pinMode(D6, INPUT_PULLUP);
  pinMode(D7, INPUT_PULLUP);
  pinMode(D8, INPUT_PULLUP);

  Serial.begin(115200);
  // setup_wifi();

  // Connect to WiFi network
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

  Serial.println("Starting UDP");
  Udp.begin(localPort);
  Serial.print("Local port: ");
#ifdef ESP32
  Serial.println(localPort);
#else
  Serial.println(Udp.localPort());
#endif

}


void playn(OSCMessage &msg) {
  // We have a note!
  received_value = msg.getFloat(0);
  Serial.print("/note/: ");
  Serial.println(received_value);
  // Now check if we should play it
  if ( int(received_value) = myNote ) {
    twitch(myservo, angleTwitch);
    delay(actionTime); // Time for movement
    twitch(myservo, angleRest);
    // No delay here, which I may regret.
  }
}

void bong_handler(OSCMessage &msg) {
  Serial.println(">>>BONG!");
}

void tish_handler(OSCMessage &msg) {
  Serial.println(">>>tish!");
}

void loop() {
  OSCMessage msg;
  int size = Udp.parsePacket();

  if (size > 0) {
    while (size--) {
      msg.fill(Udp.read());
    }
    if (!msg.hasError()) {
      msg.dispatch("/rorch/note", playn);
      msg.dispatch("/test/bong", bong_handler);
      msg.dispatch("/test/tish", tish_handler);
    } else {
      error = msg.getError();
      Serial.print("error: ");
      Serial.println(error);
    }
  }
  updateChannel();
}

void twitch(Servo &theServo, int angle) {
  theServo.write(angle); // Move towards chosen angle
}

void updateChannel() {
  units = !digitalRead(D0);
  twos = !digitalRead(D5);
  fours = !digitalRead(D6);
  eights = !digitalRead(D7);
  sixteens = !digitalRead(D8);

  myNote = baseNote + (16 * sixteens) + (8 * eights) + (4 * fours) + (2 * twos) + (units);
}


void led(OSCMessage &msg) {
  ledState = msg.getInt(0);
  digitalWrite(BUILTIN_LED, ledState);
  Serial.print("/test: ");
  Serial.println(ledState);
}
