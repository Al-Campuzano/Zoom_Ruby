# Create a code-cracking game that randomly generates a 4 digit code, where each digit has the value of 1-6. 
# A person will attempt to crack the code by making guesses, and the program will give the person hints about whether the digits are correct or not.

# For each digit that is in the right place, it will be output an X. For each digit that is in the code, but is in the wrong place, it will output an x. 
# All X’s will be output before x’s.

# The game will keep track of the number of guesses the person has made, and will end when the code is guessed.

puts "MASTERMIND"

# generate random 4-digit code with digits from 1 to 6
limit = 6
r_code = ""
4.times do
  r_code += (rand(limit) + 1 ).to_s
end
# puts r_code

counter = 1
loop do
  print "[#{counter}] Enter your guess: "
  u_guess = gets.chomp

  # check that input string is exactly 4 characters, is a number, the first character is not a minus sign, and no digit is larger than 6 or less than 1
  if (u_guess.length == 4 && u_guess.to_i.to_s == u_guess && !u_guess[0].eql?("-") && !u_guess.split("").any?{|n| n.to_i > limit || n.to_i < 1})
    if (u_guess.eql?(r_code))
      puts u_guess
      guess_str = "guess"
      counter > 1 ? guess_str += "es." : guess_str += "." 
      puts "Nice work! You took #{counter} #{guess_str}"
      break
    else
      counter += 1
      output = ""
      code_copy = r_code.clone
      u_guess.each_char.with_index { |c,i|
        if r_code[i].eql?(u_guess[i])
          code_copy[code_copy.index(c)] = ""
          # puts "Copy: #{code_copy}"
          output += "X"
        end
      }
      # puts "Random code: #{r_code}, code copy: #{code_copy}"
      u_guess.each_char { |c|
        if code_copy.include?(c)
          code_copy[code_copy.index(c)] = ""
          # puts "Copy: #{code_copy}"
          output += "x"
        end
      }
      puts output
    end
  end
end

# testStr = "12"
# testIn = "22"
# result = ""

# testIn.each_char.with_index { |c,i| 
#   newStr = ""
#   if testStr.include?(c)
#     newStr = "x"
#     if testStr[i].eql?(testIn[i])
#       newStr.upcase!
#     end
#   end
#   result += newStr
# }

# puts result
