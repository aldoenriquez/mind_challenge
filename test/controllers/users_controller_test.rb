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

  test "should get new when ADMIN" do
    login!(email: @admin_user.email, password: @admin_user.password)
    get new_user_url
    assert_response :success
  end

  test "should create user when ADMIN" do
    login!(email: @admin_user.email, password: @admin_user.password)
    assert_difference("User.count") do
      post users_url, params: { user: { admin: @admin_user.admin, cv_link: @admin_user.cv_link, email: @admin_user.email, english_level: @admin_user.english_level, name: @admin_user.name, password: @admin_user.password, password_confirmation: @admin_user.password_confirmation, tecnic_knowledge: @admin_user.tecnic_knowledge } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user when ADMIN" do
    login!(email: @admin_user.email, password: @admin_user.password)
    get user_url(@admin_user)
    assert_response :success
  end

  test "should get edit when ADMIN" do
    login!(email: @admin_user.email, password: @admin_user.password)
    get edit_user_url(@admin_user)
    assert_response :success
  end

  test "should update user when ADMIN" do
    login!(email: @admin_user.email, password: @admin_user.password)
    patch user_url(@admin_user), params: { user: { admin: @admin_user.admin, cv_link: @admin_user.cv_link, email: @admin_user.email, english_level: @admin_user.english_level, name: @admin_user.name, password: @admin_user.password, password_confirmation: @admin_user.password_confirmation, tecnic_knowledge: @admin_user.tecnic_knowledge } }
    assert_redirected_to user_url(@admin_user)
  end

  test "should destroy user when ADMIN" do
    login!(email: @admin_user.email, password: @admin_user.password)
    assert_difference("User.count", -1) do
      delete user_url(@admin_user)
    end

    assert_redirected_to users_url
  end

  test "should NOT get index when NORMAL" do
    login!(email: @normal_user.email, password: @normal_user.password)
    get users_url
    assert_redirected_to user_path(@normal_user.id)
  end

  test "should NOT get new when NORMAL" do
    login!(email: @normal_user.email, password: @normal_user.password)
    get new_user_url
    assert_redirected_to user_path(@normal_user.id)
  end

  test "should NOT create user when NORMAL" do
    login!(email: @normal_user.email, password: @normal_user.password)
    post users_url, params: { user: { admin: @normal_user.admin, cv_link: @normal_user.cv_link, email: @normal_user.email, english_level: @normal_user.english_level, name: @normal_user.name, password: @normal_user.password, password_confirmation: @normal_user.password_confirmation, tecnic_knowledge: @normal_user.tecnic_knowledge } }

    assert_redirected_to user_path(@normal_user.id)
  end

  test "should show user when NORMAL" do
    login!(email: @normal_user.email, password: @normal_user.password)
    get user_url(@normal_user)
    assert_response :success
  end

  test "should get edit when NORMAL" do
    login!(email: @normal_user.email, password: @normal_user.password)
    get edit_user_url(@normal_user)
    assert_response :success
  end

  test "should update user when NORMAL" do
    login!(email: @normal_user.email, password: @normal_user.password)
    patch user_url(@normal_user), params: { user: { admin: @normal_user.admin, cv_link: @normal_user.cv_link, email: @normal_user.email, english_level: @normal_user.english_level, name: @normal_user.name, password: @normal_user.password, password_confirmation: @normal_user.password_confirmation, tecnic_knowledge: @normal_user.tecnic_knowledge } }
    assert_redirected_to user_path(@normal_user.id)
  end
  
  test "should NOT destroy user when NORMAL" do
    login!(email: @normal_user.email, password: @normal_user.password)
    delete user_url(@normal_user)

    assert_redirected_to user_path(@normal_user.id)
  end

  private
  
  def login!(email:, password:)
    post login_path,
      params: {
        email: email,
        password: password
      }
  end
end
