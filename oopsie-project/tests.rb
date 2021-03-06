require 'minitest/autorun'
require_relative 'parent'
require_relative 'children'

class CreatureTest < Minitest::Test
  @@creature = Creature.new("Billy", 21, "Go ahead, make my day!")

  def test_super_initialized_properly
    assert_instance_of(Creature, @@creature)  
  end

  # setter tests
  def test_name_setter_with_empty_string
    assert_raises() { @@creature.name = "" }
    @@creature = Creature.new("Billy", 21, "Go ahead, make my day!")
  end

  def test_name_setter_with_correct_string
    @@creature.name = "Jimmy"
    assert("Jimmy" == @@creature.name)
    @@creature = Creature.new("Billy", 21, "Go ahead, make my day!")
  end
  
  def test_catch_phrase_setter_with_empty_string
    assert_raises() { @@creature.catch_phrase = "" }
    @@creature = Creature.new("Billy", 21, "Go ahead, make my day!")
  end

  def test_catch_phrase_setter_with_correct_string
    @@creature.catch_phrase = "Use the force!"
    assert("Use the force!" == @@creature.catch_phrase)
    @@creature = Creature.new("Billy", 21, "Go ahead, make my day!")
  end
  
  def test_age_with_incorrect_input
    assert_raises() { @@creature.age = "Bob" }
    @@creature = Creature.new("Billy", 21, "Go ahead, make my day!")
  end
  
  def test_age_with_correct_input
    @@creature.age = 33
    assert_equal(33, @@creature.age)
    @@creature = Creature.new("Billy", 21, "Go ahead, make my day!")
  end

  # move tests
  def test_move_method
    expected = "Billy is on the move!"
    actual = @@creature.move 
    assert_equal(expected,actual)
  end

  # speak tests
  def test_speak_method
    expected = "Billy says: Go ahead, make my day!\n"
    actual = @@creature.speak
    assert_output(expected) { @@creature.speak }
  end

  def test_speak_with_block
    expected = "I'll be back!\n"
    assert_output(expected) { (@@creature.speak { "I'll be back!" }) }
  end

  def test_speak_with_no_catch_phrase
    unknown = Creature.new
    expected = "UNKNOWN says: I'm the best!\n"
    assert_output(expected) {unknown.speak}
  end

  # receive_item tests
  def test_receive_with_existing_item
    assert(@@creature.receive_item("Hammers", 1))
    @@creature = Creature.new("Billy", 21, "Go ahead, make my day!")
  end

  def test_receive_adjusts_amounts
    actual = @@creature.receive_item("Hammers", 1)
    refute_equal(1, @@creature.items["Hammers"])
    @@creature = Creature.new("Billy", 21, "Go ahead, make my day!")
  end
  
  def test_receive_with_missing_item
    refute(@@creature.receive_item("Screws", 29))
    @@creature = Creature.new("Billy", 21, "Go ahead, make my day!")
  end
  
  ## give_item tests
  def test_give_with_existing_item
    assert(@@creature.give_item("Hammers", 1))
    @@creature = Creature.new("Billy", 21, "Go ahead, make my day!")    
  end

  def test_give_adjusts_amounts
    actual = @@creature.give_item("Hammers", 1)
    refute_equal(1, @@creature.items["Hammers"])
    @@creature = Creature.new("Billy", 21, "Go ahead, make my day!")    
  end
  
  def test_give_with_missing_item
    refute(@@creature.give_item("Drills", 3))
    @@creature = Creature.new("Billy", 21, "Go ahead, make my day!")    
  end
  
  def test_give_with_not_enough_number
    refute(@@creature.give_item("Hammers", 3))
    @@creature = Creature.new("Billy", 21, "Go ahead, make my day!")    
  end

  # subclasses tests
  @@joker = Jester.new
  @@hero = SuperHero.new("Batman", 33, "I am the Dark Knight!", "Lots of money")
  def test_jester_object_isnt_nil
    refute_nil(@@joker)
  end

  def test_jester_move_method
    expected = "I'm moving to Greenwich in a couple months. Don't know what I'm going to do in the mean time...\n"
    assert_output(expected) { @@joker.move }
  end

  def test_superhero_fly_method_negative
    expected = "Batman can't fly :(\n"
    assert_output(expected) { @@hero.fly }
  end

  # module tests
  def test_harvest_method
    expected = "Let's get to harvesting!\n"
    assert_output(expected) { @@hero.harvest }
  end

  def test_decimals_of_pi
    expected = "3.14159"
    actual = @@joker.decimals_of_pi(5)
    assert_equal(expected, actual)
  end
end
