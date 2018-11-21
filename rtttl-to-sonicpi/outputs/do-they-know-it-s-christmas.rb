# Band Aid - Do They Know Its Christmas
use_bpm = 140

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
  use_bpm 140
  sync :start
  sleep 2
  loop do
    sample :drum_bass_hard
    sleep 1
  end
end

in_thread(name: :melody) do
  use_bpm 140
  sync :start
  sleep 2
  playn :A4, 0.25
  playn :A4, 0.25
  playn :A4, 0.5
  playn :A4, 0.25
  playn :A4, 0.5
  playn :A4, 0.5
  playn :G4, 0.5
  playn :F4, 0.25
  playn :E4, 0.5
  playn :F4, 0.5
  playn :F4, 0.5
  playn :E4, 0.5
  playn :E4, 0.5
  playn :rest, 1.0
  playn :A4, 0.25
  playn :A4, 0.25
  playn :A4, 0.5
  playn :A4, 0.5
  playn :B4, 0.5
  playn :G4, 0.25
  playn :F4, 0.5
  playn :E4, 0.5
  playn :F4, 0.5
  playn :F4, 0.5
  playn :E4, 0.5
  playn :rest, 1.0
  playn :A4, 0.5
  playn :A4, 0.25
  playn :A4, 0.5
  playn :A4, 0.25
  playn :A4, 0.5
  playn :G4, 1.0
  playn :rest, 0.5
  playn :A4, 0.5
  playn :A4, 0.5
  playn :B4, 0.5
  playn :A4, 0.25
  playn :E4, 0.5
  playn :F4, 1.0
  playn :rest, 0.5
  playn :D5, 0.5
  playn :C5, 0.5
  playn :A4, 0.5
  playn :E4, 0.5
  playn :D5, 0.5
  playn :C5, 0.5
  playn :A4, 0.5
  playn :B4, 0.25
  playn :A4, 0.25
  playn :A4, 0.5
end

in_thread(name: :cue) do
  cue :start
end
