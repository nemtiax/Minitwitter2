require 'test_helper'

class FollowerConnectionsControllerTest < ActionController::TestCase
  setup do
    @follower_connection = follower_connections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:follower_connections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create follower_connection" do
    assert_difference('FollowerConnection.count') do
      post :create, follower_connection: { followee_id: @follower_connection.followee_id, follower_id: @follower_connection.follower_id }
    end

    assert_redirected_to follower_connection_path(assigns(:follower_connection))
  end

  test "should show follower_connection" do
    get :show, id: @follower_connection
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @follower_connection
    assert_response :success
  end

  test "should update follower_connection" do
    patch :update, id: @follower_connection, follower_connection: { followee_id: @follower_connection.followee_id, follower_id: @follower_connection.follower_id }
    assert_redirected_to follower_connection_path(assigns(:follower_connection))
  end

  test "should destroy follower_connection" do
    assert_difference('FollowerConnection.count', -1) do
      delete :destroy, id: @follower_connection
    end

    assert_redirected_to follower_connections_path
  end
end
