# based on: The White Stripes - Seven Nation Army
# This version at Soundcloud: https://soundcloud.com/open_horse_music/seven-nation-army

tick          = 1.0
half          = 0.5*tick
quart         = 0.25*tick
eigth         = 0.125*tick
length        = 8*tick

define :dotted do |note|
  1.5*note
end

define :random_synth do
  [:mod_tri, :prophet, :pretty_bell].sample
end

define :random_drum_sample do
  [:drum_cymbal_open, :drum_snare_hard, :drum_splash_hard].sample
end

in_thread(name: :frame) do
  cue :frame
  loop do
    permanent_drumset
  end
end

define :permanent_drumset do
  freak_out_mode = [true, false, false].sample
  length.to_i.times.each_with_index do |_, i|
    sample :drum_bass_soft
    sample :drum_cymbal_closed if i % 8 == 3
    sample random_drum_sample  if freak_out_mode
    sleep half
  end
end

define :bass_guitar do

  # meeep.
  # Feels like that's not 100% correct..
  #

  play :e3
  sleep dotted(half)

  play :e3
  sleep quart

  play :g3, release: 0.4
  sleep dotted(quart)

  play :e3, release: 0.4
  sleep dotted(quart)

  play :d3, release: 0.4
  sleep quart

  play :c3, release: 0.8
  sleep tick

  play :b2
  sleep tick
end

define :lead_guit do

  play :g4, sustain: 1.5
  sleep 2.0

  play 70, sustain: 1.0
  sleep tick

  play :a4, sustain: 0.5, release: 0.5
  sleep tick

  play :g4, sustain: 1.5
  sleep 2.0

  play 70, sustain: 0.5
  sleep quart
  sleep 0.125

  play 71, release: 0.24
  sleep quart
  sleep 0.125

  play 70, release: 0.24
  sleep quart

  play 69, sustain: 1.0
  sleep tick
end

in_thread(name: :the_red_line) do
  sync :frame
  with_fx :compressor, amp: 0.8 do
    loop do
      with_synth :fm do
        bass_guitar
      end
    end
  end
end

in_thread(name: :ontop) do
  sync :frame
  sleep 8*tick

  with_fx :distortion do
    with_fx :compressor, amp: 0.2 do
      loop do
        with_synth random_synth do
          lead_guit
        end
      end
    end
  end
end
