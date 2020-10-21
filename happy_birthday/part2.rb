print "What is your name? "

name = gets.chomp
hbd_string = "Happy birthday"

counter = 1
while counter <= 4
  print "#{hbd_string} "
  if counter == 3
    print "dear #{name}\n"
  elsif counter == 4 
    print "to you.\n"
  else
    print "to you\n"
  end
  counter += 1
end
