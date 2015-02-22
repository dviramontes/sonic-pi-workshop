path = "~/local/coderdojo/sonic-pi/samples/charlie.wav"
load_samples [path]

# charlie bit my finger
# intro
#=begin
3.times do
  sample path,
    rate:1.3, start: 0.8, finish: 0.9,
    amp:2, cutoff: 40 if rand > 0.5
  in_thread do
    sample :bass_dnb_f
  end
  sleep 1
end
#=end

live_loop :ambient do
  sample :ambi_choir, rate:0.25, release: 6, cutoff: [40,70,60].choose
  sleep 1
end

live_loop :beat do
  with_fx :compressor do
    sample :loop_compus, start: 0.5, finish: 0.8, rate: 2, cutoff: [40,70,60].choose
  end
  sleep 1
end
