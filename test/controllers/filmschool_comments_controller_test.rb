require 'test_helper'

class FilmschoolCommentsControllerTest < ActionController::TestCase
  setup do
    @filmschool_comment = filmschool_comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:filmschool_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create filmschool_comment" do
    assert_difference('FilmschoolComment.count') do
      post :create, filmschool_comment: { filmschool_id: @filmschool_comment.filmschool_id, message: @filmschool_comment.message, user_id: @filmschool_comment.user_id }
    end

    assert_redirected_to filmschool_comment_path(assigns(:filmschool_comment))
  end

  test "should show filmschool_comment" do
    get :show, id: @filmschool_comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @filmschool_comment
    assert_response :success
  end

  test "should update filmschool_comment" do
    patch :update, id: @filmschool_comment, filmschool_comment: { filmschool_id: @filmschool_comment.filmschool_id, message: @filmschool_comment.message, user_id: @filmschool_comment.user_id }
    assert_redirected_to filmschool_comment_path(assigns(:filmschool_comment))
  end

  test "should destroy filmschool_comment" do
    assert_difference('FilmschoolComment.count', -1) do
      delete :destroy, id: @filmschool_comment
    end

    assert_redirected_to filmschool_comments_path
  end
end
