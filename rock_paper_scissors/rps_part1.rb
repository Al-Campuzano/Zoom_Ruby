# Write a Ruby program that asks two players to enter either Rock, Paper or Scissors and then outputs the outcome of the game.
# Note: You should check whether there is valid. If it is invalid, say "No cheaters! Only Rock, Paper or Scissors are allowed.

outcome_hash = {"rock" => "Rock crushes scissors.", "scissors" => "Scissors cuts paper.", "paper" => "Paper covers rock."}
invalid_msg = "No cheaters! Only Rock, Paper or Scissors are allowed."

puts "Rock Paper Scissors" # game title

print "Player 1 - Enter your selection: "
player_one = gets.chomp.downcase

if outcome_hash.key?(player_one.downcase)
  print "Player 2 - Enter your selection: "
  player_two = gets.chomp.downcase
  puts invalid_msg unless outcome_hash.key?(player_two)
else
  puts invalid_msg  
end

puts "Tie!" if player_one == player_two

