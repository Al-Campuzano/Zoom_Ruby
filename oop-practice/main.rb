require_relative 'guitarist'
require_relative 'bassist'
require_relative 'drummer'

alex = Guitarist.new
puts "Alex: #{alex.object_id}"


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


geddy = Bassist.new
puts "Geddy: #{geddy.object_id}"

neil = Drummer.new
puts "Neil: #{neil.object_id}"
puts neil
