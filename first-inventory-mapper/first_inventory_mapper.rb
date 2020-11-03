# Shelf:
# Each unit is considered complete
# Full unit: part ID = "a"

# Stool:
# For a stool to be complete, it requires 1 top and 3 legs
# Top: part ID = "b"
# Legs: part ID = "c"

# Table:
# For a table to be complete, it requires 1 top and 4 legs
# Top: part ID = "d"
# Legs: part ID = "e"

# "abccc" => {"Shelf" : 1, "Stool": 1, "Table": 0}
# "beceadee" => {"Shelf" : 1, "Stool": 0, "Table": 1}
# "eebeedebaceeceedeceacee" => {"Shelf" : 2, "Stool": 1, "Table": 2}
# "zabc" => {"Shelf" : 1, "Stool" : 0, "Table" : 0}
# "deeedeee" => {"Shelf" : 0, "Stool" : 0, "Table" : 1}

class InventoryMapper
  def initialize
    @shelves = @stools = @tables = 0
    @parts_map = { "a" => 1, "b" => 1, "c" => 3, "d" => 1, "e" => 4 }
  end

  def map(input)
    input_map = input.tally
    p input_map
  end
end

mapper = InventoryMapper.new
mapper.map("abccc")
