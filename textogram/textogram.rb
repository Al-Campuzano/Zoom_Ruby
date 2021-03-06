# histogram of text
# puts [1, 1, 2].tally

class Textogram
  def initialize(text)
    @text = text
    @histogram = Hash.new(0)
  end

  def make_letter_histogram(case_sensitive=true, special_chars=true)
    text_arr = @text.split.join("").split("")
    text_arr = text_arr.select { |c| c.downcase != c.upcase } unless special_chars
    text_arr = text_arr.map { |c| c.downcase } unless case_sensitive
    
    @histogram = text_arr.tally
  end

  def make_word_histogram
    # split string into words, then downcase all except "I"
    text_arr = @text.split.map do |word| 
      if word != "I"
        word.downcase
      else
        word
      end
    end
    # split each word into array of characters, remove special characters, then rejoin
    clean_arr = text_arr.map do |word|
      word.split("").select do |c| 
        c.downcase != c.upcase 
      end.join("")
    end
    # only select items from array that are not empty and tally
    @histogram = clean_arr.select { |word| word.length > 0 }.tally
  end

  def histogram
    @histogram
  end

  def to_s
    result = ""
    @histogram.sort.each do |c|
      if @histogram.size > 100
        result += "#{c[0]}\t#{c[1]}\n"
      else
        result += "#{c[0]}\t#{'*' * c[1]}\n"
      end
    end
    result
  end
end

puts "Letter histogram".upcase
puts "\n=== HELLO, world! 2 u 2 ==="
text = Textogram.new("HELLO, world! 2 u 2")

text.make_letter_histogram
puts "case sensitive, with special characters"
puts text
text.make_letter_histogram(false,false)
puts "case insensitive, no special characters"
puts text
text.make_letter_histogram(true,false)
puts "case sensitive, no special characters"
puts text
text.make_letter_histogram(false,true)
puts "case insensitive, with special characters"
puts text

puts "\n=== (empty) ==="
empty = Textogram.new("     ")
empty.make_letter_histogram
puts "case sensitive, with special characters"
puts empty
empty.make_letter_histogram(false, false)
puts "case insensitive, no special characters"
puts empty
empty.make_letter_histogram(true, false)
puts "case sensitive, no special characters"
puts empty
empty.make_letter_histogram(false, true)
puts "case insensitive, with special characters"
puts empty

puts "\n=== Was ist ein Prokoptôn? ==="
german = Textogram.new("    Was ist   ein Prokoptôn ?    ")
german.make_letter_histogram
puts "case sensitive, with special characters"
puts german
german.make_letter_histogram(false, false)
puts "case insensitive, no special characters"
puts german
german.make_letter_histogram(true, false)
puts "case sensitive, no special characters"
puts german
german.make_letter_histogram(false, true)
puts "case insensitive, with special characters"
puts german

puts "\n=== WORD HISTOGRAM ==="

text.make_word_histogram
puts text
puts "\n=== GERMAN ==="
german.make_word_histogram
puts german
puts "\n=== HELLO he'llo A I world World 2 u 2 ==="
repeats = Textogram.new("HELLO he'llo A I world World 2 u 2")
repeats.make_word_histogram
puts repeats

puts "Press enter to continue to reading file part:"
gets

puts "\n=== READING FILE ==="
file_text = ""

File.open("anthem.txt").each do |line|
  file_text += line unless line == "\n"
end

from_file = Textogram.new(file_text) 
from_file.make_word_histogram

puts from_file
