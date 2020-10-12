# Create a code-cracking game that randomly generates a 4 digit code, where each digit has the value of 1-6. 
# A person will attempt to crack the code by making guesses, and the program will give the person hints about whether the digits are correct or not.
# For each digit that is in the right place, it will be output an X. For each digit that is in the code, but is in the wrong place, it will output an x. 
# All X’s will be output before x’s.
# The game will keep track of the number of guesses the person has made, and will end when the code is guessed.

puts "MASTERMIND"

# generate random 4-digit code with digits from 1 to 6
limit = 6 # highest digit that can be used
r_code = ""
4.times do
  r_code += (rand(limit) + 1 ).to_s
end

counter = 1 # keeps track of number of tries/guesses
loop do
  print "[#{counter}] Enter your guess: "
  u_guess = gets.chomp

  # check that input string is exactly 4 characters, is a number, the first character is not a minus sign, and no digit is larger than limit or less than 1
  if (u_guess.length == 4 && u_guess.to_i.to_s == u_guess && !u_guess[0].eql?("-") && !u_guess.split("").any?{|n| n.to_i > limit || n.to_i < 1})
    # if the guess is the same as the random code then print the code and a string congratulating the user
    if (u_guess.eql?(r_code))
      puts u_guess
      guess_str = "guess"
      counter > 1 ? guess_str += "es." : guess_str += "." # pluralize the word "guess" if needed
      puts "Nice work! You took #{counter} #{guess_str}"
      break
    else # the guess was incorrect
      counter += 1 # increase the number of guesses by one
      output = "" # used to build the string with hints
      code_copy = r_code.clone # clone the random code so we can remove characters that have been matched
      # loop through the guess string's characters and check if any of the guessed characters are in the exact position as in the random code
      u_guess.each_char.with_index { |c,i|
        if r_code[i].eql?(u_guess[i])
          # remove the character from the copy of the code so it can't be matched again later
          code_copy[code_copy.index(c)] = ""
          # add the correct hint character to the output string
          output += "X"
        end
      }

      # loop through guess string's chars to see if any of them are in any part of the remaining cloned code, if so then remove that char from the cloned code and add the correct hint char to the output string
      u_guess.each_char { |c|
        if code_copy.include?(c)
          code_copy[code_copy.index(c)] = ""
          output += "x"
        end
      }
      puts output # print the hint text
    end
  end
end
