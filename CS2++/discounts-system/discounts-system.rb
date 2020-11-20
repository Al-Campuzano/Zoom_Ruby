# discounts-system.rb

class Fruit
  @price_cents = 100

  def self.apply_discounts(quantity)
    @price_cents * quantity
  end
end

class Grapes < Fruit
  @price_cents = 500
  
  def self.apply_discounts(quantity)
    (quantity/2.0).round * @price_cents
  end
end

class Apples < Fruit
  @price_cents = 300
  
  def self.apply_discounts(quantity)
    quantity >= 2 ? super * 0.8 : super
  end
end

class Peaches < Fruit
  @price_cents = 700
end

def calculate_total_price(cart)
  total = 0
  cart.each do |item|
    total += Kernel.const_get(item[0].capitalize).apply_discounts(item[1])
  end
  total/100
end

puts calculate_total_price([ ['grapes', 1], ['apples', 0], ['peaches', 1] ]) # 12
puts calculate_total_price([ ['grapes', 1], ['apples', 1], ['peaches', 1] ]) # 15
puts calculate_total_price([ ['grapes', 2], ['apples', 2], ['peaches', 1] ]) # 16.8
puts calculate_total_price([ ['grapes', 3], ['apples', 5], ['peaches', 2] ]) # 36
puts calculate_total_price([ ['peaches', 7], ['grapes', 7], ['apples', 7] ]) # 85.8
