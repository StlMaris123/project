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
  test "valid signup iinformation" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name: "Stella Njage",
                                                      email: "ste@njage.com",
                                                      phone_number: "123456",
                                                      password: "rainbow",
                                                      password_confirmation: "rainbow"
         
      }}
      assert_redirected_to @user
      follow_redirect!
    end
    assert_template 'users/show'
  end
end
