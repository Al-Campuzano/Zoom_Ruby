# Write a Ruby program that asks two players to enter either Rock, Paper or Scissors and then outputs the outcome of the game.
# Note: You should check whether there is valid. If it is invalid, say "No cheaters! Only Rock, Paper or Scissors are allowed.

outcome_hash = {"rock" => "scissors", "scissors" => "paper", "paper" => "rock"}
invalid_msg = "No cheaters! Only Rock, Paper or Scissors are allowed."

puts "Rock Paper Scissors" # game title

print "Player 1 - Enter your selection: "
player_one = gets.chomp

unless outcome_hash.key?(player_one.downcase)
  puts invalid_msg
end

print "Player 2 - Enter your selection: "
player_two = gets.chomp

unless outcome_hash.key?(player_two.downcase)
  puts invalid_msg
end

if player_one.downcase == player_two.downcase
  puts "Tie!"
end

