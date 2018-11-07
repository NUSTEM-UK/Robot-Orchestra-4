from rtttl_hack import RTTTL
from songsearcher import searcher
from rttllist import songdict
from slugify import slugify

output_dir = "outputs/"

newline = "\n"

def translate(song_name):
    guessed_song_title, match_accuracy, song_rtttl = searcher(song_name)
    tune = RTTTL(song_rtttl)

    filename = output_dir + slugify(song) + ".rb"
    f = open(filename, "x")

    f.write("# " + guessed_song_title + newline)
    f.write("use_bpm = " + str(tune.bpm) + newline)
    f.write("" + newline)
    f.write("ip_address = \"10.0.1.3\"" + newline)
    f.write("port = \"8000\" " + newline)
    f.write("use_osc ip_address, port" + newline)

    # print("use_synth :chiplead")
    f.write("use_synth :piano" + newline)
    f.write("" + newline)
    f.write("define :playn do |notereq, duration|" + newline)
    f.write("  play notereq" + newline)
    f.write("  osc \"/triggerBroadcast\", note(notereq)" + newline)
    f.write("  sleep duration" + newline)
    f.write("end" + newline)
    f.write("" + newline)

    f.write("in_thread(name: :drums) do" + newline)
    f.write("  use_bpm " + str(tune.bpm) + newline)
    f.write("  sync :start" + newline)
    f.write("  sleep 2" + newline)
    f.write("  loop do" + newline)
    f.write("    sample :drum_bass_hard" + newline)
    f.write("    sleep 1" + newline)
    f.write("  end" + newline)
    f.write("end" + newline)

    f.write("" + newline)

    f.write("in_thread(name: :melody) do" + newline)
    f.write("  use_bpm " + str(tune.bpm) + newline)
    f.write("  sync :start" + newline)
    f.write("  sleep 2" + newline)
    for freq, dur in tune.notes():
        # f.write("  play hz_to_midi(" + str(freq) + ")" + newline)
        # f.write("  sleep " + str(msec) + ".to_f/1000" + newline)
        f.write("  playn :" + freq + ", " + str(dur) + newline)
        # f.write("sleep " + str(dur) + newline)
    f.write("end" + newline)
    f.write("" + newline)

    f.write("in_thread(name: :cue) do" + newline)
    f.write("  cue :start" + newline)
    f.write("end" + newline)
    f.close()

if __name__ == "__main__":
    for song in songdict:
        translate(song)
        
