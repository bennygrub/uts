require 'test_helper'

class ChapterAuthorsControllerTest < ActionController::TestCase
  setup do
    @chapter_author = chapter_authors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chapter_authors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chapter_author" do
    assert_difference('ChapterAuthor.count') do
      post :create, chapter_author: { chapter_id: @chapter_author.chapter_id, first_name: @chapter_author.first_name, last_name: @chapter_author.last_name }
    end

    assert_redirected_to chapter_author_path(assigns(:chapter_author))
  end

  test "should show chapter_author" do
    get :show, id: @chapter_author
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chapter_author
    assert_response :success
  end

  test "should update chapter_author" do
    patch :update, id: @chapter_author, chapter_author: { chapter_id: @chapter_author.chapter_id, first_name: @chapter_author.first_name, last_name: @chapter_author.last_name }
    assert_redirected_to chapter_author_path(assigns(:chapter_author))
  end

  test "should destroy chapter_author" do
    assert_difference('ChapterAuthor.count', -1) do
      delete :destroy, id: @chapter_author
    end

    assert_redirected_to chapter_authors_path
  end
end
