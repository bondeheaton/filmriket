require 'test_helper'

class ClubMoviesControllerTest < ActionController::TestCase
  setup do
    @club_movie = club_movies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:club_movies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create club_movie" do
    assert_difference('ClubMovie.count') do
      post :create, club_movie: { active: @club_movie.active, description: @club_movie.description, title: @club_movie.title, user_id: @club_movie.user_id, videolink: @club_movie.videolink }
    end

    assert_redirected_to club_movie_path(assigns(:club_movie))
  end

  test "should show club_movie" do
    get :show, id: @club_movie
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @club_movie
    assert_response :success
  end

  test "should update club_movie" do
    patch :update, id: @club_movie, club_movie: { active: @club_movie.active, description: @club_movie.description, title: @club_movie.title, user_id: @club_movie.user_id, videolink: @club_movie.videolink }
    assert_redirected_to club_movie_path(assigns(:club_movie))
  end

  test "should destroy club_movie" do
    assert_difference('ClubMovie.count', -1) do
      delete :destroy, id: @club_movie
    end

    assert_redirected_to club_movies_path
  end
end
