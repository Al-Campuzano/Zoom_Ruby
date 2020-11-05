# Under the class definitions, create a variable called silver_platter that stores a list of at least one instance of each class you defined above. Then, iterate through the list using each, first printing out the object using its to_s, then calling the eat method. Did you run into any problems? Why or why not? (Include your written answer in your PR description.)
# silver_platter.rb:53:in `block in <main>': undefined method `eat' for #<Fruit:0x00007ff1dc114a38> (NoMethodError)

class Fruit
  def to_s
    "I'm a juicy #{self.class}."
  end
end

class Apple < Fruit
  def to_s
    "I'm a tart #{self.class}."
  end

  def eat
    puts "Green apples are my favorite!"
  end
end

class Banana < Fruit
  def to_s
    "I'm a ripe #{self.class}."
  end

  def eat
    puts "You gotta peel me first!"
  end
end

class Cheese
  def to_s
    "I'm a creamy #{self.class}."
  end

  def eat
    puts "Mmm so Gouda!"
  end
end

class Sausage
  def to_s
    "I'm a #{self.class}."
  end

  def eat
    puts "These jokes are the wurst!"
  end
end

silver_platter = [Fruit.new, Apple.new, Banana.new, Cheese.new, Sausage.new]

silver_platter.each do |food|
  puts food
  food.eat
end
