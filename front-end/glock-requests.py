""" Handle song requests from the terminal.

Take terminal input, match to RTTTL song list, send cues to glockenspiel.

Dependencies (pip3 install):
    fuzzywuzzy (in songsearcher module)
    python-Levenshtein (in songsearcher module)
    termcolor

Install sonic-pi-tool as per: https://github.com/emlyn/sonic-pi-tool

Dependencies (ruby/cli):
    gem install sonic-pi-cli

Big text via https://coolsymbol.com/big-text-generator.html

"""

import sys
import subprocess
from time import sleep
from termcolor import colored, cprint
from songsearcher import searcher


def welcome():
    """Output the banner title."""
    clear_screen()
    cprint(" █▀▀ ▀▀█▀▀     █░░░█ ░▀░ █░░ █▀▀ █▀▀█ █▀▀ █▀▀▄ █ █▀▀     █▀▀ █▀▀ █░░█ █▀▀█ █▀▀█ █░░", "green")
    sleep(0.05)
    cprint(" ▀▀█ ░░█░░     █▄█▄█ ▀█▀ █░░ █▀▀ █▄▄▀ █▀▀ █░░█ ░ ▀▀█     ▀▀█ █░░ █▀▀█ █░░█ █░░█ █░░", "green")
    sleep(0.05)
    cprint(" ▀▀▀ ░░▀░░     ░▀░▀░ ▀▀▀ ▀▀▀ ▀░░ ▀░▀▀ ▀▀▀ ▀▀▀░ ░ ▀▀▀     ▀▀▀ ▀▀▀ ▀░░▀ ▀▀▀▀ ▀▀▀▀ ▀▀▀", "green")
    sleep(0.05)
    cprint("      █▀▀█ █▀▀█ █▀▀▄ █▀▀█ ▀▀█▀▀   █▀▀█ █▀▀█ █▀▀ █░░█ █▀▀ █▀▀ ▀▀█▀▀ █▀▀█ █▀▀█", 'red')
    sleep(0.05)
    cprint("      █▄▄▀ █░░█ █▀▀▄ █░░█ ░░█░░   █░░█ █▄▄▀ █░░ █▀▀█ █▀▀ ▀▀█ ░░█░░ █▄▄▀ █▄▄█", 'red')
    sleep(0.05)
    cprint("      ▀░▀▀ ▀▀▀▀ ▀▀▀░ ▀▀▀▀ ░░▀░░   ▀▀▀▀ ▀░▀▀ ▀▀▀ ▀░░▀ ▀▀▀ ▀▀▀ ░░▀░░ ▀░▀▀ ▀░░▀", 'red')
    sleep(0.05)
    cprint("              Festive tunes played extraordinarily badly, since 2018", 'yellow')
    sleep(0.05)
    print("")

def get_input():
    """Collect request string from shell."""
    cprint("I can play many Christmas carols.", "green")
    cprint("Which one would you like? ", "green")
    return input("--> ")
    
def respond(request, song, accuracy):
    """Respond to the input request."""
    print()
    respond_string = colored("You asked for: ", 'yellow')
    respond_string += colored(request, 'green')
    cprint(respond_string)
    sleep(0.5)
    respond_string2 = colored("I'm ", 'yellow')
    respond_string2 += colored(accuracy, 'green')
    respond_string2 += colored("% confident that matches: ", 'yellow')
    respond_string2 += colored(song, 'green') 
    cprint(respond_string2)
    print()
    sleep(0.5)

def play_song(song, filename):
    """Command the glockenspiel."""
    cprint("Playing my best guess in", 'yellow')
    sleep(0.05)
    countdown()
    sleep(0.8)
    print()
    cprint(" █▀▀█ █░░ █▀▀█ █░░█ ░▀░ █▀▀▄ █▀▀▀", 'green')
    sleep(0.05)
    cprint(" █░░█ █░░ █▄▄█ █▄▄█ ▀█▀ █░░█ █░▀█", 'green')
    sleep(0.05)
    cprint(" █▀▀▀ ▀▀▀ ▀░░▀ ▄▄▄█ ▀▀▀ ▀░░▀ ▀▀▀▀", 'green')
    sleep(0.05)
    print()
    sleep(0.05)
    # TODO: this bit:
    # Needs to call a subprocess. Not sure how we find out it's exited.
    # Ah... that's what subprocess.wait() is for
    print(">>>This is where the command code would go")
    print(filename)
    # command = "sonic-pi-tool.py run-file /Users/jonathan/Documents/GitHub/Robot-Orchestra-4/songs/"
    # command += filename
    fileurl = "../songs/" + filename
    # playback = subprocess.run(command)
    subprocess.run(["sonic-pi-tool.py", "run-file", fileurl])
    # playback.wait()
    song_complete()
    next_request()
    

def song_complete():
    print()
    sleep(0.05)
    cprint(" █▀▀ ░▀░ █▀▀▄ ░▀░ █▀▀ █░░█ █▀▀ █▀▀▄", 'cyan')
    sleep(0.05)
    cprint(" █▀▀ ▀█▀ █░░█ ▀█▀ ▀▀█ █▀▀█ █▀▀ █░░█", 'cyan')
    sleep(0.05)
    cprint(" ▀░░ ▀▀▀ ▀░░▀ ▀▀▀ ▀▀▀ ▀░░▀ ▀▀▀ ▀▀▀░", 'cyan')
    sleep(0.05)
    print()
    sleep(0.05)
    cprint("Thank you for your request.", 'yellow')
    sleep(0.05)
    print()
    sleep(0.5)
    cprint("Returning to start in:")
    sleep(0.5)
    countdown()
    clear_screen()

def clear_screen():
    for _ in range(30):
        print()
        sleep(0.05)

def countdown():
    # cprint("...3", 'red')
    cprint("░ ░ ░ █▀▀█", 'red')
    sleep(0.05)
    cprint("▄ ▄ ▄ ░░▀▄", 'red')
    sleep(0.05)
    cprint("█ █ █ █▄▄█", 'red')
    sleep(1)
    # cprint("...2", 'magenta')
    cprint("░ ░ ░ ░ ░ ░ █▀█", 'magenta')
    sleep(0.05)
    cprint("▄ ▄ ▄ ▄ ▄ ▄ ░▄▀", 'magenta')
    sleep(0.05)
    cprint("█ █ █ █ █ █ █▄▄", 'magenta')
    sleep(1)
    # cprint("...1", 'green')
    cprint("░ ░ ░ ░ ░ ░ ░ ░ ░ ▄█░", 'green')
    sleep(0.05)
    cprint("▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ▄ ░█░", 'green')
    sleep(0.05)
    cprint("█ █ █ █ █ █ █ █ █ ▄█▄", 'green')
    sleep(0.6)


def next_request():
    welcome()
    request = get_input()
    if request == "": # handle null input with an easter egg
        request = "Films And Tv - Match Of The Day"
    print()
    cprint(">>> MATCHING...", 'red')
    guessed_song_title, match_accuracy, songFileName = searcher(request)
    
    respond(request, guessed_song_title, match_accuracy)
    play_song(guessed_song_title, songFileName)

if __name__ == "__main__":
    next_request()
    