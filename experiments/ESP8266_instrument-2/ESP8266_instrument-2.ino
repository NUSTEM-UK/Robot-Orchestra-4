/*---------------------------------------------------------------------------------------------

First version of OSC-listening instrument

Based heavily on OSC example code.
Listening to specific IP.

This version has runtime-assignable addressing, but expanding beyond the previous ping D5/6/7 
3-bit addressing prevents INPUT_PULLUP driving defualt assignment (ie. pins have to be pulled
high or low manually), which adds complexity.

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
// const IPAddress outIp(10,0,1,3);        // remote IP (not needed for receive)
const IPAddress outIp(192,168,4,1);        // remote IP (not needed for receive)
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
#define PIN_SERVO D4
#define PIN_SERVO2 D3

Servo myservo;
Servo myservo2;

#define PIN_UNITS D0
#define PIN_TWOS D5
#define PIN_FOURS D6
#define PIN_EIGHTS D7
#define PIN_SIXTEENS D1
#define PIN_THIRTYTWOS D2

int myOldNote = 60;
int myNote = 60; // Middle C

// Temp storage of channel data, read from pins in loop.
int units;
int twos;
int fours;
int eights;
int sixteens;
int thirtytwos;

int baseNote = 45;

// Define how far the servo moves
// Fiddling with this is rare, and note that the servo rarely has time to reach angleTwitch
const int angleRest = 0;          // Initial angle of servo
const int angleTwitch = 180;      // Deflection target angle if we're playing a beat
const int actionTime = 100;       // Fro how many msec do we allow the servo to move?

void setup() {
  pinMode(BUILTIN_LED, OUTPUT);
  digitalWrite(BUILTIN_LED, ledState);    // turn *on* led

  // Set up 6-bit note addressing. Gives us 64 possible notes.
  // Note that input-pullup doesn't quite work
  pinMode(PIN_UNITS, INPUT_PULLUP); // units
  pinMode(PIN_TWOS, INPUT_PULLUP); // twos
  pinMode(PIN_FOURS, INPUT_PULLUP); // fours
  pinMode(PIN_EIGHTS, INPUT_PULLUP); // eights
  pinMode(PIN_SIXTEENS, INPUT_PULLUP); // sixteens
  pinMode(PIN_THIRTYTWOS, INPUT_PULLUP); // thirtytwos

  myservo.attach(PIN_SERVO);
  myservo2.attach(PIN_SERVO2);

  myservo.write(angleRest);
  myservo2.write(angleRest);

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

  digitalWrite(D8, HIGH);

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
  received_value = msg.getInt(0);
  Serial.print("/broadcast/: ");
  Serial.println(received_value);
  // Now check if we should play it
  if ( int(received_value) == myNote ) {
    Serial.println(">>> PLAYING!");
    twitch(myservo, angleTwitch);
    delay(actionTime); // Time for movement
    twitch(myservo, angleRest);
    // No delay here, which I may regret.
  } else if ( int(received_value) == (myNote + 1) ) {
    Serial.println(">>> PLAYING 2!");
    twitch(myservo2, angleTwitch);
    delay(actionTime);
    twitch(myservo2, angleRest);
  }
}

void loop() {
  OSCMessage msg;
  int size = Udp.parsePacket();

  if (size > 0) {
    while (size--) {
      msg.fill(Udp.read());
    }
    if (!msg.hasError()) {
      msg.dispatch("/broadcast", playn);
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
  units = digitalRead(PIN_UNITS);
  twos = digitalRead(PIN_TWOS);
  fours = digitalRead(PIN_FOURS);
  eights = digitalRead(PIN_EIGHTS);
  sixteens = digitalRead(PIN_SIXTEENS);
  thirtytwos = digitalRead(PIN_THIRTYTWOS);

  // Debug!
  // Serial.print(thirtytwos);
  // Serial.print(sixteens);
  // Serial.print(eights);
  // Serial.print(fours);
  // Serial.print(twos);
  // Serial.println(units);
  // delay(1000);

  myNote = baseNote + (32 * thirtytwos) + (16 * sixteens) + (8 * eights) + (4 * fours) + (2 * twos) + (units);
  if (myNote != myOldNote) {
    Serial.print("Target note changed to: ");
    Serial.println(myNote);
    myOldNote = myNote;
  }
}


void led(OSCMessage &msg) {
  ledState = msg.getInt(0);
  digitalWrite(BUILTIN_LED, ledState);
  Serial.print("/test: ");
  Serial.println(ledState);
}
