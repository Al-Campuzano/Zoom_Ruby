coins = {"toonie" => 200, "loonie" => 100, "quarter" => 25, "dime" => 10, "nickel" => 05}
test_value = 410
coins_back = {}
total_coins = 0

coins.each do |name, value|
  coins_to_add = test_value/value
  total_coins += coins_to_add
  coins_back[name] = coins_to_add
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

coins_back.each do |name, value|
  if value > 0
    respond_string += "#{value} #{name}#{value > 1 ? "s" : ""}, "
  end
end

respond_string = respond_string.split(",")
respond_string[-2] = " and#{respond_string[-2]}"
respond_string = respond_string.join(",")

puts "You need to dispense #{respond_string[0..-3]}."
puts "Total coins: #{total_coins}"
