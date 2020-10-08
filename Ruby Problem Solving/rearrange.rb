#write a Ruby program that given an integer number, rearranges its digits to create the largest number possible with those digits. 
#If a non-integer number is entered, it should reprompt the person again for a number until a number is entered.

# instantiate the input variable
input = nil

# keep asking for a number until one is provided
loop do
  print "Enter a number: "
  input = gets.chomp
  # puts num
  # puts num.to_i
  # this is how we check that the string entered is an actual integer
  # by converting the string to an int and then back to a string  
  # then checking that it has the same value as the original input
  break if input.to_i.to_s == input
end

# crappy way, does not work if input is -105
if num.to_i >= 0
  puts num.split("").sort.join("").reverse
else
  puts "-#{num.split("").drop(1).sort.join("")}"  
end

# new idea

# num = input.to_i
# multiplier = num / num.abs
# num_arr = input.split("")
# possible = []

# if multiplier == -1
#   num_arr = num_arr.drop(1)
# end

# num_arr.each_index do |a|
#   num_arr.each_index do |b|
#     next if a == b || num_arr[a].eql?("0")
#     possible.append()
#   end
# end


# puts input
# puts num
# puts multiplier
# puts num_arr
# puts num_arr[0].class
# puts result.join("").to_i * multiplier

