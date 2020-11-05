require 'minitest/autorun'
require_relative "../inventory-mapper"

class InventoryMapperTest < Minitest::Test
  def setup
    @mapper = InventoryMapper.new
  end
  
  def test_map_with_no_arguments
    expected = '"" => {"Shelf" : 0, "Stool" : 0, "Table" : 0}'+"\n"
    assert_output(expected) { @mapper.map }
  end

  def test_with_empty_string
    expected = '"" => {"Shelf" : 0, "Stool" : 0, "Table" : 0}'+"\n"
    assert_output(expected) { @mapper.map("") }
  end

  def test_with_special_characters
    expected = '"?#@!4" => {"Shelf" : 0, "Stool" : 0, "Table" : 0}'+"\n"
    assert_output(expected) { @mapper.map("?#@!4")}
  end
end
