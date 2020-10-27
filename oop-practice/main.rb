require_relative 'guitarist'
require_relative 'bassist'
require_relative 'drummer'

alex = Guitarist.new("Alex", 40, true)
alex.name("Alex Lifeson")
alex.add_instrument("Guitar")
alex.fave_strings("D'addario")
alex.perform
puts alex


al = Musician.new("Al Campuzano", 18)
al.active(1)
al.active(0)
al.active(false)
puts al
al.add_experience
al.perform
puts al

al.add_instrument("Guitar")
al.instruments
al.instruments { |y| puts y.include?("Guitar") }


geddy = Bassist.new("Geddy Lee", 42, true)
puts geddy

neil = Drummer.new("Neil Peart", 35)
neil.traditional_grip(nil)
puts neil
