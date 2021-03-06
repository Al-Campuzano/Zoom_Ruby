# Code along pages 311-332 in Head First Ruby

class Steak
  include Comparable

  attr_accessor :grade
  GRADE_SCORES = { "Prime" => 3, "Choice" => 2, "Select" => 1 }
  
  def <=>(other)
    # better way than what the book has written, i left the book code below for reference
    GRADE_SCORES[self.grade] <=> GRADE_SCORES[other.grade]
    # if GRADE_SCORES[self.grade] < GRADE_SCORES[other.grade]
    #   return -1
    # elsif GRADE_SCORES[self.grade] == GRADE_SCORES[other.grade]
    #   return 0
    # else
    #   return 1
    # end
  end
end

prime = Steak.new
prime.grade = "Prime"
choice = Steak.new
choice.grade = "Choice"
select = Steak.new
select.grade = "Select"

puts "prime > choice: #{prime > choice}"
puts "prime < select: #{prime < select}"
puts "select == select: #{select == select}"
puts "select <= select: #{select <= select}"
puts "select >= choice: #{select >= choice}"
print "choice.between?(select,prime): "
puts choice.between?(select, prime)
