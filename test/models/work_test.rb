require 'test_helper'

class WorkTest < ActiveSupport::TestCase
  test 'test existancy of fields' do
    work = Work.first
    assert work.valid?, 'Work is invalid'
    work.project_id = nil
    work.user_id = nil
    work.datetimeperformed = nil
    assert_not work.valid?, 'Work is valid with non existence of some fields'
    assert work.errors[:project_id].any?, 'work should have project error'
    assert work.errors[:user_id].any?, 'work should have user error'
    assert work.errors[:datetimeperformed].any?, 'work should have datetimeperformed error'
  end

  test 'test datetimeperformed in past' do
    work = Work.first
    assert work.valid?, 'Work is invalid'
    work.datetimeperformed = work.datetimeperformed + 2.years
    assert_not work.valid?, 'work is valid with invalid datetimeperformed'
    assert work.errors[:datetimeperformed].any?, 'work should have datetimeperformed error'
  end

  test 'test numericality' do
    work = Work.first
    assert work.valid?, 'Work is invalid'
    work.hours = nil
    assert_not work.valid?, 'work should be invalid'
    assert work.errors[:hours].any?, 'work should have hours error'
  end

  test 'hours in range' do
    work = Work.first
    assert work.valid?, 'Work is invalid'
    work.hours = 9
    assert_not work.valid?, 'work should be invalid'
    assert work.errors[:hours].any?, 'work should have hours error'
  end

end
