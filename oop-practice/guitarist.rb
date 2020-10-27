# Exist in their own .rb file
# Have at least 1 additional attribute
# Have at least 1 additional method.
# Overwrite at least 1 parent method.

require_relative 'musician'

class Guitarist < Musician
  def initialize(name = "Anonymous", years_experience = 0, active = false, fave_strings = "Dean Martin")
    super(name, years_experience, active)
    @fave_strings = fave_strings
    puts "I'm a guitarist"
  end

  def fave_strings(strings)
    raise "Those strings are not valid" unless strings.is_a? String
    @fave_strings = strings
  end

  def perform
    @active = true
    puts "#{@name} is playing a crazy solo!"
  end

  def to_s
    return super + " My favorite strings are #{@fave_strings}."
  end
end
