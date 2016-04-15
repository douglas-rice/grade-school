# !/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require 'minitest/pride'

require_relative 'grade_school'

class SchoolTest < Minitest::Test
  def setup  # minitest gives us this method
    @school = School.new
  end

  def test_new_school
    assert_equal(true, @school.empty?)
  end

  def test_add_student
    @school.add("jim", 2)
    assert_equal({2 => ['jim']}, @school.to_h)
  end

  def test_find_students_in_grade
    @school.add("jim", 2)
    @school.add("jill", 2)

    assert_equal(['jim', 'jill'], @school.grade(2))
  end

  def test_sorted_list_of_students
    @school.add("yvonne", 3)
    @school.add("jim", 2)  
    @school.add("bob", 3)
    @school.add("adam", 2)

    assert_equal({2 => ['adam', 'jim'], 3 => ['bob', 'yvonne']}, @school.to_h)
  end

end
