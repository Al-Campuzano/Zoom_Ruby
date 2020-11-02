# Superclass attribute is set correctly after initialization ✓
# receive() works as expected ✓
# give() works as expected ✓
# The output of speak() ✓
# 2 subclass methods ✓
# 2 module methods
# A test that uses refute_equal ✓
# A test that uses assert_output ✓
# A test that uses refute_nil ✓
# A test that uses assert_instance_of ✓

require_relative 'children'

puts "\n=== Cartoon Creature ==="
bob = Cartoon.new
bob.name = "Sponge Bob"
bob.age = 8
bob.catch_phrase = "I live in a pineapple under the sea"
bob.jump
p bob.items
puts bob
bob.move
bob.plant("Mint")
puts bob.decimals_of_pi(33)

puts "\n=== SuperHero Creature ==="
clark = SuperHero.new
clark.name = "Clark Kent"
p clark.items
clark.fly
clark.super_power = "Super Strength"
clark.move
clark.harvest

puts "\n=== Jester Creature ==="
bill = Jester.new
bill.name = "Bill Burr"

puts "Bill's items before change:"
p bill.items
puts "Clark's items before change:"
p clark.items
bill.receive_item("Nails", 5) if clark.give_item("Nails", 5)
puts "Bill's items after change:"
p bill.items
puts "Clark's items after change:"
p clark.items

bill.move
bill.entertain
bill.offer_bribe
puts bill.flip_coin
