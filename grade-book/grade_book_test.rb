# Identify the purpose of the classes.
# Identify the purpose of the methods.
# Identify the groups of expected behaviour.
# Identify the limits of the cases of expected behaviour.
# Identify any exceptional/error cases.

# A test that uses refute_equal
# A test that uses assert_includes
# A test that uses assert_output
# A test that uses refute_nil ✓
# A test that uses refute_empty ✓
# A test that uses assert_kind_of ✓
# A test that uses assert_raises ✓
# A test that uses assert_instance_of ✓
# at least 6 total, one for each method

require 'minitest/autorun'
require_relative 'grade_book'

class GradeBookTest < Minitest::Test
  def test_init_of_gradebook_sets_up_correct_object
    grade_book = GradeBook.new
    assert_instance_of(GradeBook, grade_book, msg = "grade_book is not a GradeBook object")
  end

  def test_init_of_gradebook_creates_hash
    assert_kind_of(Hash, GradeBook.new.grades, msg = "gradebook does not create a hash")
  end

  def test_add_grade_adds_item_to_hash
    grade_book = GradeBook.new
    grade_book.add_grade("Student", 79)
    refute_empty(grade_book.grades)
  end
  
  def test_get_grade_returns_correct_value
    grade_book = GradeBook.new
    grade_book.add_grade("Student", 79)
    assert(grade_book.get_grade("Student") == 79)  
  end

  def test_letter_grades_returns_something
    grade_book = GradeBook.new
    grade_book.add_grade("Student", 79)
    refute_nil(grade_book.letter_grades)  
  end

  def test_letter_grade_raises_error
    grade_book = GradeBook.new
    grade_book.add_grade("Student", 79)
    assert_raises()  { grade_book.letter_grade }
  end

  def test_to_grade_79_returns_B
    assert(79.0.to_grade == "B")
  end
end
