coins = {"toonie" => 200, "loonie" => 100, "quarter" => 25, "dime" => 10, "nickel" => 05}
test_value = 343
coins_back = {}
total_coins = 0

coins.each do |name, value|
  coins_to_add = test_value/value
  unless coins_to_add == 0
    total_coins += coins_to_add
    coins_back[name] = coins_to_add
  end
  test_value = test_value % value
end

if test_value > 2
  coins_back["nickel"] += 1
  total_coins += 1
end

# puts test_value
# puts total_coins
# print coins_back

respond_string = ""

coins_back.each_with_index do |(name, value), index|
  if index == coins_back.length - 1 
    respond_string += "and "
  end
  respond_string += "#{value} #{name}#{value > 1 ? "s" : ""}, "
end


puts "You need to dispense #{respond_string[0..-3]}."
puts "Total coins: #{total_coins}"
