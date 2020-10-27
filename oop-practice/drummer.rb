# Exist in their own .rb file
# Have at least 1 additional attribute
# Have at least 1 additional method.
# Overwrite at least 1 parent method.

require_relative 'musician'

class Drummer < Musician
  def initialize(name = "Anonymous", years_experience = 0, active = false, traditional_grip = false)
    super(name, years_experience, active)
    @traditional_grip = traditional_grip
    puts "I'm a drummer"
  end

  def traditional_grip(value)
    @traditional_grip = value ? true : false
  end

  def perform
    @active = true
    puts "#{@name} is a maniac on the skins!"
  end

  def to_s
    return super + " I do#{@traditional_grip ? "": " not"} use traditional grip."
  end
end
