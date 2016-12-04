require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:stella)
  end

  test "unsuccessful edit" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name: "",
                                               email: "ste.com",
                                              phone_number: "",
                                              password: "rain",
                                              password_confirmation: "bow"}}
    assert_template 'users/edit'
  end
end
