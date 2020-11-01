class AsciiArt
  def self.draw(number)
    result = ""
    (1..number).each do |i|
      result += " " * (number - i)
      result += "* " * i
      result += "\n"
    end

    (number-1).downto(1) do |i|
      result += " " * (number - i)
      result += "* " * i
      result += "\n"
    end

    result
  end
end
