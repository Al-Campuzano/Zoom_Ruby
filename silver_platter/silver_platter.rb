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
    puts "Hard-core!"
  end
end

class Banana < Fruit
  def to_s
    "I'm a ripe #{self.class}."
  end

  def eat
    puts "Eating me is so appealing!"
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
  food.eat if food.respond_to? :eat
end
