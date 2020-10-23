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
    puts @alive ? "The organism is eating." : "This organism is not alive."
  end

  def reproduce
    if @alive
      puts "The organism has reproduced."
      self.class.new
    else
      puts "This organism is not alive."
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

sea_creature = SeaCreature.new

sea_creature.eat
sea2 = sea_creature.reproduce
sea_creature.info
sea2.info
sea2.perish
sea2.reproduce
