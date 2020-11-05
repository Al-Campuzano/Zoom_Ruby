# Define 3 modules

module Approachable
  def is_approachable
    if rand(2) == 1
      puts "This #{self.class} is approachable."
    else
      puts "This #{self.class} is NOT approachable. They're a bit of a diva."
    end
  end
end

module Trainable
  def add_skill(skill)
    puts "Now I also have this new skill: #{skill}."
  end
end

module HardWorker
  def work
    self.perform
    self.perform
  end
end
