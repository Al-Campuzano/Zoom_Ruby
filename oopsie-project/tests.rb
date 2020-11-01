# Nobody’s perfect - not even supreme beings. Write the following tests:
 

# Superclass attribute is set correctly after initialization
# receive() works as expected
# give() works as expected
# The output of speak()
# 2 subclass methods
# 2 module methods
# A test that uses refute_equal
# A test that uses assert_output
# A test that uses refute_nil
# A test that uses assert_instance_of


require 'minitest/autorun'
require_relative 'parent'

class CreatureTest < Minitest::Test
  @@creature = Creature.new("Billy", 21, "Go ahead, make my day!")

  def test_super_initialized_properly
    assert_instance_of(Creature, @@creature)  
  end
end
