# Silent Night
use_bpm = 160

ip_address = "10.0.1.3"
port = "8000" 
use_osc ip_address, port
use_synth :piano

define :playn do |notereq, duration|
  play notereq
  osc "/triggerBroadcast", note(notereq)
  sleep duration
end

in_thread(name: :drums) do
  use_bpm 160
  sync :start
  sleep 2
  loop do
    sample :drum_bass_hard
    sleep 1
  end
end

in_thread(name: :melody) do
  use_bpm 160
  sync :start
  sleep 2
  playn :G3, 0.75
  playn :A3, 0.25
  playn :G3, 0.5
  playn :E3, 1.5
  playn :G3, 0.75
  playn :A3, 0.25
  playn :G3, 0.5
  playn :E3, 1.5
  playn :D4, 1.0
  playn :D4, 0.5
  playn :B3, 1.5
  playn :C4, 1.0
  playn :C4, 0.5
  playn :G3, 1.5
end

in_thread(name: :cue) do
  cue :start
end
