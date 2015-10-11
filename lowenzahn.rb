# "Löwenzahn" - variation of the theme of a favorite german TV show for kids

tick = 0.8
half = 0.5*tick
quart = 0.5*half
length = 4

define :tusch do
  length.to_i.times.each_with_index do |_, i|
    sample :drum_splash_soft, amp: 0.35, release: 0.5*tick
    sleep 3*tick

    4.times do
      sample :drum_bass_soft, amp: 0.5
      sleep quart
    end
  end
end

define :beat do
  length.to_i.times.each_with_index do |_, i|
    sleep half
    sample :drum_cymbal_closed, amp: 0.25
    sleep half
    sample :bd_haus, amp: 0.3
  end
end

live_loop :frame do
  loop do
    tusch
  end
end

live_loop :beat_it do
  sync :frame
  loop do
    beat
  end
end

define :main_bass_pattern do
  play_chord Chord.new(:G2, :"1"), release: half
  sleep tick

  play_chord Chord.new(:G3, :"1"), release: half
  sleep tick

  play_chord Chord.new(:F3, :"1"), release: quart
  sleep quart

  play_chord Chord.new(:Fb3, :"1"), release: half
  sleep half

  play_chord Chord.new(:D3, :"1"), release: quart
  sleep half

  play_chord Chord.new(:D3, :"1"), release: 0.5*quart
  sleep quart

  play_chord Chord.new(:D3, :"1"), release: 0.5*quart
  sleep quart

  play_chord Chord.new(:D3, :"1"), release: 0.5*quart
  sleep quart
end

live_loop :foundation do
  sync :frame
  with_fx :compressor, amp: 1.8 do
    with_synth :fm do
      loop do
        main_bass_pattern
      end
    end
  end
end

live_loop :singing do
  sync :frame
  with_fx :compressor, amp: 0.2 do
    with_synth :fm do
      loop do
        play_chord Chord.new(:G4, :"1"), release: quart
        sleep half

        play_chord Chord.new(:G4, :"1"), release: quart
        sleep half

        sleep 3*tick
      end
    end
  end
end

# live_loop :singing2 do
#   sync :frame
#
#   with_fx :echo, delay: 0.2 do
#     with_fx :compressor, amp: 0.2 do
#       with_synth :fm do
#         loop do
#           play_chord Chord.new(:G4, :"1"), release: quart
#           sleep half
#
#           play_chord Chord.new(:G4, :"1"), release: quart
#           sleep half
#
#           sleep 3*tick
#         end
#       end
#     end
#   end
# end
#
# live_loop :singing3 do
#   sync :frame
#
#   with_fx :distortion, distort: 2.0 do
#     with_fx :compressor, amp: 0.4 do
#       with_synth :fm do
#         loop do
#           play_chord Chord.new(:G4, :"1"), release: quart
#           sleep half
#
#           play_chord Chord.new(:G4, :"1"), release: quart
#           sleep half
#
#           sleep 3*tick
#         end
#       end
#     end
#   end
# end
