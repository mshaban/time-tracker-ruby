require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'existancy of fields' do
    company = Company.first
    assert company.valid?, 'Work is invalid'
    company.name = nil
    assert_not company.valid?, 'Work is valid'
    assert company.errors[:name].any?, 'company should have name error'
  end
end
