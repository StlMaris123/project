require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:stella)
    @other_user = users(:boris)
  end

  test "should get new" do
    get signup_path
    assert_response :success
  end

  test "should redirect index when not logged in" do
    get users_path
    assert_redirected_to login_url
  end

  test "should redirect edit when not logged in" do
    get edit_user_path(@user),params: { id: @user }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch user_path(@user),params: { id: @user, user:  { name: @user.name, email: @user.email,
                                        phone_number: @user.phone_number}}
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect edit when logged in as a wrong user" do
    log_in_as(@other_user)
    get edit_user_path(@user), params:{ id: @user }
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as a wrong user" do
    log_in_as(@other_user)
    patch user_path(@user), params: { id: @user, user: { name: @user.name,
                                                         email: @user.email,
                                                         phone_number: @user.phone_number} }
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'User.count' do
      delete user_path(@user), params: { id: @user }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when logged in as a non-admin" do
    log_in_as(@other_user)
    assert_no_difference 'User.count' do
      delete user_path(@other_user), params: { id: @user }
    end
    assert_redirected_to root_url
  end
end

