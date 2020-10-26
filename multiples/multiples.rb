# Write a method called customized_list_of_multiples that has a parameter called multiples_of and size. Inside the method, create a list with a maximum length of size. Then, if a block is given (hint: see block_given?), yield to that block passing in the list you created. The method should either return whatever the block returned, or the list of multiples you created if there was no block. Make a commit.


def customized_list_of_multiples(multiples_of, size)
  multi_list = (1..size).to_a.map { |x| x * multiples_of }
  if block_given?
    yield(multi_list)
  else
    multi_list
  end
end

puts "No blocks: #{customized_list_of_multiples(3, 5)}"

puts "Print list twice using a block: "
print customized_list_of_multiples(3, 5) { |x| x * 2 }

puts "\nMap through list and double each value: "
print customized_list_of_multiples(3,5) { |x| x.map { |a| a * 2 } }
