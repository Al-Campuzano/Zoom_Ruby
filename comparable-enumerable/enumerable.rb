# Code along pages 311-332 in Head First Ruby

class WordSplitter
  include Enumerable

  attr_accessor :string

  def each
    string.split(" ").each do |word|
      yield word
    end
  end
end

splitter = WordSplitter.new
splitter.string = "how do you do?"

p splitter.find_all { |x| x.include?("d") }
p splitter.reject { |x| x.include?("d") }
p splitter.map { |x| x.reverse }
p splitter.any? { |x| x.include?("e") }
p splitter.count
p splitter.first
p splitter.sort

p splitter.map { |x| x.capitalize }
p splitter.find { |x| x.include?("do") }
p splitter.group_by { |x| x.include?("do") }
p splitter.max_by { |x| x.length }
p splitter.to_a
