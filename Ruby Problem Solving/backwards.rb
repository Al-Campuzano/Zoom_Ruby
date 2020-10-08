print "Input your first and last name: "

names = gets.chomp

puts "Hello #{names.split(" ").reverse.join(" ")}"
