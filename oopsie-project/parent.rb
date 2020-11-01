# You, a supreme being, have created a new planet and need life forms to populate this brave, new world. To accomplish this, you’ll need to start with a superclass of creatures. This superclass will have the following:
 
# initialize() method
# move() method
# speak() method
# Hash of  (minimum) 3 unique items it can carry. It can hold multiple copies of the same item (i.e. 3 apples, 8 umbrellas, 11 Twinkies). 
# give_item method
# Gives x number of an item to another object.
# receive_item method
# Receives x number of an item from an object
# Can only receive an item if it already exists in the hash
# 3 attributes

class Creature
  attr_accessor :items

  def initialize(name="UNKNOWN", age=999, catch_phrase=nil)
    @name = name
    @age = age
    @catch_phrase = catch_phrase
    @items = {"Hammers" => 1, "Nails" => 13, "Band-aids" => 4}
  end

  def move
    "#{@name} is on the move!"
  end

  def speak
    if block_given?
      yield
    else
      "#{@name} says: #{@catch_phrase ? @catch_phrase : 'I\'m the best!'}"
    end
  end

  def give_item(item, number)
    
  end

  def receive_item(item, number)
    if @items[item] 
      @items[item] += number
      puts "#{number} #{item} have been added."
    else
      puts "#{item} does not exist, so it cannot be received"
    end
  end
end
