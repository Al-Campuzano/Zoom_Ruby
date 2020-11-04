require 'minitest/autorun'
require_relative "../student-body"

class StudentBodyTest < Minitest::Test
  def setup
    @long_list = StudentBody.new({ 
      grade1: ["Billy", "Susie", "Lara", "Oli", "Alex"],
      grade2: ["Sarah", "Steven", "Alison", "Jose", "Roxy"],
      grade3: ["Kiko", "Fiona", "Garth", "Michelle", "Neal"],
      grade4: ["Jen", "Hiro", "Luna", "Glyndon", "Scarlet"]
    })
    @default_list = StudentBody.new # should be the same as long_list
    @short_list = StudentBody.new({ 
      grade8: ["Mic", "Claudio"] 
    })
  end

  def test_default_is_same_as_long_list_in_setup
    assert_equal(@long_list.first, @default_list.first)
  end

  def test_dot_each_method
    expected = "Mic\nClaudio\n"
    assert_output(expected) { @short_list.each { |x| puts x } }    
  end

  def test_dot_count_with_short
    expected = 2
    actual = @short_list.count
    assert_equal(expected, actual)
  end

  def test_dot_count_with_long
    expected = 20
    actual = @long_list.count
    assert_equal(expected, actual)
  end

  def test_dot_first_with_short
    expected = "Mic"
    actual = @short_list.first
    assert_equal(expected, actual)
  end

  def test_dot_first_with_long
    expected = "Billy"
    actual = @long_list.first
    assert_equal(expected, actual)
  end

  def test_dot_sort_with_short
    expected = ["Claudio", "Mic"]
    actual = @short_list.sort
    assert_equal(expected, actual)
  end
end
