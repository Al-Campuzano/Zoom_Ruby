# histogram of text
# puts [1, 1, 2].tally

class Textogram
  def initialize(text)
    @text = text
    @histogram = Hash.new(0)
  end

  def make_histogram(case_sensitive=true, special_chars=true)
    text_arr = @text.split.join("").split("")
    text_arr = text_arr.select { |c| c.downcase != c.upcase } unless special_chars
    text_arr = text_arr.map { |c| c.downcase } unless case_sensitive
    
    @histogram = text_arr.tally
  end

  def histogram
    @histogram
  end

  def to_s
    result = ""
    @histogram.sort.each do |c|
      result += "#{c[0]} #{'*' * c[1]}\n"
    end
    result
  end
end

text = Textogram.new("HELLO, world!")
text.make_histogram(false,true)
puts text

# p histogram.sort
