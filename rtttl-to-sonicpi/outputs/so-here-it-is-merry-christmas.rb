# Slade - So Here It Is Merry Christmas
use_bpm = 180

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
  playn :D3, 0.5
  playn :E3, 0.5
  playn :F3, 0.5
  playn :G3, 1.0
  playn :A3, 0.375
  playn :B3, 0.5
  playn :A3, 0.5
  playn :F3, 0.75
  playn :D3, 0.5
  playn :B2, 0.375
  playn :F3, 0.75
  playn :D3, 0.5
  playn :C3, 0.375
  playn :A2, 0.5
  playn :D3, 2.0
  playn :rest, 0.25
  playn :G3, 1.0
  playn :A3, 0.375
  playn :B3, 0.5
  playn :A3, 0.5
  playn :F3, 0.5
  playn :D3, 0.75
  playn :B2, 0.5
  playn :F3, 0.5
  playn :F3, 0.5
  playn :F3, 0.5
  playn :F3, 0.5
  playn :F3, 0.75
  playn :E3, 0.125
  playn :D3, 0.125
  playn :D3, 0.75
  playn :E3, 0.125
  playn :F3, 0.125
  playn :F3, 2.0
end

in_thread(name: :cue) do
  cue :start
end
