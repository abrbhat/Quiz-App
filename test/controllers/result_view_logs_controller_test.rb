require 'test_helper'

class ResultViewLogsControllerTest < ActionController::TestCase
  setup do
    @result_view_log = result_view_logs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:result_view_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create result_view_log" do
    assert_difference('ResultViewLog.count') do
      post :create, result_view_log: { result_id: @result_view_log.result_id, viewer_id: @result_view_log.viewer_id }
    end

    assert_redirected_to result_view_log_path(assigns(:result_view_log))
  end

  test "should show result_view_log" do
    get :show, id: @result_view_log
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @result_view_log
    assert_response :success
  end

  test "should update result_view_log" do
    patch :update, id: @result_view_log, result_view_log: { result_id: @result_view_log.result_id, viewer_id: @result_view_log.viewer_id }
    assert_redirected_to result_view_log_path(assigns(:result_view_log))
  end

  test "should destroy result_view_log" do
    assert_difference('ResultViewLog.count', -1) do
      delete :destroy, id: @result_view_log
    end

    assert_redirected_to result_view_logs_path
  end
end
