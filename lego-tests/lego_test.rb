require 'minitest/autorun'
require_relative 'lego'

class LegoTest < Minitest::Test
  # LegoHat tests
  @@hat = LegoHat.new("Large", "Red", "Sombrero")
  def test_initializing_LegoHat_returns_correct_class
    assert_instance_of(LegoHat, @@hat)
  end

  def test_LegoHat_to_s_returns_correct_string
    expected = "a Large Red Sombrero"
    assert(@@hat.to_s == expected)
  end

  # LegoItem tests
  @@item = LegoItem.new("Sword", 8)
  def test_init_LegoItem_returns_correct_class
    assert_instance_of(LegoItem, @@item)
  end

  def test_LegoItem_to_s_returns_correct_string
    expected = "a 8 gram Sword"
    assert(@@item.to_s == expected)
  end

  def test_LegoItem_is_heavy_returns_boolean
    assert_kind_of(FalseClass, @@item.is_heavy(10))
  end
end
