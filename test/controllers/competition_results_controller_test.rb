require 'test_helper'

class CompetitionResultsControllerTest < ActionController::TestCase
  setup do
    @competition_result = competition_results(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:competition_results)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create competition_result" do
    assert_difference('CompetitionResult.count') do
      post :create, competition_result: { answers: @competition_result.answers, competition_id: @competition_result.competition_id, score: @competition_result.score, user_id: @competition_result.user_id }
    end

    assert_redirected_to competition_result_path(assigns(:competition_result))
  end

  test "should show competition_result" do
    get :show, id: @competition_result
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @competition_result
    assert_response :success
  end

  test "should update competition_result" do
    patch :update, id: @competition_result, competition_result: { answers: @competition_result.answers, competition_id: @competition_result.competition_id, score: @competition_result.score, user_id: @competition_result.user_id }
    assert_redirected_to competition_result_path(assigns(:competition_result))
  end

  test "should destroy competition_result" do
    assert_difference('CompetitionResult.count', -1) do
      delete :destroy, id: @competition_result
    end

    assert_redirected_to competition_results_path
  end
end
