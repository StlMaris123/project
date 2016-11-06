require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: "",
                              phone_number: "",
                               email: "me@com",
                              password: "rain",
                              password_confirmation: "bow"}}
    end
    assert_template 'users/new'
  end
end
