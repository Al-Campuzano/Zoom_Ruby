require_relative 'musician'
require_relative 'mixins'

class Drummer < Musician
  include Trainable
  
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
