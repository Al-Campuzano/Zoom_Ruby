# Write a Ruby program that given an integer number, rearranges its digits to create the largest number possible with those digits. 
# If a non-integer number is entered, it should reprompt the person again for a number until a number is entered.

# instantiate the input variable
input = nil

# keep asking for a number until one is provided
loop do
  print "Enter a number: "
  input = gets.chomp
  # if the user entered 0 or -0 then exit the progam
  # thus avoiding dividing by zero later on when we check if the number entered is positive or negative
  if input.eql?("-0") || input.eql?("0")
    puts input
    return
  end
  # this is how we check that the string entered is an actual integer
  # by converting the string to an int and then back to a string  
  # then checking that it has the same value as the original input
  break if input.to_i.to_s == input
end

num = input.to_i
# if positive then multiplier will be 1, if negative it will be -1
multiplier = num / num.abs
# array of characters that we can then use to find all combinations
num_arr = input.split("")

# if number is negative then remove the first item in the array because it will be the minus (-) sign
if multiplier == -1
  num_arr = num_arr.drop(1)
end

# get all the permutations from the chars in the array
permutations = num_arr.permutation.to_a
possible_options = []

# loop through the permutations and for those that don't start with zero join them into a string,
# convert them to an integer, multiply them by either 1 or -1 and add it to the options array
for p in permutations do
  unless p[0].eql?("0")
    possible_options.append(p.join("").to_i * multiplier)
  end
end

# output the largest number in the options array
puts possible_options.max
