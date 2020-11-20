# discounts-system.rb

module Grapes
  @price_cents = 500
  
  def self.apply_discounts(quantity)
    (quantity/2.0).round * @price_cents
  end
end

module Apples
  @price_cents = 300
  
  def self.apply_discounts(quantity)
    if quantity >= 2
      @price_cents * quantity * 0.8
    else
      @price_cents
    end
  end
end

module Peaches
  @price_cents = 700

  def self.apply_discounts(quantity)
    @price_cents * quantity
  end
end


# peach = Peach.new
puts Peaches.apply_discounts(2)

# apple = Apple.new
puts Apples.apply_discounts(10)

# grape = Grape.new
puts Grapes.apply_discounts(4)

# puts Kernel.const_get("peach".capitalize)
# puts Object.const_set("Grape", Class.new).apply_discounts(2)

# puts Testing.apply_discounts(2)
# puts Kernel.const_get("testing".capitalize).apply_discounts(2)
