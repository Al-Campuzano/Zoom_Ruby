# Update your program so that it draws a diamond of asterisks that is centered, 
# with a maximum width of the entered number.

def print_line(height, num)
  result = " " * (height - num)
  num.times do
    result += "* "
  end
  puts result
end

print "Enter a number: "

height = gets.chomp.to_i

for num in 1..height 
  print_line(height, num)
end

for num in (height-1).downto(1)
  print_line(height, num)
end
