# theme interpretation of a "conventional" rock song
# SonicPi version: https://soundcloud.com/open_horse_music/blackminded-rsjp-vague-sonic-pi-interpretation-v2

tick   = 1.0
half   = 0.5*tick
quart  = 0.25*tick
length = 32*tick

in_thread(name: :frame) do
  cue :frame
  loop do
    permanent_drumset
  end
end

in_thread(name: :letsgetloud) do
  sync :frame
  sleep length
  loop do
    drums_please_get_loud
  end
end

define :permanent_drumset do
  length.to_i.times.each_with_index do |_, i|
    sample :drum_cymbal_closed
    sleep tick
  end
end

define :drums_please_get_loud do
  length.to_i.times.each_with_index do |_, i|
    with_fx :level, amp: 2.0 do
      sample :drum_bass_hard
      sleep half
      sample :drum_snare_hard
      sample :drum_cymbal_hard if i % 8 == 3
      sleep half
    end
  end
end

define :monolithic_pattern do
  4.times do
    [:a3, :cs4, :a4, :cs4].each do |note|
      play note
      sleep quart
    end
  end

  2.times do
    [:ab3, :cs4, :ab4, :cs4].each do |note|
      play note
      sleep quart
    end
  end

  1.times do
    [:ab3, :cs4, 66, :cs4].each do |note|
      play note
      sleep quart
    end
  end

  1.times do
    [56, :cs4, 65, :cs4].each do |note|
      play note
      sleep quart
    end
  end


  4.times do
    [57, :d3, 66, :d3].each do |note|
      play note
      sleep quart
    end
  end

  4.times do
    [54, :b2, 66, :b2].each do |note|
      play note
      sleep quart
    end
  end
end

in_thread(name: :the_red_line) do
  sync :frame
  loop do
    with_synth :sine do
      monolithic_pattern
    end
  end
end

in_thread(name: :groll) do
  sync :frame
  sleep 16*tick
  loop do
    sleep 12*tick
    with_fx :level, amp: 2.0 do
      with_synth(:fm) do
        with_fx(:distortion) do
          4.times do
            play 54.0
            sleep quart

            play :b2
            sleep quart

            #play 66.0
            sleep quart

            play :b2
            sleep quart
          end
        end
      end
    end
  end
end

in_thread(name: :screaming_git) do
  sync :frame
  sleep 48*tick
  loop do
    with_fx :level, amp: 0.4 do
      with_synth(:pulse) do
        with_fx(:distortion) do
          monolithic_pattern
        end
      end
    end
  end
end

in_thread(name: :supportive) do
  sync :frame
  sleep 16*tick
  loop do
    with_synth(:fm) do
      monolithic_pattern
    end
  end
end

in_thread(name: :supportive_dist) do
  sync :frame
  sleep 64*tick
  loop do
    with_synth(:fm) do
      with_fx(:distortion) do
        monolithic_pattern
      end
    end
  end
end
