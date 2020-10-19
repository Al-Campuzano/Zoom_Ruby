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
