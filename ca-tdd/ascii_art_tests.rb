require 'minitest/autorun'
require_relative 'ascii_art.rb'

class AsciiArtTest < Minitest::Test
  def test_draw_returns_string
    assert_kind_of(String, AsciiArt.draw(2))
  end

  def test_number_0
    assert_equal("", AsciiArt.draw(0))
  end

  def test_number_1
    assert_equal("* \n", AsciiArt.draw(1))
  end

  def test_number_2
    #skip
    assert_equal(" * \n* * \n * \n", AsciiArt.draw(2))
  end

  def test_number_4
    expected = "   * \n  * * \n * * * \n* * * * \n * * * \n  * * \n   * \n"
    actual = AsciiArt.draw(4)
    assert_equal(expected,actual)
  end
end
