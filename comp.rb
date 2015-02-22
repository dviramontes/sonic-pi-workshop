##### workspace # 1
###################

# THERE ARE NOTES
# C  D	E  F  G	 A  B
# 60 62	64 65 67 69 71

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

=begin
live_loop :moreMagic, auto_cue: false do
  with_fx :lpf, amp: 2, pre_amp: 1, cutoff: 85 do
    sample "~/local/coderdojo/sonic-pi/sample.wav", rate:1.4, start: 0.1, finish: rrand(0.35,0.7), 
      pan: [0,1].choose, decay: 1, sustain: [-1,0].choose, env_curve: 3
  end
  sleep 0.5
  with_fx :ixi_techno do
    sample :drum_bass_hard, rate: 2, amp: 2
  end
end
=end


### 3

load_samples ["~/local/coderdojo/sonic-pi/sample2.wav"] # and this is what you may call (re)sample

begin

  live_loop :evenMoeMagic, auto_cue: false do
    sample "~/local/coderdojo/sonic-pi/sample2.wav", rate:-6, start: 0.6, finish: [0.7, 0.9].choose,
      pan: [0,1].choose, decay: 1, sustain: [5,3,2].choose, res: 1
    sleep 0.75
    sample "~/local/coderdojo/sonic-pi/sample2.wav", rate: 2.4, start: 1, finish: 0.72,
      pan: [0,1].choose, cutoff: rrand(66, 88), sustain: [-1,0,2].choose
    while rand < 0.5
      with_fx :lpf do
        sleep 0.75
        sample :loop_compus, start: 0.1, finish: [0.7, 0.9].choose, rate: [-1,1,2.5,0.5].choose
        sample :drum_snare_hard, rate: 2, sustain_level:3, start: 0.1, finish: [0.7, 0.9].choose, rate: [-1,1,2.5,0.5].choose
      end
    end
  end

end



##### workspace # 3
###################

### 1

=begin

  live_loop :magic, auto_cue: false do |idx|
    use_synth :fm
    play_chord [61,64,71], detune: 12 
    sleep [0.5, 1, 0.25].choose
    in_thread do 
      use_synth :square
      var = (scale 20, :major, num_octaves: 4)
      play var.choose
      sleep [0.5, 1, 0.25].choose
    end
  end
  
=end



### 2

load_samples ["~/local/coderdojo/sonic-pi/sample.wav"] # this sample comes from the sequence we wrote above

begin

  live_loop :moreMagic, auto_cue: false do
      if rand > 0.5
        with_fx :echo do
          sample :guit_harmonics, rate:[-1.46,-1,-2].choose, start: 0.1, finish: rrand(0.2,0.9),
            pan: [0,1].choose, decay: 3, sustain: [-1,0,5].choose, attack: rrand(0.3,2.3), amp:5
        end
      end
      sleep 0.5
      with_fx :level do
      sample :drum_bass_hard, rate: 2, amp: 2 if rand > 0.5
      if rand < 0.5
        with_fx :ixi_techno do sample :loop_breakbeat, rate: 2, amp: 2, start: 0.1, finish: rrand(0.2,0.9) end
      else
        sample :loop_breakbeat, rate: 2, amp: 2
      end
    end
  end
end



