import argparse
from pythonosc import dispatcher
from pythonosc import osc_server



def handleNote(unused_addr, note = ""):
    """Work out which note we're playing, and play it.

    Default note is empty, to trap Sonic Pi :rest, which is sent as a nul string.
    """
    if (note != ""):
        print(note)


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