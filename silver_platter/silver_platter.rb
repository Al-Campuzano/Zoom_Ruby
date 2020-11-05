# Define the following classes:
# Fruit, which implements a custom to_s method
# Apple, which extends Fruit, overrides the to_s method and implements an eat method
# Banana, which extends Fruit, overrides the to_s method and implements an eat method
# Cheese, which implements a custom to_s method as well as an eat method
# Sausage, which implements a custom to_s method as well as an eat method

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
    puts "Mmm, green apples are my favorite!"
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
