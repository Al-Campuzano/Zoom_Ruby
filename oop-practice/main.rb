require_relative 'guitarist'
require_relative 'bassist'
require_relative 'drummer'

alex = Guitarist.new("Alex", 40, true)
alex.name("Alex Lifeson")
alex.add_instrument("Guitar")
alex.fave_strings("D'addario")
alex.perform
puts alex


al = Musician.new("Al Campuzano", 19)
# al.name("")
al.active(1)
al.active(0)
al.active(false)
al.add_experience
puts al
al.perform
puts al

al.add_instrument("Guitar")
al.instruments
al.instruments { |y| puts y.include?("Guitar") }


geddy = Bassist.new
puts geddy

neil = Drummer.new
puts "Neil: #{neil.object_id}"
puts alex
