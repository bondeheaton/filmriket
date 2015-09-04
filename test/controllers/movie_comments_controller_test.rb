require 'test_helper'

class MovieCommentsControllerTest < ActionController::TestCase
  setup do
    @movie_comment = movie_comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:movie_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create movie_comment" do
    assert_difference('MovieComment.count') do
      post :create, movie_comment: { message: @movie_comment.message, movie_id: @movie_comment.movie_id, user_id: @movie_comment.user_id }
    end

    assert_redirected_to movie_comment_path(assigns(:movie_comment))
  end

  test "should show movie_comment" do
    get :show, id: @movie_comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @movie_comment
    assert_response :success
  end

  test "should update movie_comment" do
    patch :update, id: @movie_comment, movie_comment: { message: @movie_comment.message, movie_id: @movie_comment.movie_id, user_id: @movie_comment.user_id }
    assert_redirected_to movie_comment_path(assigns(:movie_comment))
  end

  test "should destroy movie_comment" do
    assert_difference('MovieComment.count', -1) do
      delete :destroy, id: @movie_comment
    end

    assert_redirected_to movie_comments_path
  end
end
