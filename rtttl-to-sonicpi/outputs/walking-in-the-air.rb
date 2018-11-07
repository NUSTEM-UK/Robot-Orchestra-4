# Katrina and the Waves - Walking On Sunshine
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
  use_bpm 100
  sync :start
  sleep 2
  playn :C4, 0.125
  playn :B3, 0.125
  playn :E4, 0.25
  playn :C4, 0.25
  playn :B3, 0.25
  playn :C4, 0.5
  playn :B3, 1.0
  playn :F4, 0.5
  playn :E4, 0.75
  playn :C4, 0.25
  playn :E4, 0.25
  playn :C4, 0.25
  playn :A3, 0.25
  playn :C4, 0.5
  playn :B3, 1.0
  playn :F4, 0.5
  playn :E4, 0.75
  playn :C4, 0.25
  playn :E4, 0.25
  playn :C4, 0.25
  playn :A3, 0.25
  playn :C4, 0.5
  playn :B3, 1.0
  playn :F4, 0.5
  playn :E4, 0.75
  playn :C4, 0.25
  playn :E4, 0.25
  playn :C4, 0.25
  playn :E4, 0.5
  playn :E4, 0.75
  playn :E4, 0.75
  playn :E4, 0.25
  playn :C4, 0.25
  playn :B3, 0.75
  playn :B3, 0.125
  playn :E4, 0.25
  playn :C4, 0.25
  playn :E4, 0.5
  playn :E4, 0.75
  playn :E4, 0.75
  playn :E4, 0.25
  playn :C4, 0.25
  playn :B3, 0.75
  playn :C4, 0.125
  playn :E4, 0.25
  playn :C4, 0.125
  playn :E4, 0.5
  playn :E4, 0.5
end

in_thread(name: :cue) do
  cue :start
end
