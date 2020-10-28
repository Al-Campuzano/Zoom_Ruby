# Identify the purpose of the classes.
# Identify the purpose of the methods.
# Identify the groups of expected behaviour.
# Identify the limits of the cases of expected behaviour.
# Identify any exceptional/error cases.

# A test that uses refute_equal
# A test that uses assert_includes
# A test that uses assert_output
# A test that uses refute_nil
# A test that uses refute_empty
# A test that uses assert_kind_of
# A test that uses assert_raises
# A test that uses assert_instance_of ✓
# at least 6 total, one for each method

require 'minitest/autorun'
require_relative 'grade_book'

class GradeBookTest < Minitest::Test
  def test_init_of_gradebook_sets_up_correct_object
    grade_book = GradeBook.new
    assert_instance_of(GradeBook, grade_book, msg = "grade_book is not a GradeBook object")
  end
end
