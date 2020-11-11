require 'minitest/autorun'
require_relative 'lego'

class LegoTest < Minitest::Test
  # LegoHat tests
  @@hat = LegoHat.new("Large", "red", "Sombrero")
  def test_initializing_LegoHat_returns_correct_class
    assert_instance_of(LegoHat, @@hat)
  end

  def test_LegoHat_to_s_returns_correct_string
    expected = "a Large red Sombrero"
    assert(@@hat.to_s == expected)
  end

  # LegoItem tests
  @@sword = LegoItem.new("Sword", 8)
  @@shield = LegoItem.new("Shield", 21)
  def test_init_LegoItem_returns_correct_class
    assert_instance_of(LegoItem, @@sword)
  end

  def test_LegoItem_to_s_returns_correct_string
    expected = "a 8 gram Sword"
    assert(@@sword.to_s == expected)
  end

  def test_LegoItem_is_heavy_returns_boolean
    assert_kind_of(FalseClass, @@sword.is_heavy(10))
  end

  # LegoMinifigure tests
  @@figure = LegoMinifigure.new("Oli")
  def test_init_Minifigure_returns_correct_class
    assert_instance_of(LegoMinifigure, @@figure)
  end

  def test_Minifigure_to_s_returns_correct_string_with_only_name
    expected = "A Lego minifigure named Kevin."
    figure = LegoMinifigure.new("Kevin")
    assert(figure.to_s == expected)
  end

  def test_Minifigure_wear_hat_adds_hat_to_object
    @@figure.wear_hat(@@hat)
    assert(@@figure.hat == @@hat)
  end

  def test_Minifigure_is_stylish_returns_boolean
    @@figure.wear_hat(@@hat)
    assert_kind_of(TrueClass, @@figure.is_stylish?)
  end

  def test_Minifigure_place_in_left_hand_adds_item_to_object
    @@figure.place_in_left_hand(@@sword)
    assert(@@figure.left_item == @@sword)
  end

  def test_Minifigure_place_in_right_hand_adds_item_to_object
    @@figure.place_in_right_hand(@@shield)
    assert(@@figure.right_item == @@shield)
  end

  def test_Minifigure_swap_hands_changes_items
    @@figure.place_in_left_hand(@@sword)
    @@figure.place_in_right_hand(@@shield)
    @@figure.swap_hands
    assert(@@figure.right_item == @@sword && @@figure.left_item == @@shield)
  end

  def test_Minifigure_is_strong_returns_boolean
    @@figure.place_in_left_hand(@@sword)
    @@figure.place_in_right_hand(@@shield)
    assert_kind_of(TrueClass, @@figure.is_strong?)
  end

  def test_Minifigure_to_s_returns_complete_string_with_all_items
    @@figure.wear_hat(@@hat)
    @@figure.place_in_left_hand(@@sword)
    @@figure.place_in_right_hand(@@shield)
    expected = "A Lego minifigure named Oli, who is wearing a Large red Sombrero and is holding a 8 gram Sword in the left hand and a 21 gram Shield in the right hand."
    assert(@@figure.to_s == expected)
  end
end
