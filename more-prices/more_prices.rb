# code along with Head First Ruby pages 162-165

<<<<<<< HEAD:more-prices/more_prices.rb
def total(prices)
  amount = 0
  prices.each do |price|
    amount += price
=======
# def total(prices)
#   amount = 0
#   index = 0
#   while index < prices.length
#     amount += prices[index]
#     index += 1
#   end
#   amount
# end

# def refund(prices)
#   amount, index = 0, 0
#   while index < prices.length
#     amount -= prices[index]
#     index += 1
#   end
#   amount
# end

# def show_discounts(prices)
#   index = 0
#   while index < prices.length
#     amount_off = prices[index] / 3.0
#     puts format("Your discount: $%.2f", amount_off)
#     index += 1
#   end
# end

def do_something_with_every_item(array, operation)
  if operation == "total" or operation == "refund"
    amount = 0
  end
  index = 0
  while index < array.length
    if operation == "total"
      amount += array[index]
    elsif operation == "refund"
      amount -= array[index]
    elsif operation == "show discounts"
      amount_off = array[index] / 3.0
      puts format("Your discount: $%.2f", amount_off)
    end
    index += 1
>>>>>>> main:prices/prices.rb
  end
  if operation == "total" or operation == "refund"
    return amount
  end
end

prices = [3.99, 25.00, 8.99]

# puts format("%.2f", total(prices))

<<<<<<< HEAD:more-prices/more_prices.rb
def refund(prices)
  amount = 0
  prices.each do |price|
    amount -= price
  end
  amount
end

puts format("%.2f", refund(prices))

def show_discounts(prices)
  prices.each do |price|
    amount_off = price / 3.0
    puts format("Your discount: $%.2f", amount_off)
  end
end
=======
# puts format("%.2f", refund(prices))

# show_discounts(prices)
>>>>>>> main:prices/prices.rb

puts format("%.2f", do_something_with_every_item(prices, "total"))
puts format("%.2f", do_something_with_every_item(prices, "refund"))
do_something_with_every_item(prices, "show discounts")
