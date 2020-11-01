# To make life on the planet more interesting, create 3 new creatures evolved from the parent class above. The new subclasses will have the following:
 

# 2 additional methods 
# 1 additional attribute
# 1 additional hash item

require_relative 'parent'
require_relative 'modules'

class Cartoon < Creature
  attr_reader :animation_type

  def initialize(name="UNKNOWN", age=999, catch_phrase="I'm animated!", animation_type="Claymation")
    super(name, age, catch_phrase)
    @items["Saws"] = 2
    @animation_type = animation_type
  end

  def jump
    puts "#{@name} jumped #{rand(10)} feet high."
  end

  def animation_type=(animation_type)
    if animation_type == ""
      raise "A blank animation type is not allowed."
    else
      @animation_type = animation_type.to_s
    end
  end

  def to_s
    "#{@name} is a cartoon character that is #{@age} years old, in the #{@animation_type} style, and likes to say '#{@catch_phrase}'."
  end

  def move
    puts "I don't feel like moving!!"
  end
end

class SuperHero < Creature
  attr_reader :super_power

  def initialize(name="UNKNOWN", age=999, catch_phrase="HULK SMASH!", super_power="Flight")
    super(name, age, catch_phrase)
    @items["Capes"] = 257
    @super_power = super_power
  end

  def fly
    if ["flight", "flying", "fly"].include?(@super_power.downcase)
      5.downto(1) do |i|
        puts i
        sleep 1
      end
      puts "It's not a bird, it's not a plane, it's #{@name}!"
    else
      puts "#{@name} can't fly :("
    end
  end

  def super_power=(super_power)
    if super_power == ""
      @super_power = "NONE!"
    else
      @super_power = super_power.to_s
    end
  end

  def move
    self.fly
  end
end

bob = Cartoon.new
bob.name = "Sponge Bob"
bob.age = 8
bob.catch_phrase = "I live in a pineapple under the sea"
bob.jump
p bob.items
puts bob
bob.move

clark = SuperHero.new
clark.name = "Clark Kent"
p clark.items
clark.fly
clark.super_power = "Invinsibility"
clark.move
