require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: { name: "",
                               email: "me@com",
                              phone_number: "",
                              password: "rain",
                              password_confirmation: "bow"}
    end
    assert_template 'users/new'
  end
end
