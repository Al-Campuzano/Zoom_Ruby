# Under the class definitions, create a variable called silver_platter that stores a list of at least one instance of each class you defined above. Then, iterate through the list using each, first printing out the object using its to_s, then calling the eat method. Did you run into any problems? Why or why not? (Include your written answer in your PR description.)
# silver_platter.rb:53:in `block in <main>': undefined method `eat' for #<Fruit:0x00007ff1dc114a38> (NoMethodError)

# Remove the error by updating what is in your silver_platter list. What did you have to remove, and why? (Include your written answer in your PR description.)
# I had to remove the Fruit object from the silver_platter list because that class/object does not have an _eat_ method.

# Finally, add whatever you removed back to the list, and use respond_to? to fix the error.

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
    puts "How do you like them apples?"
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

silver_platter = [Apple.new, Banana.new, Cheese.new, Sausage.new]

silver_platter.each do |food|
  puts food
  food.eat
end
