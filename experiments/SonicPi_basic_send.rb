# Basic demo of OSC sending.

ip_address = "10.0.1.10"

osc_send "127.0.0.1", 4559, "/play"
osc_send ip_address, 4559, "/ipnetwork"

live_loop :bong do
  sample :bd_haus
  osc_send ip_address, 4559, "/test/bong"
  sleep 0.25
end

live_loop :tish do
  sample :sn_dolf
  osc_send ip_address, 4559, "/test/tish"
  sleep 1
end