# Films And Tv - The Prisoner
use_bpm = 160

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
  playn :C5, 0.25
  playn :B4, 0.25
  playn :C4, 1.5
  playn :B4, 0.25
  playn :A4, 0.25
  playn :B4, 1.5
  playn :A4, 0.25
  playn :G4, 0.5
  playn :A4, 0.25
  playn :F4, 0.25
  playn :D4, 0.25
  playn :C4, 0.25
  playn :F4, 0.5
  playn :D4, 0.5
  playn :C4, 0.25
  playn :F4, 0.25
  playn :D4, 0.25
  playn :C4, 0.25
  playn :F4, 0.5
  playn :C4, 0.25
  playn :B4, 0.25
  playn :C5, 0.5
  playn :B4, 0.5
  playn :A4, 0.5
  playn :G4, 0.5
  playn :C4, 0.5
  playn :E4, 0.25
  playn :C4, 0.25
  playn :D4, 0.5
  playn :A4, 0.25
  playn :B4, 0.25
  playn :C5, 0.5
  playn :B4, 0.5
  playn :A4, 0.5
  playn :G4, 0.5
  playn :C4, 0.5
  playn :E4, 0.25
  playn :C4, 0.25
  playn :D4, 0.25
  playn :A4, 0.25
  playn :B4, 0.5
  playn :C5, 1.0
  playn :B4, 0.5
  playn :A4, 0.25
  playn :G4, 0.25
  playn :C4, 0.5
  playn :E4, 0.25
  playn :C4, 0.25
  playn :D4, 0.5
  playn :E4, 0.25
  playn :F4, 0.25
  playn :G4, 0.75
  playn :G4, 0.75
  playn :G4, 0.5
  playn :G4, 0.25
  playn :rest, 0.25
  playn :G4, 0.25
  playn :F4, 0.25
  playn :G4, 0.25
  playn :rest, 0.25
  playn :D4, 0.25
  playn :C4, 0.25
  playn :D4, 0.25
  playn :rest, 0.25
  playn :G4, 0.25
  playn :F4, 0.25
  playn :G4, 0.25
  playn :rest, 0.25
  playn :G5, 0.25
  playn :F5, 0.25
  playn :G5, 0.5
  playn :F5, 0.25
  playn :E5, 0.25
  playn :F5, 0.5
  playn :E5, 0.25
  playn :D5, 0.25
  playn :C5, 0.25
  playn :G4, 0.25
  playn :F4, 0.5
  playn :C4, 0.5
  playn :G5, 0.25
  playn :F5, 0.25
  playn :G5, 0.5
  playn :F5, 0.25
  playn :E5, 0.25
  playn :F5, 0.5
  playn :E5, 0.25
  playn :D5, 0.25
  playn :C5, 0.25
  playn :E4, 0.25
  playn :B3, 0.5
  playn :A3, 1.0
end

in_thread(name: :cue) do
  cue :start
end
