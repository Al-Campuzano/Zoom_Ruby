class Organism

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
      #puts "The #{self.class} has reproduced."
      self.class.new
    else
      #puts "This #{self.class} is not alive."
    end
  end

  def perish
    #puts "It's dead, Jim."
    @alive = false
    true
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
    # puts "Uh oh. The MUTANT has reproduced!!"
    [Mutant.new, Mutant.new]
  end

  def perish
    # puts "OH NO! You can't kill the MUTANT!!"
    false
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
    if @organisms_onboard.length == 0
      puts "The ship is empty."
    else
      puts "\nThe following #{@organisms_onboard.length} organisms are on the ship: "
      @organisms_onboard.each do |x|
        print x.info
      end
      org_hash = {SeaCreature => 0, FlyingThing => 0, SuperMammal => 0, GentleBeast => 0, AlienPlant => 0, Mutant => 0}  
      @organisms_onboard.each do |org|
        org_hash[org.class] += 1
      end
      org_hash.each do |name, count|
        puts "#{name}: #{count}"
      end
    end
  end

  def blast_off
    puts "Commencing countdown:"
    (5).downto(1) do |i|
      puts i
      sleep 1
    end
    puts "BLAST OFF"

    3.times do
      puts "Fuel left: #{@fuel.round(2)}"
      @fuel *= 0.75
      sleep 1
    end
    puts "We're there!"
  end

  def transfer_to_planet(planet)
    puts "Transferring organisms to planet."
    planet.transfer_from_ship(@organisms_onboard)
    @organisms_onboard = []
  end
end

class Kepler
  def initialize
    @num_moons = 4
    @au = 1.25
    @atmosphere = ["nitrogen", "oxygen", "methane"]
  end

  def transfer_from_ship(organisms)
    @organisms_onplanet = organisms
    puts "Organisms are now on the planet."
  end

  def time_machine
    puts "One million years into the future..."
    1000.times do
      random_org = @organisms_onplanet.sample
      if rand(3) == 1
        @organisms_onplanet.delete(random_org) if random_org.perish 
      else
        @organisms_onplanet.push(*random_org.reproduce)
      end
    end
    self.manifest
  end

  def manifest
    puts "\nThe following #{@organisms_onplanet.length} organisms are on the planet: "
    org_hash = {SeaCreature => 0, FlyingThing => 0, SuperMammal => 0, GentleBeast => 0, AlienPlant => 0, Mutant => 0}  
    @organisms_onplanet.each do |org|
       org_hash[org.class] += 1
    end
    org_hash.each do |name, count|
      puts "#{name}: #{count}"
    end
  end
end

ship = Spaceship.new
ship.manifest
ship.blast_off
planet = Kepler.new
ship.transfer_to_planet(planet)
ship.manifest
planet.time_machine
