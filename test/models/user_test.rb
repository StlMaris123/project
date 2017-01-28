require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Stella Njage", email: "stellanjage@gmail.com",
                     phone_number: "012345678", password: "rainboow",
                    password_confirmation: "rainbow")
  end
  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?(:remember, '')
  end
end
