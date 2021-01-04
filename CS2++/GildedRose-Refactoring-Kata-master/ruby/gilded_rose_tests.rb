require File.join(File.dirname(__FILE__), 'gilded_rose')
require 'test/unit'

class TestUntitled < Test::Unit::TestCase

  def test_foo
    items = [Item.new("foo", 0, 0)]
    GildedRose.new(items).update_quality()
    assert_equal items[0].name, "foo"
  end

  def test_conjured_item
    quality = 6
    items = [Item.new("This is a Conjured test", 3, quality)]
    GildedRose.new(items).update_quality
    assert_equal items[0].quality, quality - 2
  end

end
