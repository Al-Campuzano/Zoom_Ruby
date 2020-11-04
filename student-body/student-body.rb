# In this exercise, you will create a class that mixes in Enumerable.
#
# Implement an each method in StudentBody. It should yield to a block for every student in the school. The idea is that the methods that come with Enumerable, such as map, will use each to accomplish their tasks, so the block we are talking about here is an arbitrary one that is passed in through those methods, or by someone directly using each on your class.
#
# Write Minitest tests to check that your class behaves correctly. Be sure to cover one case in each test, and to cover as many cases as possible.

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

sb = StudentBody.new

sb.each { |x| puts x }
p sb.find_all { |x| x.include?("on")}
p sb.count
p sb.first
p sb.sort
p sb.sort.last
p sb.reject { |x| x.downcase.include?("a") }
short = StudentBody.new({ grade8: ["Claudio", "Mic"] })
p short.map { |x| x.reverse }
