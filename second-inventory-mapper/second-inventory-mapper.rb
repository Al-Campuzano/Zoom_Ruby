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



class Product
  attr_reader :total
  
  def initialize
    @total = 0
    @parts = Hash.new(0)
  end

  def calculate_total(input)
    @total = 0
    @temp_hash = Hash.new(0)
    @parts.each do |k,v|
      if input[k] && (input[k] / v) >= 1
        @temp_hash[k] = input[k] / v
      end
    end
    if @temp_hash.size == @parts.size
      @total = @temp_hash.sort_by {|k,v| v}[0][1]
    end
    @total
  end
end

class Shelf < Product
  def initialize
    @total = 0
    @parts = { "a"=>1 }
  end
end

class Stool < Product
  def initialize
    @total = 0
    @parts = { "b"=>1, "c"=>3 }
  end
end

class Table < Product
  def initialize
    @total = 0
    @parts = { "d"=>1, "e"=>4 }
  end
end


# "abccc" => {"Shelf" : 1, "Stool": 1, "Table": 0}
# "beceadee" => {"Shelf" : 1, "Stool": 0, "Table": 1}
# "eebeedebaceeceedeceacee" => {"Shelf" : 2, "Stool": 1, "Table": 2}
# "zabc" => {"Shelf" : 1, "Stool" : 0, "Table" : 0}
# "deeedeee" => {"Shelf" : 0, "Stool" : 0, "Table" : 1}

input = "abbbbccc".split("").tally
prod = Product.new
print prod.calculate_total(input)
