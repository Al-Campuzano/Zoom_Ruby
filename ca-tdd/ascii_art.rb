# draw a diamond of asterisks that is centered, 
# with a maximum width of the passed number.
# You will need to design your code using TDD. To help with testing your code, be sure to create an AsciiArt class with a draw(number) method that returns a string that is correctly formatted so that it could be used with puts to draw the desired shape.

#  *
# * *
#  *

class AsciiArt
  def self.draw(number)
    # " * \n* * \n * \n"
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

# puts AsciiArt.draw(1)
