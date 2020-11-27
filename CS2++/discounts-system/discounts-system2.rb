# second attempt, trying to make it more scalable

# [ ['grapes', 1], ['apples', 0], ['peaches', 1] ] -> 12

PRODUCT_DISCOUNT_SETTINGS = {
  discounted_products: ["apples"],
  discount_threshold: 2,
  discount_type: :percent,
  discount_amount: 20
}

PRODUCT_PRICES_CENTS = {
  grapes: 500,
  apples: 300,
  peaches: 700
}

class DiscountCalculator
  def self.calculate_discount(item)
    puts "DiscountCalculator #{PRODUCT_PRICES_CENTS[item[0].to_sym]}"
    0
  end
end

class PriceCalculator
  def self.calculate_price(item, prices, discounts)
    prices[item[0].to_sym] * item[1] - DiscountCalculator.calculate_discount(item)
  end
end

class Checkout
  def initialize(items_arr)
    @items = items_arr
  end

  def self.calculate_total_price(items_arr)
    total_cents = 0
    items_arr.each do |item|
      total_cents += PriceCalculator.calculate_price(item, PRODUCT_PRICES_CENTS, PRODUCT_DISCOUNT_SETTINGS)
    end
    total_cents/100
  end
end


puts Checkout.calculate_total_price([ ['grapes', 1], ['apples', 0], ['peaches', 1] ])
