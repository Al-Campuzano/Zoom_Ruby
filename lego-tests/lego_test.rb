require 'minitest/autorun'
require_relative 'lego'

class LegoTest < Minitest::Test
  # LegoHat tests
  def test_initializing_LegoHat_returns_correct_class
    assert_instance_of(LegoHat, LegoHat.new("Large", "Red", "Sombrero"))
  end

  def test_LegoHat_to_s_returns_correct_string
    expected = "a Large Red Sombrero"
    hat = LegoHat.new("Large", "Red", "Sombrero")
    assert(hat.to_s == expected)
  end

  # LegoItem tests
  def test_init_LegoItem_returns_correct_class
    assert_instance_of(LegoItem, LegoItem.new("Sword", 8))
  end
end
