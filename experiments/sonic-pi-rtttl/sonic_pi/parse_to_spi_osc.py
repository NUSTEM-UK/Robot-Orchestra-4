from rtttl_hack import RTTTL
from songsearcher import searcher

request = "Wannabe"
guessed_song_title, match_accuracy, song_rtttl = searcher(request)

tune = RTTTL(song_rtttl)

print("# " + guessed_song_title)
print("use_bpm = " + str(tune.bpm))
print("")
print("ip_address = \"10.0.1.3\"")
print("port = \"4559\" ")
print("use_osc ip_address, port")

# print("use_synth :chiplead")
print("use_synth :piano")
print("")
print("define :playn do |note, duration|")
print("    play note")
print("    osc note")
print("    sleep duration")
print("end")
print("")
for freq, dur in tune.notes():
    # print("play hz_to_midi(" + str(freq) + ")")
    # print("sleep " + str(msec) + ".to_f/1000")
    print("playn :" + freq + ", " + str(dur))
    # print("sleep " + str(dur))

print("")
