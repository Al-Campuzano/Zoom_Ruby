def verse(number=0)
  while number > 0
    bottle_str = number > 1 ? "bottles" : "bottle"
    puts "#{number} #{bottle_str} of beer on the wall,"
    puts "#{number} #{bottle_str} of beer."
    puts "Take one down and pass it around,"
    if number > 1
      puts "#{number-1} bottle#{number-1 > 1 ? "s": ""} of beer on the wall."
    else
      puts "no more bottles of beer on the wall." 
    end
    puts ""
    number -= 1
  end
  puts "No more bottles of beer on the wall, \nno more bottles of beer. \nGo to the store and buy some more, \n99 bottles of beer on the wall."
end

print "How many bottles are on the wall? "
input = gets.to_i

verse(input)

