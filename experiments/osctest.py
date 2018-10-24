"""Test message receipt over OSC in Python 3.

Using the osc4py3 module:

    pip3 install osc4py3

The following is more-or-less sample code from the documentation
(https://osc4py3.readthedocs.io/en/latest/userdoc.html)

Notes:
* osc4py3 handles threading for the message handlers. WooT!
* osc4py3.as_eventloop does *no* threading. See documentation.
* Doesn't seem to work, drat.
"""

from osc4py3.as_eventloop import *
from osc4py3 import oscmethod as osm
from time import sleep

def handlerfunction(s, x, y):
    # Will receive message data unpacked in s, x, y
    print(s, x, y)
    pass

def handlerfunction2(address, s, x, y):
    # Will receive message address, and message data flattened in s, x, y
    print(address, s, x, y)
    pass

# Start the system
osc_startup()

# Make server channels to recieve packets
osc_udp_server("10.0.1.6", 4559, "iMac")
# osc_broadcast_client

# Associate Python functions with message address patterns, 
# using default argument scheme OSCARG_DATAUNPACK
# osc_method("/test/*", handlerfunction)
osc_method("/test/*", handlerfunction)
# As above, but request the message address pattern before in argscheme
# osc_method("/test/*", handlerfunction2, argscheme=osm.OSCARG_ADDRESS + osm.OSCARG_DATAUNPACK)
osc_method("*", handlerfunction2, argscheme=osm.OSCARG_ADDRESS + osm.OSCARG_DATAUNPACK)


# Periodically call osc4py3 processing method in the event loop
finished = False
while not finished:
    # ...
    osc_process()
    sleep(0.01)
    # ...

# Properly close the system
osc_terminate()