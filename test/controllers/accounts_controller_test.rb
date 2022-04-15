require "test_helper"

class AccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @account = accounts(:one)
    @admin_user = users(:admin)
    @normal_user = users(:normal)
  end

  test "should redirect to login when no user" do
    get accounts_url
    assert_redirected_to login_path
  end
  
  test "should get index when ADMIN" do
    login!(email: @admin_user.email, password: @admin_user.password)  
    get accounts_url
    assert_response :success
  end

  test "should get new when ADMIN" do
    login!(email: @admin_user.email, password: @admin_user.password)
    get new_account_url
    assert_response :success
  end

  test "should create account when ADMIN" do
    login!(email: @admin_user.email, password: @admin_user.password)
    assert_difference("Account.count") do
      post accounts_url, params: { account: { client_name: @account.client_name, name: @account.name, operation_manager_name: @account.operation_manager_name } }
    end

    assert_redirected_to account_url(Account.last)
  end

  test "should show account when ADMIN" do
    login!(email: @admin_user.email, password: @admin_user.password)
    get account_url(@account)
    assert_response :success
  end

  test "should get edit when ADMIN" do
    login!(email: @admin_user.email, password: @admin_user.password)
    get edit_account_url(@account)
    assert_response :success
  end

  test "should update account when ADMIN" do
    login!(email: @admin_user.email, password: @admin_user.password)
    patch account_url(@account), params: { account: { client_name: @account.client_name, name: @account.name, operation_manager_name: @account.operation_manager_name } }
    assert_redirected_to account_url(@account)
  end

  test "should destroy account when ADMIN" do
    login!(email: @admin_user.email, password: @admin_user.password)
    assert_difference("Account.count", -1) do
      delete account_url(@account)
    end

    assert_redirected_to accounts_url
  end

  test "should NOT get index when NORMAL" do
    login!(email: @normal_user.email, password: @normal_user.password)  
    get accounts_url
    assert_redirected_to user_path(@normal_user.id)
  end

  test "should NOT get new when NORMAL" do
    login!(email: @normal_user.email, password: @normal_user.password)  
    get new_account_url
    assert_redirected_to user_path(@normal_user.id)
  end

  test "should NOT create account when NORMAL" do
    login!(email: @normal_user.email, password: @normal_user.password)
    post accounts_url, params: { account: { client_name: @account.client_name, name: @account.name, operation_manager_name: @account.operation_manager_name } }

    assert_redirected_to user_path(@normal_user.id)
  end

  test "should NOT show account when NORMAL" do
    login!(email: @normal_user.email, password: @normal_user.password)
    get account_url(@account)
    
    assert_redirected_to user_path(@normal_user.id)
  end

  test "should NOT get edit when NORMAL" do
    login!(email: @normal_user.email, password: @normal_user.password)
    get edit_account_url(@account)
    
    assert_redirected_to user_path(@normal_user.id)
  end

  test "should NOT update account when NORMAL" do
    login!(email: @normal_user.email, password: @normal_user.password)
    patch account_url(@account), params: { account: { client_name: @account.client_name, name: @account.name, operation_manager_name: @account.operation_manager_name } }
    
    assert_redirected_to user_path(@normal_user.id)
  end

  test "should NOT destroy account when NORMAL" do
    login!(email: @normal_user.email, password: @normal_user.password)
    delete account_url(@account)

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
