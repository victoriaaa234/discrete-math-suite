require 'rails_helper'

RSpec.describe UsersController do
  def test_index
    get :index
    assert_equal User.all, assigns(:users)
  end
end