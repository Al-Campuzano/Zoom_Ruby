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
    @short_list = StudentBody.new({ grade8: ["Claudio", "Mic"] })
  end

  def test_default_is_same_as_long_list_in_setup
    assert_equal(@long_list.first, @default_list.first)
  end

  def test_dot_each_method
    expected = "Claudio\nMic\n"
    assert_output(expected) { @short_list.each { |x| puts x } }    
  end

  def test_dot_count
    expected = 2
    actual = @short_list.count
    assert_equal(expected, actual)
  end
end
