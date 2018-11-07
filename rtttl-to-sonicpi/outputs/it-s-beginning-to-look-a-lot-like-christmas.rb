# It's Beginning To Look A Lot Like Christmas
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
  playn :C3, 0.25
  playn :rest, 0.0625
  playn :C3, 0.1875
  playn :D3, 0.1875
  playn :F3, 0.125
  playn :D3, 0.1875
  playn :D3, 0.1875
  playn :rest, 0.125
  playn :D3, 0.1875
  playn :F3, 0.5
  playn :G3, 0.5
  playn :C4, 0.5
  playn :D3, 1.5
  playn :C4, 0.75
  playn :rest, 0.0625
  playn :C4, 0.1875
  playn :A3, 0.5
  playn :G3, 0.5
  playn :F3, 1.0
  playn :rest, 0.5
  playn :F3, 0.1875
  playn :rest, 0.125
  playn :G3, 0.1875
  playn :G3, 0.1875
  playn :A3, 0.125
  playn :G3, 0.1875
  playn :G3, 0.1875
  playn :rest, 0.125
  playn :G3, 0.1875
  playn :G3, 0.375
  playn :rest, 0.125
  playn :F3, 0.1875
  playn :rest, 0.125
  playn :E3, 0.1875
  playn :D3, 0.25
  playn :rest, 0.0625
  playn :F3, 0.1875
  playn :G3, 0.1875
  playn :rest, 0.125
  playn :C4, 0.1875
  playn :D4, 0.5
  playn :E3, 0.25
  playn :rest, 0.0625
  playn :F3, 0.1875
  playn :C4, 1.0
  playn :G3, 1.0
  playn :G3, 1.0
end

in_thread(name: :cue) do
  cue :start
end
