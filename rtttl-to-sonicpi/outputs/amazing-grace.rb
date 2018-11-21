# Amazing Grace
use_bpm = 80

ip_address = "192.168.4.1"
port = "8000" 
use_osc ip_address, port
use_synth :piano

define :playn do |notereq, duration|
  play notereq
  osc "/triggerBroadcast", note(notereq)
  sleep duration
end

in_thread(name: :drums) do
  use_bpm 80
  sync :start
  sleep 2
  loop do
    sample :drum_bass_hard
    sleep 1
  end
end

in_thread(name: :melody) do
  use_bpm 80
  sync :start
  sleep 2
  playn :C3, 0.25
  playn :F3, 0.25
  playn :F3, 1.0
  playn :A3, 0.25
  playn :G3, 0.25
  playn :F3, 0.25
  playn :A3, 1.0
  playn :A3, 0.25
  playn :G3, 0.25
  playn :F3, 1.0
  playn :D3, 0.5
  playn :C3, 1.0
  playn :C3, 0.25
  playn :F3, 0.25
  playn :F3, 1.0
  playn :A3, 0.25
  playn :G3, 0.25
  playn :F3, 0.25
  playn :A3, 1.0
  playn :G3, 0.25
  playn :A3, 0.25
  playn :C4, 1.5
end

in_thread(name: :cue) do
  cue :start
end
