from rtttl_hack import RTTTL
from songsearcher import searcher

request = "Joy to the World"
guessed_song_title, match_accuracy, song_rtttl = searcher(request)

tune = RTTTL(song_rtttl)

print("# " + guessed_song_title)
print("use_bpm = " + str(tune.bpm))
# print("use_synth :chiplead")
print("use_synth :piano")
print("")
for freq, dur in tune.notes():
    # print("play hz_to_midi(" + str(freq) + ")")
    # print("sleep " + str(msec) + ".to_f/1000")
    print("play :" + freq)
    print("sleep " + str(dur))

