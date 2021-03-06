class Product
  def calculate_total(input)
    # TODO make these variables local, and use attr_reader for 'parts'
    @total = 0
    @temp_hash = Hash.new(0)
    @parts.each do |k,v|
      # TODO see about getting rid of this if to allow for zero values
      if input[k] && (input[k] / v) >= 1
        @temp_hash[k] = input[k] / v
      end
    end
    if @temp_hash.size == @parts.size
      @total = @temp_hash.values.min
    end
    @total
  end
end

class Shelf < Product
  def initialize
    @parts = { "a"=>1 }
  end
end

class Stool < Product
  def initialize
    @parts = { "b"=>1, "c"=>3 }
  end
end

class Table < Product
  def initialize
    @parts = { "d"=>1, "e"=>4 }
  end
end

class InventoryMapper
  # TODO pass in the list of products into initialize method
  
  def map(input="")
    products = [Shelf.new, Stool.new, Table.new]
    input_map = input.split("").tally
    results_map = Hash.new(0)

    products.each do |p|
      results_map[p.class.to_s] = p.calculate_total(input_map)
    end

    self.print_result(input, results_map)
  end

  private
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
