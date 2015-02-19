##### workspace # 1
###################
# C	 D	E  F	G	A	B
# 60 62	64 65	67	69	71

@sleep = 0.5
use_synth :sine

# 1.
play 60
sleep 0.5
play 60
sleep 0.5
play 67
sleep 0.5
play 67
sleep 0.5
play 69
sleep 0.5
play 69
sleep 0.5
play 67
sleep 1

# 2.
play 65
sleep 0.5
play 65
sleep 0.5
play 64
sleep 0.5
play 64
sleep 0.5
play 62
sleep 0.5
play 62
sleep 0.5
play 60
sleep 1

# 3.
2.times do 
	play 67
	sleep 0.5
	play 67
	sleep 0.5
	play 65
	sleep 0.5
	play 65
	sleep 0.5
	play 64
	sleep 0.5
	play 64
	sleep 0.5
	play 62
	sleep 1
end

# 4.
play 60
sleep 0.5
play 60
sleep 0.5
play 67
sleep 0.5
play 67
sleep 0.5
play 69
sleep 0.5
play 69
sleep 0.5
play 67
sleep 1

# 5.
play 65
sleep 0.5
play 65
sleep 0.5
play 64
sleep 0.5
play 64
sleep 0.5
play 62
sleep 0.5
play 62
sleep 0.5
play 60
sleep 1

##### workspace # 2
###################

# use_debug true

### 2 

=begin
live_loop :magic, auto_cue: false do |idx|
  use_synth :fm
  play_chord [60,71,64,67], detune: 8
  sleep [0.5, 1, 0.25].choose
  var = (scale 2, :mixolydian, num_octaves: 8)
  use_synth :saw
  play var.choose
  sleep 0.125
  sample :misc_burp, rate: 0.25, env_curve: 3
end
=end

### 2 

load_samples ["~/local/coderdojo/sonic-pi/sample.wav"] # this sample comes from the sequence we wrote above

#=begin
live_loop :moreMagic, auto_cue: false do
  with_fx :lpf do
    sample "~/local/coderdojo/sonic-pi/sample.wav", rate:1.4, start: 0.1, finish: rrand(0.35,0.7), 
      pan: [0,1].choose, decay: 1, sustain: [-1,0].choose, env_curve: 3
  end
  sleep 0.5
  with_fx :ixi_techno do
    sample :drum_bass_hard, rate: 2, amp: 2
  end
end
#=end

