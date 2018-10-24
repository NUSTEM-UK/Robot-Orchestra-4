"""Test message receipt over OSC in Python 3.

Using the python-osc module:

    pip3 install python-osc

Working from example code:
https://rbnrpi.wordpress.com/sonic-pi-3-says-hello-to-raspberry-pi-gpio/
and from python-osc docs:
https://pypi.org/project/python-osc/

Notes:

* Works, but I can't get broadcast to receive...
* After a reboot, listening to --ip 10.0.1.255 does trigger on broadcast send. Weird.

"""

import argparse
from time import sleep

from pythonosc import dispatcher, osc_server

delta = 0.25 # timing correction

def handle_cabbage(unused_addr):
    sleep(delta)
    print("CABBAGE!")

def handle_argument(unused_addr, args, volume):
    sleep(delta * 2)
    print(volume)

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--ip", default="127.0.0.1", help="The ip to listen on")
    parser.add_argument("--port", type=int, default=8000, help="The port to listen on")
    args = parser.parse_args()

    dispatcher = dispatcher.Dispatcher()
    dispatcher.map("/test/*", print)
    dispatcher.map("/test/cabbage", handle_cabbage)
    dispatcher.map("/test/blueberry", handle_argument, "Args")
    
    server = osc_server.ThreadingOSCUDPServer((args.ip, args.port), dispatcher)
    server.allow_reuse_address = True
    print("Listening on {}".format(server.server_address))
    server.serve_forever()
