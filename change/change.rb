coin_values_cents = [200,100,25,10,05]

test_value = 343
coins_back = []
sum = 0

coin_values_cents.each do |coin|
  coins_to_add = test_value/coin
  sum += coins_to_add
  coins_back << coins_to_add
  test_value = test_value % coin
end

if test_value > 2
  coins_back[-1] += 1
  sum += 1
end

puts test_value
puts sum
print coins_back
