# "Löwenzahn" - variation of the theme of a favorite german TV show for kids

tick = 0.5
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

define :shifted_bass_pattern do
  play_chord Chord.new(:C3, :"1"), release: half
  sleep tick

  play_chord Chord.new(:C4, :"1"), release: half
  sleep tick

  play_chord Chord.new(:Bb3, :"1"), release: quart
  sleep quart

  play_chord Chord.new(:A3, :"1"), release: half
  sleep half

  play_chord Chord.new(:G3, :"1"), release: quart
  sleep half

  play_chord Chord.new(:G3, :"1"), release: 0.5*quart
  sleep quart

  play_chord Chord.new(:G3, :"1"), release: 0.5*quart
  sleep quart

  play_chord Chord.new(:G3, :"1"), release: 0.5*quart
  sleep quart
end

define :swinging_shifted do
  with_synth :fm do
    play_chord Chord.new(:C4, :"1"), release: quart
    sleep half

    play_chord Chord.new(:C4, :"1"), release: quart
    sleep half

    sleep 3*tick
  end
end

define :swinging do
  with_synth :fm do
    play_chord Chord.new(:G4, :"1"), release: quart
    sleep half

    play_chord Chord.new(:G4, :"1"), release: quart
    sleep half

    sleep 3*tick
  end
end

live_loop :singing do
  sync :frame
  with_fx :compressor, amp: 0.4 do
    loop do
      2.times { swinging }
      2.times { swinging_shifted }
      4.times { swinging }
      2.times { sleep 8*tick }
    end
  end
end

define :dancing_tones do
  # This part is not correct yet. Let's say, its a start.. :)
  # It's the part the "right hand" would play on the piano.
  with_synth :fm do
    with_fx :compressor, amp: 4.0 do
      sleep 3*tick

      play_chord Chord.new(:G4, :"1"), release: quart
      sleep quart # 0.25

      play_chord Chord.new(:A4, :"1"), release: 0.5*quart
      sleep quart # 0.5

      play_chord Chord.new(:B4, :"1"), release: quart
      sleep half # 1.0

      # ---

      play_chord Chord.new(:B4, :"1"), release: quart
      sleep 3*tick

      sleep quart
      play_chord Chord.new(:B4, :"1"), release: quart
      sleep quart

      play_chord Chord.new(:A4, :"1"), release: quart
      sleep quart

      play_chord Chord.new(:G4, :"1"), release: quart
      sleep quart

      play_chord Chord.new(:D4, :"1"), release: quart
      sleep half

      play_chord Chord.new(:D4, :"1"), release: quart
      sleep 3.5*tick
    end
  end
end

live_loop :dancing_tones do
  sync :frame
  with_fx :compressor, amp: 0.4 do
    loop do
      sleep 3*4*tick
      dancing_tones
      sleep 2*8*tick
    end
  end
end

define :finish do
  with_synth :fm do
    with_fx :distortion do
      play_chord Chord.new(:B3, :"5"), release: 2*tick
      sleep 2*tick

      play_chord Chord.new(:F3, :"5"), release: 2*tick
      sleep 2*tick

      play_chord Chord.new(:A3, :"5"), release: 4*tick
      sleep 4*tick
    end
  end
end

live_loop :foundation do
  sync :frame
  with_fx :compressor, amp: 1.8 do
    with_synth :fm do
      loop do
        2.times do
          main_bass_pattern
        end

        2.times do
          shifted_bass_pattern
        end

        4.times do
          main_bass_pattern
        end

        1.times do
          finish
        end
      end
    end
  end
end

