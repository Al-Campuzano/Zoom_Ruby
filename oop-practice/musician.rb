# Create a base class with the following specifications:
#
# Must have 3 attributes ✓
# Uses proper Encapsulation ✓
# Uses data validation for setting attributes ✓
# Contains an array ✓
# Has an initialization method ✓
# Contains 3 other methods
# Uses at least 1 block

class Musician
  def initialize(name = "Anonymous", years_experience = 0, active = true)
    @name = name
    @instruments = []
    @years_experience = years_experience
    @active = active
    puts "I'm a musician"
  end

  def name(name)
    raise "Name can't be blank" if name == ""
    @name = name
  end

  def add_experience
    @years_experience += 1
  end

  def active(value)
    @active = value ? true : false
    puts @active
  end

  def to_s
    "I'm a #{self.class}, my name is #{@name}. I have #{@years_experience} years of experience, and I am #{@active ? "" : "in"}active."
  end

  def perform
    @active = true
    if block_given?
      yield
    else
      puts "#{@name} is performing"
    end
  end

  def add_instrument(instrument)
    raise "That instrument is invalid" unless instrument.is_a? String
    @instruments << instrument
    puts "#{instrument} has been added."
  end

  def instruments
    if @instruments.length > 0
      puts @instruments
    else
      puts "There are no instruments listed."
    end
  end
end
