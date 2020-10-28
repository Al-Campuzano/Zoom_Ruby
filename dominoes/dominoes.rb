#Under the class definition, write a method called swap_tops_and_bottoms, which will take in a list of dominoes and use the map method to return  new list ofa dominoes in the same order as the old one, but where the top and bottom values have been swapped. For example, if the first domino in the list is a 4-3, the first domino in the new list will be 3-4. In code at the bottom of the file, use each to display the modified set after the original set (but make sure it’s clear which is which in the printout). Make a commit.



class Domino
  attr_accessor :side_a, :side_b

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
  
  def self.build_set
    @max_pips = 6
    set = []

    (0..@max_pips).each do |a|
      (a..@max_pips).each do |b|
        set.push(Domino.new(a,b))
      end
    end
    set
  end

  def initialize(side_a, side_b)
    @side_a = side_a
    @side_b = side_b
  end

  def to_s
    return @@HORIZONTAL_LINE + @@TILES_HASH[@side_a] + 
      @@HORIZONTAL_LINE + @@TILES_HASH[@side_b] + @@HORIZONTAL_LINE + "\n"
  end
end

def swap_tops_and_bottoms(old_set)
  old_set.map do |tile|
    Domino.new(tile.side_b, tile.side_a)
  end
end

test_tile = Domino.new(6,4)

puts test_tile

puts "=== TESTING SET ==="

test_set = Domino.build_set

test_set.each { |tile| puts tile }

puts "=== AFTER SWAP ==="

swapped = swap_tops_and_bottoms(test_set)

swapped.each { |tile| puts tile }
