# 91-105 in Head First Ruby,

class Animal
  attr_reader :name, :age

  def name=(value)
    if value == ""
      raise "Name can't be blank"
    end
    @name = value
  end

  def age=(value)
    if value < 0
      raise "An age of #{value} isn't valid"
    end
    @age = value
  end

  def talk
    puts "#{name} says Bark!"
  end

  def move(destination)
    puts "#{@name} runs to the #{destination}."
  end

  def report_age
    puts "#{name} is #{age} years old."
  end
end

class Dog < Animal
  
end

class Bird < Animal
  
end

class Cat < Animal
  
end

dog = Dog.new
dog.name = "Rusty"
dog.age = 3
dog.talk
dog.move("Couch")
dog.report_age
