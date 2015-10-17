# "Löwenzahn" - variation of the theme of a favorite german TV show for kids
tick         = 0.7
half         = 0.5*tick
quart        = 0.5*half
total_length = 40
length       = 4

# Some notes on the structure:
#
# First, we define all patterns.
# They are invoked below, each
# in a single "thread" (≡ live_loop)
#
# The live_loops created were synced to
# *one* single "frame", which is a live_loop, too

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
  with_fx :echo, delay: 0.05, decay: 0.05 do
    with_synth :fm do
      play_chord Chord.new(:C4, :"1"), release: quart
      sleep half

      play_chord Chord.new(:C4, :"1"), release: quart
      sleep half

      sleep 3*tick
    end
  end
end

define :swinging do
  with_fx :echo, delay: 0.05, decay: 0.05 do
    with_synth :fm do
      play_chord Chord.new(:G4, :"1"), release: quart
      sleep half

      play_chord Chord.new(:G4, :"1"), release: quart
      sleep half

      sleep 3*tick
    end
  end
end

define :dancing_tones do
  with_synth :fm do
    with_fx :compressor, amp: 4.0 do
      sleep 3*tick

      play_chord Chord.new(:G4, :"1"), release: quart
      sleep quart # 0.25

      play_chord Chord.new(:A4, :"1"), release: 0.5*quart
      sleep quart # 0.5

      play_chord Chord.new(:B4, :"1"), release: quart
      sleep half # 1.0

      # --- 4 ---

      play_chord Chord.new(:B4, :"1"), release: quart
      sleep 2.5*tick + quart + quart

      play_chord Chord.new(:B4, :"1"), release: quart
      sleep quart

      play_chord Chord.new(:A4, :"1"), release: quart
      sleep quart

      play_chord Chord.new(:G4, :"1"), release: quart
      sleep quart

      play_chord Chord.new(:D4, :"1"), release: quart
      sleep quart

      play_chord Chord.new(:D4, :"1"), release: quart
      sleep quart

      play_chord Chord.new(:D4, :"1"), release: quart
      sleep 3.25*tick

      play_chord Chord.new(:G4, :"1"), release: quart
      sleep quart # 0.25

      play_chord Chord.new(:A4, :"1"), release: 0.5*quart
      sleep quart # 0.5

      # --- 12 ---

      play_chord Chord.new(:B4, :"1"), release: quart
      sleep half

      play_chord Chord.new(:B4, :"1"), release: quart
      sleep half

      play_chord Chord.new(:B4, :"1"), release: quart
      sleep quart

      play_chord Chord.new(:A4, :"1"), release: quart
      sleep quart

      play_chord Chord.new(:G4, :"1"), release: quart
      sleep quart

      play_chord Chord.new(:D4, :"1"), release: quart
      sleep tick + half + quart

      play_chord Chord.new(:G4, :"1"), release: quart
      sleep quart # 0.25

      play_chord Chord.new(:A4, :"1"), release: 0.5*quart
      sleep quart # 0.5

      # --- 16 ---

      play_chord Chord.new(:B4, :"1"), release: quart
      sleep half

      play_chord Chord.new(:B4, :"1"), release: quart
      sleep half

      play_chord Chord.new(:B4, :"1"), release: quart
      sleep quart

      play_chord Chord.new(:A4, :"1"), release: quart
      sleep quart

      play_chord Chord.new(:G4, :"1"), release: quart
      sleep quart

      play_chord Chord.new(:D5, :"1"), release: quart
      sleep tick + half + quart

      play_chord Chord.new(:D5, :"1"), release: quart
      sleep quart # 0.25

      play_chord Chord.new(:E5, :"1"), release: 0.5*quart
      sleep quart # 0.5

      # --- 20 ---

      play_chord Chord.new(:F5, :"1"), release: quart
      sleep half

      play_chord Chord.new(:F5, :"1"), release: quart
      sleep half

      play_chord Chord.new(:F5, :"1"), release: quart
      sleep quart

      play_chord Chord.new(:E5, :"1"), release: quart
      sleep quart

      play_chord Chord.new(:D5, :"1"), release: quart
      sleep quart

      play_chord Chord.new(:C5, :"1"), release: quart
      sleep half

      play_chord Chord.new(:C5, :"1"), release: quart
      sleep half + quart
      play_chord Chord.new(:G4, :"1"), release: quart
      sleep quart

      play_chord Chord.new(:A4, :"1"), release: quart
      sleep quart

      play_chord Chord.new(:B4, :"1"), release: quart
      sleep quart

      play_chord Chord.new(:A4, :"1"), release: quart
      sleep quart + 4*tick
    end
  end
end

define :bass_finish do
  with_synth :fm do
    with_fx :compressor, amp: 0.25 do
      with_fx :distortion, distort: 0.3 do
        4.times do
          play_chord Chord.new(:B3, :"5"), release: half
          sleep half
        end

        4.times do
          play_chord Chord.new(:F3, :"5"), release: half
          sleep half
        end

        play_chord Chord.new(:A3, :"5"), release: 4*tick
        sleep 4*tick
      end
    end
  end
end

# All previous definitions were
# invoked now


# The live_loop below ("frame"(
# is the thread every other pattern
# is synced to

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

live_loop :singing do
  sync :frame
  with_fx :compressor, amp: 0.4 do
    loop do
      2.times { swinging }
      2.times { swinging_shifted }

      sleep (total_length-16)*tick
    end
  end
end

live_loop :dancing_tones do
  sync :frame
  with_fx :compressor, amp: 0.4 do
    loop do
      sleep 3*4*tick
      dancing_tones
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
          bass_finish
        end
      end
    end
  end
end
