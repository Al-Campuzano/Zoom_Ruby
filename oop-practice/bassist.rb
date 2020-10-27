# Exist in their own .rb file
# Have at least 1 additional attribute
# Have at least 1 additional method.
# Overwrite at least 1 parent method.

require_relative 'musician'

class Bassist < Musician
  def initialize (name = "Anonymous", years_experience = 0, active = false, fave_amp = "Ampeg")
    super(name, years_experience, active)
    @fave_amp = fave_amp
    puts "I'm a bassist"
  end

  def fave_amp(amp)
    raise "That amp is invalid" unless amp.is_a? String
    @fave_amp = amp
  end

  def perform
    @active = true
    puts "#{@name} is slappin da bass!"
  end

  def to_s
    return super + " My favorite amp is #{@fave_amp}."
  end
end
