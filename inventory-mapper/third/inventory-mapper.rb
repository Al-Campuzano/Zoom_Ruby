class Product
  attr_reader :parts
  def calculate_total(input)
    totals = []
    parts.each do |k,v|
      input[k] ? totals.push(input[k]/v) : 0
    end
    totals.min || 0
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
  attr_reader :products

  def initialize(product_list=[Shelf.new, Stool.new, Table.new])
    @products = product_list
  end
  
  def map(input="")
    input_map = input.split("").tally
    results_map = build_results(input_map)
    print_result(input, results_map)
  end
  
  private
  def build_results(parts_tally)
    result = Hash.new(0)
    products.each do |p|
      result[p.class.to_s] = p.calculate_total(parts_tally)
    end
    result
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

# mapper = InventoryMapper.new
# mapper.map("abccc")
# mapper.map("beceadee")
# mapper.map("eebeedebaceeceedeceacee")
# mapper.map("zabc")
# mapper.map("deeedeee")
# mapper.map("?#@!4")
# mapper.map("")
# mapper.map
