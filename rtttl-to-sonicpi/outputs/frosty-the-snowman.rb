# Frosty The Snowman - Unknown
use_bpm = 100

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
  use_bpm 100
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
  playn :F4, 0.25
  playn :D4, 0.25
  playn :F4, 0.125
  playn :F4, 0.25
  playn :A4, 0.25
  playn :rest, 0.125
  playn :A4, 0.125
  playn :A4, 0.125
  playn :C5, 0.25
  playn :A4, 0.25
  playn :A4, 0.25
  playn :G4, 0.25
  playn :rest, 0.125
  playn :A4, 0.125
  playn :A4, 0.125
  playn :C5, 0.125
  playn :A4, 0.25
  playn :A4, 0.25
  playn :G4, 0.125
  playn :G4, 0.125
  playn :F4, 0.25
  playn :A4, 0.25
  playn :D4, 0.25
  playn :G4, 0.125
  playn :F4, 0.25
  playn :D4, 0.25
  playn :D4, 0.25
  playn :D4, 0.25
  playn :F4, 0.25
end

in_thread(name: :cue) do
  cue :start
end
