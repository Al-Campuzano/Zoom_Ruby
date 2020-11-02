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
    text_arr = @text.split.map do |word| 
      if word != "I"
        word.downcase
      else
        word
      end
    end
    clean_arr = text_arr.map do |word|
      word.split("").select { |c| c.downcase != c.upcase }.join("")
    end
    @histogram = clean_arr.select { |word| word.length > 0 }.tally
  end

  def histogram
    @histogram
  end

  def to_s
    result = ""
    @histogram.sort.each do |c|
      result += "#{c[0]}\t#{'*' * c[1]}\n"
    end
    result
  end
end

puts "Letter histogram".upcase
puts "\n=== HELLO, world! ==="
text = Textogram.new("HELLO, world!")

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

puts "=== WORD HISTOGRAM ==="

text.make_word_histogram
puts text
puts "=== GERMAN ==="
german.make_word_histogram
puts german
puts "=== HELLO hello A I world World ==="
repeats = Textogram.new("HELLO hello A I world World")
repeats.make_word_histogram
puts repeats
