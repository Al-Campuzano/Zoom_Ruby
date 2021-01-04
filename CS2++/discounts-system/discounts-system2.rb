# second attempt, trying to make it more scalable

PRODUCT_DISCOUNT_SETTINGS = [ 
  {
    discounted_products: ["apples"],
    discount_threshold: 2,
    discount_type: "percent",
    discount_amount: 20
  },
  {
    discounted_products: ["grapes"],
    discount_threshold: 1,
    discount_type: "bogo",
    quantity_to_discount: 1 
  }
]

PRODUCT_PRICES_CENTS = {
  grapes: 500,
  apples: 300,
  peaches: 700
}

class DiscountCalculator
  def self.calculate_discount(name:, quantity:, full_total:)
    discount_amount = 0
    PRODUCT_DISCOUNT_SETTINGS.each do |setting|
      if setting[:discounted_products].include?(name) && quantity >= setting[:discount_threshold]
        type = setting[:discount_type]
        if type == "percent"
          discount_amount = full_total * (setting[:discount_amount]/100.0)
        elsif type == "dollar"
          discount_amount = setting[:discount_amount] * 100
        elsif type == "bogo"
          discount_amount = quantity / (setting[:discount_threshold] + setting[:quantity_to_discount]) * (full_total/quantity)
        end
      end
    end
    discount_amount
  end
end

class PriceCalculator
  def self.calculate_price(name:, quantity:)
    full_total_cents = PRODUCT_PRICES_CENTS[name.to_sym] * quantity 
    full_total_cents - DiscountCalculator.calculate_discount(name: name, quantity: quantity, full_total: full_total_cents)
  end
end

class Checkout
  def initialize(items_arr)
    @items = items_arr
  end

  def self.calculate_total_price(items_arr)
    total_cents = 0
    items_arr.each do |item|
      product_name = item[0]
      product_quantity = item[1]
      total_cents += PriceCalculator.calculate_price(name: product_name, quantity: product_quantity)
    end
    total_cents/100
  end
end


puts Checkout.calculate_total_price([ ['grapes', 1], ['apples', 0], ['peaches', 1] ]) # output => 12
puts Checkout.calculate_total_price([ ['grapes', 1], ['apples', 1], ['peaches', 1] ]) # output => 15
puts Checkout.calculate_total_price([ ['grapes', 2], ['apples', 2], ['peaches', 1] ]) # output => 16.8
puts Checkout.calculate_total_price([ ['grapes', 3], ['apples', 5], ['peaches', 2] ]) # output => 36
puts Checkout.calculate_total_price([ ['peaches', 7], ['grapes', 7], ['apples', 7] ]) # output => 85.8
