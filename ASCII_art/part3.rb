#Update your program so that it draws a triangle of asterisks that is centered.

print "Enter a number: "

height = gets.chomp.to_i

for num in 1..height 
  result = " " * (height - num)
  num.times do
    result += "* "
  end
  puts result
end
