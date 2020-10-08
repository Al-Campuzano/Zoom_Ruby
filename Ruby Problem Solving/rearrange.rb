#write a Ruby program that given an integer number, rearranges its digits to create the largest number possible with those digits. 
#If a non-integer number is entered, it should reprompt the person again for a number until a number is entered.

# instantiate the number variable

num = nil

# keep asking for a number until one is provided
loop do
  print "Enter a number: "
  num = gets.chomp
  # puts num
  # puts num.to_i
  # this is how we check that the string entered is an actual integer
  # by converting the string to an int and then back to a string  
  # then checking that it has the same value as the original input
  break if num.to_i.to_s == num
end

# works only with positive numbers :/
puts num.split("").sort.join("").reverse
