"""Parse Sonic Pi files for notes, extract list of MIDI notes used."""

import argparse

notes_to_midi = { "A2": 45, "Bb2": 46, "B2": 47, "C3": 48, "Db3": 49, "D3": 50, 
                  "Eb3": 51, "E3": 52, "F3": 53, "Gb3": 54, "G3": 55, "Ab3": 56, 
                  "A3": 57, "Bb3": 58, "B3": 59, "C4": 60, "Db4": 61, "D4": 62, 
                  "Eb4": 63, "E4": 64, "F4": 65, "Gb4": 66, "G4": 67, "Ab4": 68, 
                  "A4": 69, "Bb4": 70, "B4": 71, "C5": 72, "Db5": 73, "D5": 74, 
                  "Eb5": 75, "E5": 76, "F5": 77, "Gb5": 78, "G5": 79 }

newline = "\n"

def parse_song(f):
    

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--file", default="joy-to-the-world.rb", help="Song file to parse")
    args = parser.parse_args()
    f = open(args.file, "r")
    parse_song(f)
    f.close()
