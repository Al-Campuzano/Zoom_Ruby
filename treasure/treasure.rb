class TreasureMap
  attr_reader :map_hash
  
  def initialize
    @map_hash = Hash.new(".")
  end
  
  def add_source(coord, source)
    raise "That is not a valid source" unless ["F", "W", "X"].include?(source)
    @map_hash[coord] = source
  end
  
  def remove_source(coord)
    raise "Those are not valid coordinates" if @map_hash[coord] == "."
    @map_hash[coord] = "."
  end

  def top_bottom_left_right
    max_width = min_width = max_height = min_height = 0
    @map_hash.keys.each do |k|
      max_width = k[0] > max_width ? k[0] : max_width
      min_width = k[0] < min_width ? k[0] : min_width
      max_height = k[1] > max_height ? k[1] : max_height
      min_height = k[1] < min_height ? k[1] : min_height
    end
    { min_width: min_width, max_width: max_width, min_height: min_height, max_height: max_height }
  end

  def to_s
    dimensions_hash = self.top_bottom_left_right
    result = ""
    dimensions_hash[:max_height].downto(dimensions_hash[:min_height]) do |y|
      (dimensions_hash[:min_width]..dimensions_hash[:max_width]).each do |x|
        result += @map_hash[[x,y]]
      end
      result += "\n"
    end
    result
  end
end

map = TreasureMap.new
map.add_source([0,1], "F")
map.add_source([11,0], "F")
map.add_source([6,-2], "W")
map.add_source([-1,-5], "X")

# these calls would result in exception errors
# map.remove_source([0,1])
# map.add_source([1,4], "Z")
puts map.map_hash
puts map

map2 = TreasureMap.new
puts "EMPTY"
puts map2

puts "RANDOM"
map2.add_source([rand(-10..10), rand(-10..10)], "F")
map2.add_source([rand(-10..10), rand(-10..10)], "W")
map2.add_source([rand(-10..10), rand(-10..10)], "W")
map2.add_source([rand(-10..10), rand(-10..10)], "X")
puts map2.map_hash
puts map2
