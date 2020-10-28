# write a Ruby program to find the maximum of two numbers. If something other than a number is entered, 
# it should prompt the person again for the number until a number is entered.

# instantiate first and second number variables

first_num = nil
second_num = nil

# keep asking for a number until one is provided
loop do
  print "Enter a number: "
  first_num = gets.chomp
  # this is how we check that the string entered is an actual integer
  # by converting the string to an int and then back to a string  
  # then checking that it has the same value as the original input
  break if first_num.to_i.to_s == first_num
end

loop do
  print "Enter another number: "
  second_num = gets.chomp
  break if second_num.to_i.to_s == second_num
end

# use the .max method for arrays to easily return the max of the two values
puts "Max: #{[first_num, second_num].max}"
