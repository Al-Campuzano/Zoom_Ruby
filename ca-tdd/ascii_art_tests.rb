require 'minitest/autorun'
require_relative 'ascii_art.rb'

class AsciiArtTest < Minitest::Test
  def test_draw_returns_string
    assert_kind_of(String, AsciiArt.draw(2))
  end
end
