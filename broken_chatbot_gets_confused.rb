# 'Broken chatbot gets confused'
# An ode to the beauty of randomness

tick          = 1.0
half          = 0.5*tick
quart         = 0.25*tick
length        = 8*tick

define :dotted do |note|
  1.5*note
end

in_thread(name: :frame) do
  cue :frame
  loop do
    permanent_drumset
  end
end

in_thread(name: :the_red_line) do
  sync :frame
  with_fx :compressor, amp: 0.3 do
    loop do
      shift = [10, 5, 15, -5, -10, 25, 40].sample
      with_synth :fm do
        play_chord [50+shift, 53, 58]
        sleep quart

        play_chord [50, 53+shift, 58]
        sleep quart

        play_chord [50, 53+shift, 58+shift]
        sleep quart

        if rand(100) % 3 < 3
          play_chord [50+shift, 53, 58]
          sleep quart
        end
      end
    end
  end
end

define :permanent_drumset do
  length.to_i.times.each_with_index do |_, i|
    sample :drum_bass_soft, amp: rand(100).to_f / 100.0
    sleep quart
    sample :drum_bass_hard, amp: rand(100).to_f / 100.0
    sleep quart
    sample :drum_snare_soft, amp: rand(100).to_f / 100.0
    sleep quart
    sample :drum_cymbal_closed if i % 8 == 3
    sleep quart
  end
end
