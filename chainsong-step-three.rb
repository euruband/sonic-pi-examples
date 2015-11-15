# download the track here https://soundcloud.com/maedelswithamicrophone/sounds-a-sudden-berlin-hail
# change file path to correspond with where you save it on your computer

# first, play the track - leave to play throughout whole piece.
relative_path = case ENV['USER']
                when 'tam'
                  then 'tam/code/euruband'
                when 'robin'
                  then 'robin/private_projects/sonic-pi-examples'
                when 'annika'
                  then 'hey/annika/place/your/path/here'
                end

sample "/Users/#{relative_path}/external_tracks/hail.wav"

# add the piano after a few seconds
live_loop :piano do
  #sample :ambi_piano, rate: [0.5, 0.7, 0.9].choose
  sleep 2
end

#play ^for two chords, then add beat1 (a.k.a. remove the '#')

live_loop :beat1 do
  #sample :bd_haus, rate: 0.9, cutoff: rrand(40, 90), amp: 0.7
  sleep 0.5
end

#play for a bit, then add beat2

live_loop :beat2 do
  #sample [:bd_ada, :bd_tek].choose, amp: 0.5
  sleep [0.75, 1].choose
end

#add choir - play 2 or 3 times

live_loop :choir do
  #sample :ambi_choir, rate: [-1,0.4,-0.5].choose, cutoff: 70, amp: 0.4
  sleep 3
end

#remove choir, & add guitar. After a few beats, remove piano

live_loop :guitar do
  with_fx :compressor, amp: 0.4 do
    with_fx :echo, delay: 0.25 do
      (1..3).each do |attack|
        #sample :guit_e_slide, attack: attack
      end
      sleep rrand(2, 4, 6, 8)
    end
  end
end

live_loop :chords_managed do
  sync :piano

  #chords
  #running_chords
  #whipping_chords
end

define :chords do
  play chord(:E3, :m7), release: 4
  sleep 4
  play chord(:E3, :minor), release: 4
  sleep 4
end

define :running_chords do
  [6, 8, 10, 12, 14].each do |amp|
    with_fx :compressor, amp: amp.to_f / 10.0 do
      with_synth :fm do
        4.times do
          play chord(:E2, "5"), release: 0.3
          sleep 0.25
        end
        2.times do
          play chord(:C2, "5"), release: 0.3
          sleep 0.25
        end
        2.times do
          play chord(:D2, "5"), release: 0.3
          sleep 0.25
        end
      end
    end
  end
end

define :whipping_chords do
  with_synth :sine do
    with_fx :compressor, amp: 0.85 do
      play chord(:E3, :m), release: 0.25
      sleep 0.25
      play chord(:E3, :minor), release: 0.25
      sleep 0.5

      play chord(:C4, :m7), release: 0.25
      sleep 0.25
      play chord(:C3, :m7), release: 0.25
      sleep 0.5

      play chord(:F4, :m), release: 0.25
      sleep 0.25
      play chord(:F3, :minor), release: 0.25
      sleep 0.5

      sleep 0.25
      sleep 0.5
      sleep 1
    end
  end
end
