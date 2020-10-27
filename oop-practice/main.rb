require_relative 'guitarist'

jimi = Guitarist.new
puts "Jimi: #{jimi.object_id}"


al = Musician.new("Al Campuzano", 19)
# al.name("")
al.active(1)
al.active(0)
al.active(false)
al.add_experience
puts al
al.perform
al.perform { puts "I'm playing a concert" }
puts al

al.add_instrument("Guitar")
al.instruments
