require 'test_helper'

class OptionSelectLogsControllerTest < ActionController::TestCase
  setup do
    @option_select_log = option_select_logs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:option_select_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create option_select_log" do
    assert_difference('OptionSelectLog.count') do
      post :create, option_select_log: { option_id: @option_select_log.option_id, viewer_id: @option_select_log.viewer_id }
    end

    assert_redirected_to option_select_log_path(assigns(:option_select_log))
  end

  test "should show option_select_log" do
    get :show, id: @option_select_log
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @option_select_log
    assert_response :success
  end

  test "should update option_select_log" do
    patch :update, id: @option_select_log, option_select_log: { option_id: @option_select_log.option_id, viewer_id: @option_select_log.viewer_id }
    assert_redirected_to option_select_log_path(assigns(:option_select_log))
  end

  test "should destroy option_select_log" do
    assert_difference('OptionSelectLog.count', -1) do
      delete :destroy, id: @option_select_log
    end

    assert_redirected_to option_select_logs_path
  end
end
