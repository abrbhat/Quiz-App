require 'test_helper'

class QuizViewLogsControllerTest < ActionController::TestCase
  setup do
    @quiz_view_log = quiz_view_logs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quiz_view_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quiz_view_log" do
    assert_difference('QuizViewLog.count') do
      post :create, quiz_view_log: { quiz_id: @quiz_view_log.quiz_id, viewer_id: @quiz_view_log.viewer_id }
    end

    assert_redirected_to quiz_view_log_path(assigns(:quiz_view_log))
  end

  test "should show quiz_view_log" do
    get :show, id: @quiz_view_log
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quiz_view_log
    assert_response :success
  end

  test "should update quiz_view_log" do
    patch :update, id: @quiz_view_log, quiz_view_log: { quiz_id: @quiz_view_log.quiz_id, viewer_id: @quiz_view_log.viewer_id }
    assert_redirected_to quiz_view_log_path(assigns(:quiz_view_log))
  end

  test "should destroy quiz_view_log" do
    assert_difference('QuizViewLog.count', -1) do
      delete :destroy, id: @quiz_view_log
    end

    assert_redirected_to quiz_view_logs_path
  end
end
