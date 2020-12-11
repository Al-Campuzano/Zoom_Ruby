def calculate_results(cents)
  coins = {"toonie" => 200, "loonie" => 100, "quarter" => 25, "dime" => 10, "nickel" => 05}
  coins_back = {}

  coins.each do |name, value|
    coins_to_add = cents/value
    unless coins_to_add == 0
      coins_back[name] = coins_to_add
    end
    cents = cents % value
  end

  if cents > 2
    coins_back["nickel"] ? coins_back["nickel"] += 1 : coins_back["nickel"] = 1
  end

  coins_back
end

def build_response(coins_hash)
  return "You don't need to dispense change." if coins_hash.length == 0

  respond_string = ""

  coins_hash.each_with_index do |(name, value), index|
    if (index == coins_hash.length - 1 && coins_hash.length > 1)
      respond_string += "and "
    end
    respond_string += "#{value} #{name}#{value > 1 ? "s" : ""}, "
  end
  
  "You need to dispense #{respond_string[0..-3]}.\nTotal coins: #{coins_hash.values.sum}"
end

user_input = ""

loop do
  print "How much change is owed? "
  user_input = gets.chomp
  break if user_input.to_f > 0
end

result = calculate_results((user_input.to_f * 100).round)

puts build_response(result)

