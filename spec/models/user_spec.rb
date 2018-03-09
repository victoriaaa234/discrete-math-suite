require 'rails_helper'

class UsersController < ActionController::TestCase
  test "Index action succeeded" do
    get :index
    assert_response :success
  end
end