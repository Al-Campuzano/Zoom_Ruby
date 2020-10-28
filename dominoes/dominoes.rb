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

def find_dominoes_with(set, num)
set.find_all do |tile|
    tile.side_a == num || tile.side_b == num
  end
end

##### CODE FOR TESTING #####

puts "=== TESTING SET ==="

test_set = Domino.build_set

test_set.each { |tile| puts tile }

puts "=== AFTER SWAP ==="

swapped = swap_tops_and_bottoms(test_set)

swapped.each { |tile| puts tile }

puts "=== FINDING DOMINOES WITH 3 PIPS ==="

with_three = find_dominoes_with(test_set, 3)

with_three.each { |tile| puts tile }
