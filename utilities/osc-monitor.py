#!/usr/bin/env python3
#broadcast received OSC message
#written by Robin Newman, October 2018
#designed for use with Sonic Pi 3
#requires python-osc
#install with sudo pip3 install python-osc
import argparse
from pythonosc import osc_server
from pythonosc import dispatcher


def broadcastHandler(unused_addr,args,p1="",p2="",p3="",p4="",p5="",p6=""):
    msg=[]
    if p1 != "": 
       msg.append(p1) 
    if p2 != "":
       msg.append(p2) 
    if p3 != "":
        msg.append(p3)
    if p4 != "":
        msg.append(p4)
    if p5 != "":
        msg.append(p5)
    if p6 != "":
        msg.append(p6)
    #print details on terminal screen
    print("message '/broadcast' {} received".format(msg))

if __name__ == "__main__":
    try:
        parser = argparse.ArgumentParser()
        parser.add_argument("--port",default=4559,
          help="The port for the local OSC server")

        parser.add_argument("--ip",default="192.168.4.255",
          help="the ip address of the local OSC broadcast")

        # parser.add_argument("--bcport", type=int, default=4559,
        #  help="The Sonic Pi listening Port")

        args = parser.parse_args()
        #set up dispatcher to handle incoming OSC messages
        dispatcher = dispatcher.Dispatcher()
        #dispatcher for "/triggerBroadcast" incoming OSC message
        #can handle up to 6 separate input data
        dispatcher.map("/broadcast", broadcastHandler,"p1","p2","p3","p4","p5","p6")

        #set up server
        server = osc_server.ThreadingOSCUDPServer( (args.ip, args.port), dispatcher)
        #print configuration data on terminal screen
        print("Serving on {} port {}".format(server.server_address,args.port))
        # print("Broadcast to {} on port {}".format(args.bcip,args.bcport))
        #start serving    
        server.serve_forever()

    #allow clean ctrl-C exit
    except KeyboardInterrupt:
        print("\nProgram exit")