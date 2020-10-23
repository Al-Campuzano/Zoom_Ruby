# Organisms
# At least 5 distinct Organisms written as ruby Classes
# Each Organism must contain Instance Variables and Instance Methods that represent all the organism needs to know and do in order to survive
# At least 1 method should print out information about the creature

class Organism
  # need to know: habitat(land, water, air), diet(carnivore, herbivore, omnivore, photosynthesis), type(mammal, reptile, fish, insect, plant)
  # needs to do: hunt, flee, reproduce, eat, perish
  # print info
  attr_accessor :habitat
  attr_accessor :diet
  attr_accessor :type

  def initialize
    @habitats = ["land", "water", "air"]
    @diets = ["carnivore", "herbivore", "omnivore", "photosynthesis"]
    @types = ["mammal", "reptile", "fish", "insect", "plant"]

    @habitat = @habitats.sample
    @diet = @diets.sample
    @type = @types.sample
    @alive = true
  end

  def eat
    puts @alive ? "The #{self.class} is eating." : "This #{self.class} is not alive."
  end

  def reproduce
    if @alive
      puts "The #{self.class} has reproduced."
      self.class.new
    else
      puts "This #{self.class} is not alive."
    end
  end

  def perish
    puts "It's dead, Jim."
    @alive = false
  end

  def info
    puts "This #{self.class} is a #{@diet} #{@type}, and it lives in the #{@habitat}."
  end
end

class SeaCreature < Organism
  def initialize
    super
    @habitat = "water"  
  end
end

class FlyingThing < Organism
  def initialize
    super
    @habitat = "air"
  end
end

class SuperMammal < Organism
  def initialize
    super
    @type = "mammal"
  end
end

class GentleBeast < Organism
  def initialize
    super
    @diet = "herbivore"
  end
end

class Mutant < Organism
  def reproduce
    puts "Uh oh. The MUTANT has reproduced!!"
    [Mutant.new, Mutant.new]
  end

  def perish
    puts "OH NO! You can't kill the MUTANT!!"
  end
end

mutant = Mutant.new
mutant.eat
mutant.perish
mutant.reproduce
