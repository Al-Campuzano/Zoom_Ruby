# discounts-system.rb

class Grape
  def initialize(price_cents: 500)
    @price_cents = price_cents
  end

  def apply_discounts(quantity)
    (quantity/2.0).round * @price_cents
  end
end

class Apple
  def initialize(price_cents: 300)
    @price_cents = price_cents
  end

  def apply_discounts(quantity)
    if quantity >= 2
      @price_cents * quantity * 0.8
    else
      @price_cents
    end
  end
end

class Peach
  def initialize(price_cents: 700)
    @price_cents = price_cents
  end

  def apply_discounts(quantity)
    @price_cents * quantity
  end
end


peach = Peach.new
puts peach.apply_discounts(2)

apple = Apple.new
puts apple.apply_discounts(10)

grape = Grape.new
puts grape.apply_discounts(4)
