# Write a TreasureMap class that stores a hash as per above. Add methods to add or remove food sources, water sources, or treasure to or from the map.

# Add a to_s method to TreasureMap that displays all the characters of the map. You will need to iterate the hash to find the bounds of the map first such that you know the upper-, bottom-, left-, and right-most coordinates of the food/water/treasure. Then you can print out the values to the screen, checking the hash as you go to see what to print at each coordinate.


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

  def width
    max = 0
    min = 0
    @map_hash.keys.each do |k|
      max = k[0] > max ? k[0] : max
      min = k[0] < min ? k[0] : min
    end
    @width = min.abs + 1 + max
  end

  def height
    max = 0
    min = 0
    @map_hash.keys.each do |k|
      max = k[1] > max ? k[1] : max
      min = k[1] < min ? k[1] : min
    end
    @height = min.abs + 1 + max
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


# F → (0,1)
# F → (11,0)
# W → (6,-2)
# X → (-1,-5)

map = TreasureMap.new
map.add_source([0,1], "F")
map.add_source([11,0], "F")
map.add_source([6,-2], "W")
map.add_source([-1,-5], "X")

# map.remove_source([0,1])
# map.add_source([1,4], "Z")
puts map.map_hash
puts map.width
puts map.height
puts map.top_bottom_left_right
puts map
