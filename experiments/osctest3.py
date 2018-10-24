"""This time we're sending.

This program sends 10 random values between 0.0 and 1.0 to the /test address,
waiting for a delay between each value.
"""

import argparse
import random
import time

from pythonosc import osc_message_builder
from pythonosc import udp_client


if __name__ == "__main__":
  parser = argparse.ArgumentParser()
  parser.add_argument("--ip", default="10.0.1.255",
      help="The ip of the OSC server")
  parser.add_argument("--port", type=int, default=4559,
      help="The port the OSC server is listening on")
  args = parser.parse_args()

# The closing `True` below allows broadcast sending.
  client = udp_client.SimpleUDPClient(args.ip, args.port, True)
#   client = udp_client.SimpleUDPClient(args.ip, args.port)
  
  for x in range(10):
    client.send_message("/test/blueberry", random.random())
    time.sleep(0.25)