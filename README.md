# Robot-Orchestra-4

Version of the Robot Orchestra, autumn 2018, for a five-week Maker Club run at St. Wilfreds College, South Shields, UK.

Plans as of 2018-10-24:

* Copper pipe glockenspiel, likely servo-actuated (or possibly solenoid?).
* Drive system from previous RTTTL-based requests handlers.
* Alternatively, drive system from Sonic Pi via OSC.

In principle, OSC control should be lower-latency, and relying on Sonic Pi for sync/tempo control should actually work, in comparison to the earlier Python version which is a comparatively rubbish drummer.

## Progress log 2018-10-24

This is all proof-of-concept at this stage:

* OSC sending (`/experiments/osctest3.py`), listening (`/experiments/osctest2.py`) and broadcast listening (`/experiments/osctest2.py`, with --ip 10.0.1.255) working in Python.
* OSC receiving working on Wemos D1 mini, `ESP8266_instrument`.
* Basic test of Sonic Pi sending, to a specific IP address.

It looks like Sonic Pi doesn't currently support sending OSC to broadcast. Gnats.

## Progress log 2018-11-10

With contributions from Robin Newman via the Sonic Pi forums and several bits of code pinched from previous incarnations of the Orchestra, the following components are now working (for some values of 'working'):

* RTTTL to Sonic Pi parser. A subset of (mostly festive) songs has been translated from the full ringtone library.
* Generated Sonic Pi scripts play via the built-in synthesiser and out to a designated OSC server, simultaneously.
* Python script to act as OSC server-to-broadcast (ex-Robin)
* Python OSC endpoint, with servo handling and mapping to individual glockenspiel bars.
* Glockenspiel calculations complete, with several bars made (and tested to within 2Hz of correct tuned).
* Another python script parses the Sonic Pi code and returns the list of notes required, in MIDI notation. We can use this to prioritise which bars to cut (example: we've already cut a :Db4, which is accurate to within 1Hz but not required by any of the songs currently in our library. Oops).

Two weeks of the club left!