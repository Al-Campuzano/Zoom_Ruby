# Define a class that represents information about a single domino (Links to an external site.), including a to_s method to display the domino using asterisks (*) and any other characters needed, displaying them similar to how real dominoes would be laid out.

class Domino
  @@tiles_hash = {
    0 => "|   |\n|   |\n|   |\n",
    1 => "|   |\n| * |\n|   |\n",
    2 => "|*  |\n|   |\n|  *|\n",
    3 => "|*  |\n| * |\n|  *|\n",
    4 => "|* *|\n|   |\n|* *|\n",
    5 => "|* *|\n| * |\n|* *|\n",
    6 => "|* *|\n|* *|\n|* *|\n"  
  }

  @@horizontal_line = " ---\n"

  def initialize(side_a, side_b)
    @side_a = side_a
    @side_b = side_b
  end

  def to_s
    return @@horizontal_line + @@tiles_hash[@side_a] + @@horizontal_line + @@tiles_hash[@side_b] + @@horizontal_line
  end
end

test_tile = Domino.new(1,4)

puts test_tile
