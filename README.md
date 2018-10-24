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