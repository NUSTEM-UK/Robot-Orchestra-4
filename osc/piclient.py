"""Glockenspiel controller -- parsing broadcast OSC to Pi-controlled servos.

Handles servo control using pigpiod for better PWM handling on a Pi. Ensure:

    sudo pigpiod

...is up before running this code.

There's built-in audio synthesis in this code, to aid debugging; comment out
handle_note line to improve performance.

Python3. Dependencies:
    pygame
    python-osc
"""

import argparse
import pygame
from time import sleep
from pythonosc import dispatcher
from pythonosc import osc_server
from gpiozero import Device, Servo
from gpiozero.pins.pigpiod import PiGPIOFactory
from mod_audio import handle_note

# Having worked out this dictionary, I've a nasty feeling I'm not going to use it.
notes_to_midi = { "A2": 45, "Bb2": 46, "B2": 47, "C3": 48, "Db3": 49, "D3": 50, 
                  "Eb3": 51, "E3": 52, "F3": 53, "Gb3": 54, "G3": 55, "Ab3": 56, 
                  "A3": 57, "Bb3": 58, "B3": 59, "C4": 60, "Db4": 61, "D4": 62, 
                  "Eb4": 63, "E4": 64, "F4": 65, "Gb4": 66, "G4": 67, "Ab4": 68, 
                  "A4": 69, "Bb4": 70, "B4": 71, "C5": 72, "Db5": 73, "D5": 74, 
                  "Eb5": 75, "E5": 76, "F5": 77, "Gb5": 78, "G5": 79 }

# Assert the high-performance GPIO PWM system
Device.pin_factory = PiGPIOFactory()

# Map MIDI notes to servos attached to numbers GPIO pins
# NB. CHANGE THIS FOR SPECIFIC GLOCKENSPIEL PI
# use `pinout` at the terminal to see pin numbers
# A Pi3 can run about 8 servos at once.

# noteServos = { "45": Servo(14), "46": Servo(15), "47": Servo(18), "48": Servo(23),
#                "49": Servo(24), "50": Servo(25), "51": Servo(8), "52": Servo(7) }
# noteServos = { "53": Servo(14), "54": Servo(15), "55": Servo(18), "56": Servo(23),
#                "57": Servo(24), "58": Servo(25), "59": Servo(8) }
noteServos = { "60": Servo(14), "61": Servo(15), "62": Servo(18), "63": Servo(23),
               "64": Servo(24), "65": Servo(25), "66": Servo(8), "67": Servo(7) }
# noteServos = { "68": Servo(14), "69": Servo(15), "70": Servo(18), "71": Servo(23),
#                "72": Servo(24), "73": Servo(25), "74": Servo(8), "75": Servo(7) }
# noteServos = { "76": Servo(14), "77": Servo(15), "78": Servo(18), "79": Servo(23) }

servoMoveTime = 0.1 # Number of secs for servo movement; default 100 msec.

# Initialise the servos!
for key in noteServos:
    noteServos[key].min()

def handleNote(unused_addr, note = ""):
    """Work out which note we're playing, and play it.

    Default note is empty, to trap Sonic Pi :rest, which is sent as a nul string.
    """
    if (note != ""):
        print(note)
        handle_note(note, 1) # We're passing in the raw MIDI number, no lookup or octave offset
        # Check to see if we have a servo for this note
        if note in noteServos:
            # Got one, so let's move it
            noteServos[note].mid()
            sleep(servoMoveTime) # Give the servo a short time to move
            noteServos[note].min() # Return servo to rest position
        else:
            print("Servo not found")


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--ip", default="10.0.1.255", help="The ip to listen on")
    parser.add_argument("--port", type=int, default="4559", help="The port to listen on")
    args = parser.parse_args()

    dispatcher = dispatcher.Dispatcher()
    dispatcher.map("/broadcast", handleNote)

    server = osc_server.ThreadingOSCUDPServer(
        (args.ip, args.port), dispatcher)
    print("Serving on {}".format(server.server_address))
    server.serve_forever()