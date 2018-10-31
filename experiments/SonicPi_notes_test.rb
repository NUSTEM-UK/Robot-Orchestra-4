
notes_code = [:C4, :D4, :E4, :F4, :G4, :A4, :B4, :C5]
notes_code_full = [:C4, :Db4, :D4, :Eb4, :E4, :F4, :Gb4, :G4, :Ab4, :A4, :Bb4, :B]

for i in notes_code
  play i
  sleep 0.5
end

sleep 0.5

notes_freq = [261.63, 293.18, 329.63, 349.23, 392.00, 440.00, 493.88, 523.26]

for i in notes_freq
  play hz_to_midi(i)
  sleep 0.5
end

sleep 0.5

notes_midi = [60, 62, 64, 65, 67, 69, 71, 72]

for i in notes_midi
  play i
  sleep 0.5
end
