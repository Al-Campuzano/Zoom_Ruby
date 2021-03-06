class InventoryMapper
  def initialize
    @shelves = @stools = @tables = 0
    @parts_map = { "a" => 1, "b" => 1, "c" => 3, "d" => 1, "e" => 4 }
  end
  
  def map(input="")
    @shelves = @stools = @tables = 0
    @input_map = input.split("").tally
    self.find_shelves if @input_map.has_key?("a")
    self.find_stools if @input_map["b"] && @input_map["c"]
    self.find_tables if @input_map["d"] && @input_map["e"]
    
    result = { "Shelf" => @shelves, "Stool" => @stools, "Table" => @tables }
    self.print_result(input,result)
  end
  
  private 
  def find_shelves
    while @input_map["a"] >= 1
      @input_map["a"] -= 1
      @shelves += 1
    end
  end
  
  def find_stools
    while @input_map["b"] >= 1 && @input_map["c"] >= 3
      @input_map["b"] -= 1
      @input_map["c"] -= 3
      @stools += 1
    end
  end
  
  def find_tables
    while @input_map["d"] >= 1 && @input_map["e"] >= 4
      @input_map["d"] -= 1
      @input_map["e"] -= 4
      @tables += 1
    end
  end

  def print_result(input, result)
    output = "\"#{input}\" => {"
    result.each do |k,v| 
      output += "\"#{k}\" : #{v}, "
    end
    output = output[0...-2] + "}"
    puts output
  end
end

# "abccc" => {"Shelf" : 1, "Stool": 1, "Table": 0}
# "beceadee" => {"Shelf" : 1, "Stool": 0, "Table": 1}
# "eebeedebaceeceedeceacee" => {"Shelf" : 2, "Stool": 1, "Table": 2}
# "zabc" => {"Shelf" : 1, "Stool" : 0, "Table" : 0}
# "deeedeee" => {"Shelf" : 0, "Stool" : 0, "Table" : 1}

mapper = InventoryMapper.new
mapper.map("abccc")
mapper.map("beceadee")
mapper.map("eebeedebaceeceedeceacee")
mapper.map("zabc")
mapper.map("deeedeee")
mapper.map("zzzz!4")
mapper.map("")
mapper.map

