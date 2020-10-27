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

  # fave string method
  # override perform, maybe to_s
end
