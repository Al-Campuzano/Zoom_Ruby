# In a class method, create and return an array containing a double-six set of dominoes (Links to an external site.). The dominoes can be in any order. In code at the bottom of the file, use each to display the entire set to check that your code works.

class Domino
  @@TILES_HASH = {
    0 => "|   |\n|   |\n|   |\n",
    1 => "|   |\n| * |\n|   |\n",
    2 => "|*  |\n|   |\n|  *|\n",
    3 => "|*  |\n| * |\n|  *|\n",
    4 => "|* *|\n|   |\n|* *|\n",
    5 => "|* *|\n| * |\n|* *|\n",
    6 => "|* *|\n|* *|\n|* *|\n"  
  }

  @@HORIZONTAL_LINE = " ---\n"

  def initialize(side_a, side_b)
    @side_a = side_a
    @side_b = side_b
  end

  def to_s
    return @@HORIZONTAL_LINE + @@TILES_HASH[@side_a] + 
      @@HORIZONTAL_LINE + @@TILES_HASH[@side_b] + @@HORIZONTAL_LINE + "\n"
  end
end

test_tile = Domino.new(6,4)

puts test_tile
