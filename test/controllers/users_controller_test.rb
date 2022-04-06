require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_user = users(:admin)
    @normal_user = users(:normal)
  end

  test "should redirect to login when no user" do
    get users_url
    assert_redirected_to login_path
  end

  test "should get index when ADMIN" do
    login!(email: @admin_user.email, password: @admin_user.password)
    get users_url
    assert_response :success
  end

  test "should NOT get index when NORMAL" do
    login!(email: @normal_user.email, password: @normal_user.password)
    get users_urlx
    assert :success
    assert_redirected_to  user_path(@normal_user.id)
  end

  # test "should get new" do
  #   get new_user_url
  #   assert_response :success
  # end

  # test "should create user" do
  #   assert_difference("User.count") do
  #     post users_url, params: { user: { admin: @user.admin, cv_link: @user.cv_link, email: @user.email, english_level: @user.english_level, name: @user.name, password: @user.password, password_confirmation: @user.password_confirmation, tecnic_knowledge: @user.tecnic_knowledge } }
  #   end

  #   assert_redirected_to user_url(User.last)
  # end

  # test "should show user" do
  #   get user_url(@user)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_user_url(@user)
  #   assert_response :success
  # end

  # test "should update user" do
  #   patch user_url(@user), params: { user: { admin: @user.admin, cv_link: @user.cv_link, email: @user.email, english_level: @user.english_level, name: @user.name, password: @user.password, password_confirmation: @user.password_confirmation, tecnic_knowledge: @user.tecnic_knowledge } }
  #   assert_redirected_to user_url(@user)
  # end

  # test "should destroy user" do
  #   assert_difference("User.count", -1) do
  #     delete user_url(@user)
  #   end

  #   assert_redirected_to users_url
  # end
  
  private
  
  def login!(email:, password:)
    post login_path,
      params: {
        email: email,
        password: password
      }
    follow_redirect!
  end
end
