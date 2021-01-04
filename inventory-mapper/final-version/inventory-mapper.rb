class Product
  attr_reader :parts
  def calculate_total(parts_tally)
    totals = []
    parts.each do |id,value|
      totals.push(parts_tally[id] ? parts_tally[id]/value : 0)
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

class Chair < Product
  def initialize
    @parts = { "z"=>2 }
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

  def print_result(input_string, result_hash)
    output = "\"#{input_string}\" => {"
    result_hash.each do |product,value| 
      output += "\"#{product}\" : #{value}, "
    end
    output = output[0...-2] + "}"
    puts output
  end
end
