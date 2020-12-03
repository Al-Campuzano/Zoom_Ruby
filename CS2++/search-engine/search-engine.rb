# search-engine.rb

require 'rubygems'
require 'json'

# get json string
s = File.read("products_small.json")

# parse and convert JSON to Ruby
products = JSON.parse(s)

word_map ||= {}

products.each do |product|
  product_name = product["name"]
  product_id = product["id"]
  product_name.split.each do |word|
    word_map[word.downcase] ||= []
    word_map[word.downcase] << product_id
  end
end

puts "Welcome to the text search engine"

loop do
  print "\nEnter a word to search (enter 'q' to exit): "
  user_input = gets.chomp.downcase
  puts 

  if user_input == "q"
    puts "Bye!"
    break
  end

  
  if user_input.split.size > 1
    results = nil
    user_input.split.each do |user_word|
      temp_results = word_map[user_word] || []
      results ||= temp_results
      results = results & temp_results
    end
  else
    results = word_map[user_input] || []
  end
  
  
  if results.size > 0
    puts "Found #{results.size} results: "
    results.each do |index|
      puts "#{products[index]["name"]}"
    end
  else
    puts "Did not find any results."
  end
end

