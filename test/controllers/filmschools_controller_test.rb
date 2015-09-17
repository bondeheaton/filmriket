require 'test_helper'

class FilmschoolsControllerTest < ActionController::TestCase
  setup do
    @filmschool = filmschools(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:filmschools)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create filmschool" do
    assert_difference('Filmschool.count') do
      post :create, filmschool: { description: @filmschool.description, title: @filmschool.title, videolink: @filmschool.videolink }
    end

    assert_redirected_to filmschool_path(assigns(:filmschool))
  end

  test "should show filmschool" do
    get :show, id: @filmschool
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @filmschool
    assert_response :success
  end

  test "should update filmschool" do
    patch :update, id: @filmschool, filmschool: { description: @filmschool.description, title: @filmschool.title, videolink: @filmschool.videolink }
    assert_redirected_to filmschool_path(assigns(:filmschool))
  end

  test "should destroy filmschool" do
    assert_difference('Filmschool.count', -1) do
      delete :destroy, id: @filmschool
    end

    assert_redirected_to filmschools_path
  end
end
