# Write a Ruby program that asks two players to enter either Rock, Paper or Scissors and then outputs the outcome of the game.
# Note: You should check whether there is valid. If it is invalid, say "No cheaters! Only Rock, Paper or Scissors are allowed.

# use this hash to map an object (rock, paper, etc) to it's winning outcome
outcome_hash = {"rock" => "Rock crushes scissors.", "scissors" => "Scissors cuts paper.", "paper" => "Paper covers rock."}
# invalid input message
invalid_msg = "No cheaters! Only Rock, Paper or Scissors are allowed."

puts "Rock Paper Scissors" # game title

p1_points = 0
p2_points = 0

loop do
  repeat = false
  print "\nPlayer 1 - Enter your selection: "
  player_one = gets.chomp.downcase

  # if player one's input is valid get player two's input, else print invalid message
  if outcome_hash.key?(player_one.downcase)
    print "Player 2 - Enter your selection: "
    player_two = gets.chomp.downcase
    unless outcome_hash.key?(player_two)
      repeat = true
      puts invalid_msg 
    end
  else
    repeat = true
    puts invalid_msg  
  end

  unless repeat
    if player_one == player_two
      repeat = true
      puts "Tie!" 
      # if player two's choice is in the winning message of player one's choice then player one wins, else player two wins
    elsif outcome_hash[player_one].include?(player_two)
      puts outcome_hash[player_one]
      p1_points += 1
    else
      puts outcome_hash[player_two]
      p2_points += 1
    end
  end

  break if (p1_points == 2 || p2_points == 2) && !repeat
end

if p1_points == 2
  puts "Player 1 wins."
else
  puts "Player 2 wins."
end
