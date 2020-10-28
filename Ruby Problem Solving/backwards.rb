# write a Ruby program which accept the user's first and last name and print them in reverse order with a space between them.

print "Input your first and last name: "

names = gets.chomp

# take the string, split it into an array of words, reverse those, then rejoin
puts "Hello #{names.split(" ").reverse.join(" ")}"
