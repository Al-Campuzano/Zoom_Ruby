# You, a supreme being, have created a new planet and need life forms to populate this brave, new world. To accomplish this, you’ll need to start with a superclass of creatures. This superclass will have the following:
 
# initialize() method ✓
# move() method ✓
# speak() method ✓
# Hash of  (minimum) 3 unique items it can carry. It can hold multiple copies of the same item (i.e. 3 apples, 8 umbrellas, 11 Twinkies).  ✓
# give_item method ✓
# Gives x number of an item to another object. ✓
# receive_item method ✓
# Receives x number of an item from an object ✓
# Can only receive an item if it already exists in the hash ✓
# 3 attributes ✓

class Creature
  attr_reader :items, :name, :age, :catch_phrase

  def initialize(name="UNKNOWN", age=999, catch_phrase=nil)
    @name = name
    @age = age
    @catch_phrase = catch_phrase
    @items = {"Hammers" => 1, "Nails" => 13, "Band-aids" => 4}
  end

  # setters
  def name=(name)
    if name == ""
      raise "A blank name is not allowed."
    else
      @name = name.to_s
    end
  end
  
  def catch_phrase=(catch_phrase)
    if catch_phrase == ""
      raise "A blank catch phrase is not allowed."
    else
      @catch_phrase = catch_phrase.to_s
    end
  end

  def age=(age)
    if age.to_i < 1
      raise "Age has to be higher than 0"
    else
      @age = age.to_i
    end
  end

  def move
    "#{@name} is on the move!"
  end

  def speak
    if block_given?
      puts yield
    else
      puts "#{@name} says: #{@catch_phrase ? @catch_phrase : 'I\'m the best!'}"
    end
  end

  def give_item(item, number)
    unless @items[item]
      puts "#{item} does not exist, so it cannot be retrieved." 
      return false
    end
    if @items[item] >= number
      @items[item] -= number
      puts "#{number} #{item} have been given."
      return true
    else
      puts "There are not enough #{item} to be given."
      return false
    end
  end

  def receive_item(item, number)
    if @items[item] 
      @items[item] += number
      puts "#{number} #{item} have been added."
      return true
    else
      puts "#{item} does not exist, so it cannot be received."
      return false
    end
  end
end
