# To make life on the planet more interesting, create 3 new creatures evolved from the parent class above. The new subclasses will have the following:
 

# 2 additional methods 
# 1 additional attribute
# 1 additional hash item

require_relative 'parent'

class Cartoon < Creature
  def initialize(name="UNKNOWN", age=999, catch_phrase="I'm animated!", animation_type="Claymation")
    super(name, age, catch_phrase)
    @items["Saws"] = 2
    @animation_type = animation_type
  end

  def jump
    "#{@name} jumped #{random(10)} feet high."
  end

  def to_s
    "#{@name} is a cartoon character that is #{@age} years old, in the #{@animation_type} style, and likes to say '#{@catch_phrase}'."
  end

  def move
    puts "I don't feel like moving!!"
  end
end

