require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  test 'existancy of fields' do
    project = Project.first
    project.name, project.company_id = nil
    assert_not project.valid?, 'project is valid'
    assert project.errors[:name].any?, 'project name should have error'
    assert project.errors[:company_id].any?, 'project name should have error'
  end

  test 'test default_rate field' do
    project = Project.first
    assert project.valid?, 'project is invalid'
    project.default_rate = nil
    assert_not project.valid?, 'project is valid'
    assert project.errors[:default_rate].any?, 'project default_rate should have error'
    project = Project.first
    assert project.valid?, 'project is invalid'
    project.default_rate = 25
    assert_not project.valid?, 'project is valid'
    assert project.errors[:default_rate].any?, 'project default_rate should have error'
  end
end
