# Write a program that:
# Creates new objects
# Demonstrates their functionality
# Calls super()
# Adds and removes values to an array

require_relative 'guitarist'
require_relative 'bassist'
require_relative 'drummer'

alex = Guitarist.new("Alex", 40, true)
alex.name("Alex Lifeson")
alex.add_instrument("Guitar")
alex.add_instrument("Mandolin")
alex.add_instrument("Harp")
alex.fave_strings("D'addario")
alex.perform
alex.instruments
alex.remove_instrument("Mandolin")
alex.instruments
alex.is_approachable
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
geddy.work
puts geddy

neil = Drummer.new("Neil Peart", 35)
neil.traditional_grip(nil)
neil.add_skill("Writer")
puts neil
