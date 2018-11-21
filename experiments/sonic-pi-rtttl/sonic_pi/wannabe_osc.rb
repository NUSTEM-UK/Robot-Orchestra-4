# Spice Girls - Wannabe
use_bpm = 125

ip_address = "192.168.4.1"
port = "4559" 
use_osc ip_address, port
use_synth :piano

define :playn do |note, duration|
    play note
    osc note
    sleep duration
end

playn :G3, 0.125
playn :G3, 0.125
playn :G3, 0.125
playn :G3, 0.125
playn :G3, 0.25
playn :A3, 0.25
playn :G3, 0.25
playn :E3, 0.25
playn :rest, 0.25
playn :C3, 0.125
playn :D3, 0.125
playn :C3, 0.125
playn :D3, 0.25
playn :D3, 0.25
playn :C3, 0.25
playn :E3, 0.5
playn :rest, 0.5
playn :G3, 0.25
playn :G3, 0.25
playn :G3, 0.25
playn :A3, 0.25
playn :G3, 0.25
playn :E3, 0.25
playn :rest, 0.25
playn :C4, 0.5
playn :C4, 0.25
playn :B3, 0.25
playn :G3, 0.25
playn :A3, 0.25
playn :B3, 0.125
playn :A3, 0.125
playn :G3, 0.5

