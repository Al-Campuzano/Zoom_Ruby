# Get the file contents

lines = []

File.open("reviews.txt") do |review_file|
  lines = review_file.readlines
end

puts lines.length

# Find reviews for the current movie

relevant_lines = lines.find_all { |line| line.include?("Truncated") }

puts relevant_lines
puts relevant_lines.length

# Discard reviewer bylines

reviews = relevant_lines.reject { |line| line.include?("--") }

puts reviews
puts reviews.length

# Find an adjective within each review

def find_adjective(string)
  words = string.split(" ")
  index = words.find_index("is")
  words[index + 1]
end

adjectives = []

reviews.each do |review|
  adjectives << find_adjective(review)
end

puts adjectives
