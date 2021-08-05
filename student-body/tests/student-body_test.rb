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
    assert_equal(@long_list.classes, @default_list.classes)
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

  def test_dot_map_with_short
    expected = ["ciM", "oidualC"]
    actual = @short_list.map { |x| x.reverse }
    assert_equal(expected, actual)
  end

  def test_dot_find_all_with_long
    expected = ["Alison", "Fiona", "Glyndon"]
    actual = @long_list.find_all { |x| x.include?("on") }
    assert_equal(expected, actual)
  end

  def test_dot_reject_with_short
    expected = ["Claudio"]
    actual = @short_list.reject { |x| x.downcase.include?("m") }
    assert_equal(expected, actual)
  end

  def test_minmax_with_long
    expected = ["Alex", "Susie"]
    actual = @long_list.minmax 
    assert_equal(expected, actual)
  end
end
