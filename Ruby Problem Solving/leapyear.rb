# write a Ruby program which accept the a year from the user and determines if that year is a leap year or not. 
# If they user enters anything other then a valid year, the application should re-prompt the user for to enter a valid year.

# instantiate the input variable
input = nil

# keep asking for a number until one is provided
loop do
  print "Enter a year: "
  input = gets.chomp
  
  # this is how we check that the string entered is an actual integer
  # by converting the string to an int and then back to a string  
  # then checking that it has the same value as the original input
  if (input.to_i.to_s == input && input.to_i > 0)
    break
  else
    puts "#{input} is not a valid year"
  end
end

year_num = input.to_i

# a leap year is one that is divisible by 4, but not divisible by 100, unless it is divisible by 400
if ((year_num % 4 == 0 && !(year_num % 100 == 0)) || year_num % 400 == 0)
  puts "#{input} is a leap year"
else
  puts "#{input} is not a leap year"
end
