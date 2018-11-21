# Kylie Minogue - Giving You Up
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
  playn :G4, 0.5
  playn :rest, 0.4
  playn :D4, 0.25
  playn :rest, 0.4
  playn :D4, 0.5
  playn :rest, 0.4
  playn :F3, 0.5
  playn :F4, 0.25
  playn :rest, 0.4
  playn :rest, 0.5
  playn :G4, 0.25
  playn :rest, 0.4
  playn :rest, 0.5
  playn :F4, 0.25
  playn :rest, 0.4
  playn :rest, 0.5
  playn :F3, 0.25
  playn :D4, 0.25
  playn :rest, 0.4
  playn :C4, 0.5
  playn :rest, 0.4
  playn :rest, 0.5
  playn :C4, 0.5
  playn :D4, 0.25
  playn :rest, 0.4
  playn :D4, 0.5
  playn :rest, 0.4
  playn :F3, 0.5
  playn :F4, 0.25
  playn :rest, 0.4
  playn :rest, 0.5
  playn :G4, 0.5
  playn :rest, 0.4
  playn :D4, 0.25
  playn :rest, 0.4
  playn :D4, 0.5
  playn :rest, 0.4
  playn :F3, 0.5
  playn :F4, 0.25
  playn :rest, 0.4
  playn :rest, 0.5
  playn :G4, 0.25
  playn :rest, 0.4
  playn :rest, 0.5
  playn :F4, 0.25
  playn :rest, 0.4
  playn :rest, 0.5
  playn :F3, 0.25
  playn :D4, 0.25
  playn :rest, 0.4
  playn :C4, 0.5
  playn :rest, 0.4
  playn :rest, 0.5
  playn :C4, 0.5
  playn :D4, 0.25
  playn :rest, 0.4
  playn :D4, 0.5
  playn :rest, 0.4
  playn :F3, 0.5
  playn :F4, 0.25
  playn :rest, 0.4
  playn :rest, 0.5
  playn :G4, 0.5
  playn :rest, 0.4
  playn :D4, 0.25
  playn :rest, 0.4
  playn :D4, 0.5
  playn :rest, 0.4
  playn :F3, 0.5
  playn :F4, 0.25
  playn :rest, 0.4
  playn :rest, 0.5
  playn :G4, 0.25
  playn :rest, 0.4
  playn :rest, 0.5
  playn :F4, 0.25
  playn :rest, 0.4
  playn :rest, 0.5
  playn :F3, 0.25
  playn :D4, 0.25
  playn :rest, 0.4
  playn :C4, 0.5
  playn :rest, 0.4
  playn :rest, 0.5
  playn :C4, 0.5
  playn :D4, 0.25
  playn :rest, 0.4
  playn :D4, 0.5
  playn :rest, 0.4
  playn :F3, 0.5
  playn :F4, 0.25
  playn :rest, 0.4
  playn :rest, 0.5
  playn :G4, 0.5
  playn :rest, 0.4
  playn :D4, 0.25
  playn :rest, 0.4
  playn :D4, 0.5
  playn :rest, 0.4
  playn :F3, 0.5
  playn :F4, 0.25
  playn :rest, 0.4
  playn :rest, 0.5
  playn :G4, 0.25
  playn :rest, 0.4
  playn :rest, 0.5
  playn :F4, 0.25
  playn :rest, 0.4
  playn :rest, 0.5
  playn :F3, 0.25
  playn :D4, 0.25
  playn :rest, 0.4
  playn :C4, 0.5
  playn :rest, 0.4
  playn :rest, 0.5
  playn :C4, 0.5
  playn :D4, 0.25
  playn :rest, 0.4
  playn :D4, 0.5
  playn :rest, 0.4
  playn :F3, 0.5
  playn :F4, 0.25
end

in_thread(name: :cue) do
  cue :start
end
