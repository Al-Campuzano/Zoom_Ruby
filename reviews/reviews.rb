# Get the file contents

lines = []

File.open("reviews.txt") do |review_file|
  lines = review_file.readlines
end

puts lines.length
