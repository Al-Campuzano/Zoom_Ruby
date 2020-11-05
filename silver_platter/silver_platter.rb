

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
