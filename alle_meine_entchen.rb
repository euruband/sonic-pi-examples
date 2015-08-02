# "Alle meine Entchen"
# German traditional

in_thread do
  loop  do
    sample :drum_bass_soft
    sleep 0.5
  end
end

in_thread do
  sleep 0.5
  loop  do
    sample :drum_snare_hard
    sleep 1.0
  end
end

in_thread do
  sleep 1.0
  loop  do
    sample :drum_cymbal_closed
    sleep 2.0
  end
end

loop do
  
  short = 0.25
  long  = 0.5
 
  with_synth :fm do
  
    play :c
    sleep short

    play :d
    sleep short

    play :e
    sleep short

    play :f
    sleep short

    play :g
    sleep long

    play :g
    sleep 0.5

    2.times do
      4.times do
        play :a
        sleep short
      end

      play :g
      sleep 1.0
    end
    
    4.times do
      play :f
      sleep short
    end
    
    2.times do
      play :e
      sleep long
    end

    4.times do
      play :g
      sleep short
    end
  
    play :c
    sleep 1.0
  end
end