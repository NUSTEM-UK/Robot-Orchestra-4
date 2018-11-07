# Bing Crosby - I'm Dreaming Of A White Christmas
use_bpm = 125

ip_address = "10.0.1.3"
port = "4559" 
use_osc ip_address, port
use_synth :piano

define :playn do |note, duration|
    play note
    osc note
    sleep duration
end

in_thread(name: :drums) do
  use_bpm 125
  sync :start
  sleep 2
  loop do
    sample :drum_bass_hard
    sleep 1
  end
end

in_thread(name: :melody) do
  use_bpm 100
  sync :start
  sleep 2
  playn :E4, 1.0
  playn :F4, 0.5
  playn :E4, 0.5
  playn :D4, 0.5
  playn :E4, 0.5
  playn :F4, 1.0
  playn :rest, 0.25
  playn :F4, 0.5
  playn :G4, 0.75
  playn :rest, 0.25
  playn :A4, 0.5
  playn :B4, 0.5
  playn :C5, 0.5
  playn :D5, 0.5
  playn :C5, 0.5
  playn :B4, 0.5
  playn :A4, 0.5
  playn :G4, 1.0
  playn :C4, 0.5
  playn :D4, 0.5
  playn :E4, 1.0
  playn :E4, 1.0
  playn :E4, 0.5
  playn :A4, 1.0
  playn :G4, 0.5
  playn :C5, 1.5
  playn :C4, 0.5
  playn :D4, 0.5
  playn :E4, 1.0
  playn :E4, 1.0
  playn :A4, 0.5
  playn :C4, 0.25
  playn :B3, 0.25
  playn :B3, 0.5
  playn :B3, 0.5
  playn :C4, 1.0
  playn :F4, 0.5
  playn :A4, 0.5
  playn :C5, 1.0
end

in_thread(name: :cue) do
  cue :start
end
