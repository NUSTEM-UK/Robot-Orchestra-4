# Gillespie And Coots - Santa Claus Is Coming To Town
use_bpm = 125

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
  use_bpm 125
  sync :start
  sleep 2
  loop do
    sample :drum_bass_hard
    sleep 1
  end
end

in_thread(name: :melody) do
  use_bpm 125
  sync :start
  sleep 2
  playn :C4, 0.125
  playn :E4, 0.375
  playn :F4, 0.125
  playn :G4, 0.5
  playn :G4, 1.0
  playn :G4, 0.125
  playn :A4, 0.375
  playn :B4, 0.125
  playn :C5, 0.5
  playn :C5, 1.0
  playn :E4, 0.375
  playn :F4, 0.125
  playn :G4, 0.5
  playn :G4, 0.5
  playn :G4, 0.5
  playn :A4, 0.375
  playn :G4, 0.125
  playn :F4, 0.5
  playn :F4, 1.0
  playn :E4, 0.5
  playn :G4, 0.5
  playn :C4, 0.5
  playn :E4, 0.5
  playn :D4, 0.5
  playn :F4, 1.0
  playn :B3, 0.5
  playn :C4, 3.0
  playn :C4, 0.125
  playn :E4, 0.375
  playn :F4, 0.125
  playn :G4, 0.5
  playn :G4, 1.0
  playn :G4, 0.125
  playn :A4, 0.375
  playn :B4, 0.125
  playn :C5, 0.5
  playn :C5, 1.0
  playn :E4, 0.375
  playn :F4, 0.125
  playn :G4, 0.5
  playn :G4, 0.5
  playn :G4, 0.5
  playn :A4, 0.375
  playn :G4, 0.125
  playn :F4, 0.5
  playn :F4, 1.0
  playn :E4, 0.5
  playn :G4, 0.5
  playn :C4, 0.5
  playn :E4, 0.5
  playn :D4, 0.5
  playn :F4, 1.0
  playn :B3, 0.5
  playn :C4, 3.0
end

in_thread(name: :cue) do
  cue :start
end
