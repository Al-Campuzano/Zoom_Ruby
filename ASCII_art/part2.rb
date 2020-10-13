# Update your program so that it outputs a triangle of asterisks that is aligned on the right side.

print "Enter a number: "

height = gets.chomp.to_i

for num in 1..height 
  puts (" " * (height - num)) + ("*" * num)
end
