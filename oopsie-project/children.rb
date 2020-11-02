# To make life on the planet more interesting, create 3 new creatures evolved from the parent class above. The new subclasses will have the following:
 

# 2 additional methods 
# 1 additional attribute
# 1 additional hash item

require_relative 'parent'
require_relative 'modules'

class Cartoon < Creature
  include GrowsSpices
  include GoodAtMaths
  
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
  include AcceptsBribes
  include GrowsSpices
  
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

class Jester < Creature
  include AcceptsBribes
  include GoodAtMaths

  attr_reader :joke

  def initialize(name="UNKNOWN", age=999, catch_phrase="Velcro: what a rip-off!", joke="Orion's Belt is a big waist of space")
    super(name, age, catch_phrase)
    @items["Hats"] = 69
    @joke = joke
  end

  def entertain
    puts @catch_phrase
    puts @joke
    self.move { "My irrational fear of moving stairs seems to be getting worse. You might say it’s… escalating." }
  end

  def joke=(joke)
    if joke == ""
      raise "The jester MUST have a joke, it can't be blank."
    else
      @joke = joke.to_s
    end
  end

  def move
    if block_given?
      puts yield
    else
      puts  "I'm moving to Greenwich in a couple months. Don't know what I'm going to do in the mean time..."
    end
  end
end
