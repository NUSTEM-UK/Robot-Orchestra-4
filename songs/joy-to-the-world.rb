# Joy To The World
use_bpm = 56

ip_address = "192.168.4.1"
port = "8000"
use_osc ip_address, port
use_synth :piano

define :playn do |notereq, duration|
  play notereq
  osc "/triggerBroadcast", note(notereq)
  sleep duration
end

define :playdrum do |drumreq|
  if (drumreq == 100)
    sample :drum_tom_hi_hard
    osc "/triggerBroadcast", 100
  end
  if (drumreq == 99)
    sample :drum_tom_mid_soft
    osc "/triggerBroadcast", 99
  end
  
end

in_thread(name: :drums) do
  use_bpm 56
  sync :start
  4.times do
    playdrum 100
    sleep 0.25
    playdrum 99
    sleep 0.25
  end
  in_thread(name: :drumsA) do
    19.times do
      playdrum 100
      sleep 1
    end
  end
  in_thread(name: :drumsB) do
    38.times do
      playdrum 99
      sleep 0.5
    end
  end
  sleep 19
  2.times do p
    playdrum 100
    playdrum 99
    sleep 0.25
  end
  
end

in_thread(name: :melody) do
  use_bpm 56
  sync :start
  sleep 2
  playn :C4, 0.5
  playn :B3, 0.375
  playn :A3, 0.125
  playn :G3, 0.75
  playn :F3, 0.25
  playn :E3, 0.5
  playn :D3, 0.375
  playn :rest, 0.125
  playn :C3, 0.75
  playn :G3, 0.25
  playn :A3, 0.75
  playn :A3, 0.25
  playn :B3, 0.75
  playn :B3, 0.25
  playn :C4, 1.5
  playn :rest, 0.25
  playn :C4, 0.25
  playn :C4, 0.25
  playn :B3, 0.25
  playn :A3, 0.25
  playn :G3, 0.25
  playn :G3, 0.375
  playn :F3, 0.125
  playn :E3, 0.25
  playn :C4, 0.25
  playn :C4, 0.25
  playn :B3, 0.25
  playn :A3, 0.25
  playn :G3, 0.25
  playn :G3, 0.375
  playn :F3, 0.125
  playn :E3, 0.25
  playn :E3, 0.25
  playn :E3, 0.25
  playn :E3, 0.25
  playn :E3, 0.25
  playn :E3, 0.125
  playn :F3, 0.125
  playn :G3, 0.75
  playn :F3, 0.125
  playn :E3, 0.125
  playn :D3, 0.25
  playn :D3, 0.25
  playn :D3, 0.25
  playn :D3, 0.125
  playn :E3, 0.125
  playn :F3, 0.75
  playn :E3, 0.125
  playn :D3, 0.125
  playn :C3, 0.25
  playn :C4, 0.5
  playn :A3, 0.25
  playn :G3, 0.375
  playn :F3, 0.125
  playn :E3, 0.25
  playn :F3, 0.25
  playn :E3, 0.5
  playn :D3, 0.5
  playn :C3, 1.0
end

in_thread(name: :cue) do
  cue :start
end
