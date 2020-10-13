# Write a Ruby program that prompts a person to enter a number, 
# and then outputs a triangle of asterisks of that height and length.

print "Enter a number: "

height = gets.chomp.to_i

for num in 1..height 
  puts "*" * num
end
