require 'minitest/autorun'
require_relative "../inventory-mapper"

class InventoryMapperTest < Minitest::Test
  def setup
    @default_mapper = InventoryMapper.new
  end
  
  def test_map_with_no_arguments
    expected = '"" => {"Shelf" : 0, "Stool" : 0, "Table" : 0}'+"\n"
    assert_output(expected) { @default_mapper.map }
  end

  def test_with_empty_string
    expected = '"" => {"Shelf" : 0, "Stool" : 0, "Table" : 0}'+"\n"
    assert_output(expected) { @default_mapper.map("") }
  end
  
  def test_with_special_characters
    expected = '"?#@!4" => {"Shelf" : 0, "Stool" : 0, "Table" : 0}'+"\n"
    assert_output(expected) { @default_mapper.map("?#@!4")}
  end
  
  def test_with_deeedeee
    expected = '"deeedeee" => {"Shelf" : 0, "Stool" : 0, "Table" : 1}'+"\n"
    assert_output(expected) { @default_mapper.map("deeedeee") }
  end
  
  def test_with_zabc
    expected = '"zabc" => {"Shelf" : 1, "Stool" : 0, "Table" : 0}'+"\n"
    assert_output(expected) { @default_mapper.map("zabc") }
  end
  
  def test_with_eebeedebaceeceedeceacee
    expected = '"eebeedebaceeceedeceacee" => {"Shelf" : 2, "Stool" : 1, "Table" : 2}'+"\n"
    assert_output(expected) { @default_mapper.map("eebeedebaceeceedeceacee") }
  end

  def test_with_beceadee
    expected = '"beceadee" => {"Shelf" : 1, "Stool" : 0, "Table" : 1}'+"\n"
    assert_output(expected) { @default_mapper.map("beceadee") }
  end

  def test_with_abccc
    expected = '"abccc" => {"Shelf" : 1, "Stool" : 1, "Table" : 0}'+"\n"
    assert_output(expected) { @default_mapper.map("abccc") }
  end
  
  def test_four_products
    mapper = InventoryMapper.new([Shelf.new, Stool.new, Table.new, Chair.new])
    expected = '"abzzz" => {"Shelf" : 1, "Stool" : 0, "Table" : 0, "Chair" : 1}'+"\n"
    assert_output(expected) { mapper.map("abzzz") }
  end
end
