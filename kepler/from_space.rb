class Organism
  # attr_accessor :habitat
  # attr_accessor :diet
  # attr_accessor :type

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

class AlienPlant < Organism
  def initialize
    super
    @type = "plant"
    @diet = "photosynthesis"
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

class Spaceship
  attr_accessor :organisms_onboard
  def initialize
    @organism_types = [Mutant, SeaCreature, FlyingThing, SuperMammal, GentleBeast, AlienPlant, Mutant]
    @organisms_onboard = []
    @fuel = 100
    self.load_organisms
  end

  def load_organisms
    10.times do
      to_add = @organism_types.sample.new
      @organisms_onboard.push(to_add)
      if rand(2) == 1
        @organisms_onboard.push(*to_add.reproduce)
      end
    end
  end

  def manifest
    puts "\nThe following #{@organisms_onboard.length} organisms are on the ship: "
    @organisms_onboard.each do |x|
      print x.info
    end
  end
end

ship = Spaceship.new
ship.manifest
