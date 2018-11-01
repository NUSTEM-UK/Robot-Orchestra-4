from rtttl_hack import RTTTL

# cue = "TakeOnMe:d=16,o=5,b=100:8p,a#,a#,a#,8f#,8d#,8g#,8g#,g#,c6,c6,c#6,d#6,c#6,c#6,c#6,8g#,8f#,8a#,8a#,a#,g#,g#,a#,g#,a#,a#,a#,8f#,8d#,8g#,8g#,g#,c6,c6,c#6,d#6,c#6,c#6,c#6,8g#,8f#,8a#,8a#"
# cue = "AnotherO:d=16,o=5,b=80:32p,32d#.6,32c#.6,8a#.,8a#.,4a#.,32a#.,a#.,a#.,c#.6,32a#.,4d#.6,32d#.6,32c#.6,8a#.,8a#.,4a#.,32a#.,a#.,a#.,c#.6,32a#.,4d#.6,32d#.6,32c#.6,8a#.,8a#.,4a#.,32a#.,a#.,a#.,c#.6,32a#.,4d#.6,32d#.6,32c#.6,8a#.,8a#.,4a#.,32a#.,a#.,a#.,c#.6,32a#.,4d#6"
# cue = "EveryLit:d=4,o=5,b=100:16c#7,16c#7,16c#7,16c#7,8g#6,16f#6,8g#6,8f#6,8a#6,8c#6,16p,16c#7,16c#7,16c#7,16g#6,8f#6,8g#6,8f#6,8a#6"
# cue = "MatchOfT:d=4,o=6,b=125:8c5,8f5,8a5,8c.,16a5,8a5,8a5,8a5,a5,8a_5,8c.,16a5,8g5,8a5,8a_5,8c5,8e5,8g5,8a_.5,16g5,8g5,8g5,8g5,g5,8a5,8a_.5,16g5,8f5,8g5,8a5,8c5,8f5,8a5,8c.,16a5,8a5,8a5,8a5,a5,8a_5,8c.,16a5,8a_5,8c,2d"
cue = "ThePriso:d=4,o=6,b=160:8c#7,8b,2c#.,8b,8a,2b.,8a,g#,8a#,8f#,8d,8c#,f#,d,8c#,8f#,8d,8c#,f#,8c#,8b,c#7,b,a,g#,c#,8e,8c#,d#,8a,8b,c#7,b,a,g#,c#,8e,8c#,8d#,8a,b,2c#7,b,8a,8g#,c#,8e,8c#,d#,8e,8f#,g#.,g#.,g#,8g#,8p,8g#,8f#,8g#,8p,8d#,8c#,8d#,8p,8g#,8f#,8g#,8p,8g#7,8f#7,g#7,8f#7,8e7,f#7,8e7,8d#7,8c#7,8g#,f#,c#,8g#7,8f#7,g#7,8f#7,8e7,f#7,8e7,8d#7,8c#7,8e,b5,2a5"
# cue = "JingleBe:d=8,o=6,b=125:g5,e,d,c,2g5,g5,e,d,c,2a5,a5,f,e,d,b5,g5,b5,d,g.,16g,f,d,2e,g5,e,d,c,2g5,16f#5,g5,e,d,c,2a5,a5,f,e,d,g,16g,16f#,16g,16f#,16g,16g#,a.,16g,e,d,4c,4g,e,e,e.,16d#,e,e,e.,16d#,e,g,c.,16d,2e,f,f,f.,16f,f,e,e,16e,16e,e,d,d,e,2d"
tune = RTTTL(cue)

print("# Parsed song")
print("use_bpm = " + str(tune.bpm))
# print("use_synth :chiplead")
print("use_synth :piano")
print("")
for freq, dur in tune.notes():
    # print("play hz_to_midi(" + str(freq) + ")")
    # print("sleep " + str(msec) + ".to_f/1000")
    print("play :" + freq)
    print("sleep " + str(dur))

