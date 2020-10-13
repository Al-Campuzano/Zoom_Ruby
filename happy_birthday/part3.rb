print "What is your name? "

name = gets.chomp

hbd_string = "Happy birthday"
result_string = ""

counter = 1
until counter > 4
  result_string += "#{hbd_string} "
  case counter
  when 4
    result_string += "to you."
  when 3
    result_string += "dear #{name}\n"
  else
    result_string += "to you\n"
  end
  counter += 1
end

puts result_string
