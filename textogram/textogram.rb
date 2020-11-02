# histogram of text
# puts [1, 1, 2].tally

class Textogram
  def initialize(text)
    @text = text
    @histogram = Hash.new(0)
  end

  def make_histogram(case_sensitive=true, only_alphanum=false)
    text_arr = @text.split.join("").split("")
    text_arr = text_arr.select { |c| c.downcase != c.upcase } if only_alphanum
    text_arr = text_arr.map { |c| c.downcase } unless case_sensitive
    
    @histogram = text_arr.tally
  end
end

text = Textogram.new("HELLO, world!")
histogram = x.make_histogram


p histogram
