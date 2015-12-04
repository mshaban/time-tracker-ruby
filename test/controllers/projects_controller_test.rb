require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test "should get index" do
    get :index
    assert_response :redirect
    @user = users(:brianhoke)
    sign_in @user

    get :index
    assert_response :success, 'logged in user should access index'

    sign_out @user

    get :index
    assert_response :redirect, 'logged-out user should be redirected'
  end
end
