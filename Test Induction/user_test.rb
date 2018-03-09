#basic test case written for checking user validity
require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", email: "user@example.com")
    #here a sample user is created to check to see if the database is saving users.
  end

  test "should be valid" do
    assert @user.valid?
  end

  #test to check if name field is working for specific user
  test "name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end
  #test to check if email field is working for specific user
  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end
  
  #test to ensure duplicate email addresses do not arise
  test "email addresses should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end
end
