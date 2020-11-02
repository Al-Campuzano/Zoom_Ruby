# Additional requirements:
# Be sure to use setters and getters. Validation is everything! ✓
# Each subclass must override at least one superclass method
# Use super at least once. ✓
# Have at least one occurrence of code yielding to a block. ✓

require_relative 'children'


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

clark = SuperHero.new
clark.name = "Clark Kent"
p clark.items
clark.fly
clark.super_power = "Super Strength"
clark.move
clark.harvest

bill = Jester.new
bill.name = "Bill Burr"
p bill.items
bill.move
bill.entertain
