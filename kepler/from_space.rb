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
    @habitat = "land"
    @diet = "carnivore"
    @type = "mammal"
    @alive = true
  end

  def eat
    puts @alive ? "The organism is eating." : "He's dead, Jim."
  end

  def reproduce
    puts "The organism has reproduced."
    offspring = self.class.new
  end

  def perish
    puts "The organism has died."
    @alive = false
  end
end

org = Organism.new

org.eat
org2 = org.reproduce
org2.eat
org.perish
org.eat
