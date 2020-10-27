require_relative 'musician'

class Guitarist < Musician
  def initialize
    puts "I'm a guitarist"
  end
end

jimi = Guitarist.new
puts "Jimi: #{jimi.object_id}"


al = Musician.new("Al Campuzano", 19)
al.name("")
