require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:stella)
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name: "",
                                               email: "ste.com",
                                              phone_number: "",
                                              password: "rain",
                                              password_confirmation: "bow"}}
    assert_template 'users/edit'
  end

  test "successful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    name = "Stella Njage"
    email = "stella@njage.com"
    phone_number = "0123456"
    patch user_path(@user), params: { user: { name: name,
                                              email: email,
                                               phone_number: phone_number,
                                               password: "",
                                               password_confirmation: ""} }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal @user.name, name
    assert_equal @user.email, email
    assert_equal @user.phone_number, phone_number
  end
end
