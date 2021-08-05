class StudentBody
  include Enumerable

  def initialize(classes=nil)
    @classes = classes || { 
      grade1: ["Billy", "Susie", "Lara", "Oli", "Alex"],
      grade2: ["Sarah", "Steven", "Alison", "Jose", "Roxy"],
      grade3: ["Kiko", "Fiona", "Garth", "Michelle", "Neal"],
      grade4: ["Jen", "Hiro", "Luna", "Glyndon", "Scarlet"]
    }
  end

  def classes=(classes)
    @classes = classes
  end
  
  def classes
    @classes
  end

  def each
    @classes.each_value do |students|
      students.each { |student| yield student }
    end
  end
end
