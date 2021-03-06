class Musician
  include Enumerable

  def initialize(name = "Anonymous", years_experience = 0, active = false)
    @name = name
    @instruments = []
    @years_experience = years_experience
    @active = active
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
  end

  def to_s
    "I'm a #{self.class}, my name is #{@name}. I have #{@years_experience} years of experience, and I am #{@active ? "" : "in"}active."
  end

  def perform
    @active = true
    puts "#{@name} is performing"
  end

  def add_instrument(instrument)
    raise "That instrument is invalid" unless instrument.is_a? String
    @instruments << instrument
    puts "#{instrument} has been added."
  end
  
  def remove_instrument(instrument)
    raise "That instrument is invalid" unless instrument.is_a? String
    @instruments.delete(instrument)
    puts "#{instrument} has been removed."
  end

  def instruments
    if @instruments.length > 0
      if block_given?
        yield @instruments
      else
        puts "#{@name} plays: "
        puts @instruments
      end
    else
      puts "There are no instruments listed."
    end
  end
end
