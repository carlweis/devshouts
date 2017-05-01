require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(name: "user", email: "user@example.com", 
                        password: "password", password_confirmation: "password")
  end

  test "should get show" do
    get users_show_url(id: @user.id)
    assert_response :success
  end

  test "should redirect to root_url if user doesn't exist" do
    get users_show_url(id: 1234)
    assert_redirected_to root_url
  end

  test "should redirect to root_url if user is admin" do
    @user.role = "admin"
    @user.save
    get users_show_url(id: @user.id)
    assert_redirected_to root_url
  end

  test "should redirect to root_url if user is guest" do
    @user.role = "guest"
    @user.save
    get users_show_url(id: @user.id)
    assert_redirected_to root_url
  end
end
