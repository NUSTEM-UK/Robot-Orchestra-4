# God Rest Ye Merry Gentlemen
use_bpm = 112

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
  use_bpm 112
  sync :start
  sleep 2
  loop do
    sample :drum_bass_hard
    sleep 1
  end
end

in_thread(name: :melody) do
  use_bpm 112
  sync :start
  sleep 2
  playn :D4, 0.375
  playn :D4, 0.375
  playn :A4, 0.375
  playn :A4, 0.375
  playn :G4, 0.375
  playn :F4, 0.375
  playn :E4, 0.375
  playn :D4, 0.375
  playn :C4, 0.375
  playn :D4, 0.375
  playn :E4, 0.375
  playn :F4, 0.375
  playn :G4, 0.375
  playn :A4, 1.0
  playn :rest, 0.25
  playn :D4, 0.375
  playn :D4, 0.375
  playn :A4, 0.375
  playn :A4, 0.375
  playn :G4, 0.375
  playn :F4, 0.375
  playn :E4, 0.375
  playn :D4, 0.375
  playn :C4, 0.375
  playn :D4, 0.375
  playn :E4, 0.375
  playn :F4, 0.375
  playn :G4, 0.375
  playn :A4, 1.0
  playn :rest, 0.25
  playn :A4, 0.375
  playn :A4, 0.375
  playn :G4, 0.375
  playn :A4, 0.375
  playn :A4, 0.375
  playn :C5, 0.375
  playn :D5, 0.375
  playn :A4, 0.375
  playn :G4, 0.375
  playn :F4, 0.375
  playn :D4, 0.375
  playn :E4, 0.375
  playn :F4, 0.375
  playn :G4, 0.75
  playn :F4, 0.375
  playn :G4, 0.375
  playn :A4, 0.75
  playn :A4, 0.375
  playn :A4, 0.375
  playn :A4, 0.375
  playn :G4, 0.375
  playn :F4, 0.375
  playn :E4, 0.375
  playn :D4, 0.75
  playn :F4, 0.1875
  playn :E4, 0.1875
  playn :D4, 0.375
  playn :G4, 0.75
  playn :F4, 0.375
  playn :G4, 0.375
  playn :A4, 0.375
  playn :A4, 0.375
  playn :C5, 0.375
  playn :D5, 0.375
  playn :A4, 0.375
  playn :G4, 0.375
  playn :F4, 0.375
  playn :E4, 0.375
  playn :D4, 1.5
end

in_thread(name: :cue) do
  cue :start
end
