# Exist in their own .rb file
# Have at least 1 additional attribute
# Have at least 1 additional method.
# Overwrite at least 1 parent method.

require_relative 'musician'

class Bassist < Musician
  def initialize
    puts "I'm a bassist"
  end
end
