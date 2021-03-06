# Have Yourself A Merry Little Christmas
use_bpm = 180

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
  use_bpm 180
  sync :start
  sleep 2
  loop do
    sample :drum_bass_hard
    sleep 1
  end
end

in_thread(name: :melody) do
  use_bpm 180
  sync :start
  sleep 2
  playn :C3, 0.5
  playn :E3, 0.5
  playn :G3, 3.0
  playn :rest, 0.5
  playn :C4, 0.5
  playn :rest, 0.5
  playn :G3, 0.375
  playn :F3, 0.25
  playn :E3, 0.375
  playn :D3, 0.375
  playn :C3, 0.5
  playn :rest, 0.125
  playn :D3, 3.0
  playn :rest, 0.5
  playn :rest, 1.0
  playn :C3, 0.5
  playn :E3, 0.5
  playn :G3, 2.0
  playn :rest, 0.5
  playn :rest, 0.125
  playn :C4, 0.75
  playn :rest, 0.125
  playn :rest, 0.5
  playn :G3, 3.0
  playn :rest, 0.5
  playn :rest, 2.0
  playn :rest, 2.0
  playn :G3, 0.75
  playn :rest, 0.125
  playn :C4, 1.5
  playn :rest, 0.5
  playn :D4, 0.5
  playn :rest, 0.125
  playn :E4, 0.5
  playn :D4, 0.375
  playn :C4, 3.0
  playn :rest, 0.125
  playn :rest, 0.5
  playn :B3, 0.375
  playn :A3, 0.25
  playn :G3, 0.375
  playn :F3, 0.5
  playn :E3, 1.0
  playn :rest, 0.25
  playn :B3, 0.75
  playn :C4, 0.75
  playn :B3, 0.75
  playn :A4, 0.5
  playn :rest, 0.5
  playn :A3, 0.75
  playn :A4, 0.5
  playn :rest, 0.5
  playn :A3, 0.75
  playn :A4, 0.5
  playn :rest, 0.5
  playn :A3, 0.75
  playn :A4, 0.5
  playn :rest, 0.5
  playn :A3, 0.75
  playn :G4, 0.25
  playn :rest, 0.5
  playn :G3, 0.375
  playn :G4, 0.25
  playn :rest, 0.5
  playn :G3, 0.375
  playn :G4, 0.5
  playn :rest, 0.5
  playn :G3, 0.75
  playn :C4, 1.5
end

in_thread(name: :cue) do
  cue :start
end
