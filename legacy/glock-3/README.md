# Glock Controller

Python code (Raspberry Pi) to drive full-octave servo-operated copper pipe glockenspiel, commanded with RTTTL ringtones delivered over MQTT.

Useful here primarily for instructions on how to operate multiple servos on a single Pi, which relies on bitbanging PWM and hence is a bit twitchy. See the comment block in `glock-controller.py` for details.