require 'test_helper'

class ChaptersControllerTest < ActionController::TestCase
  setup do
    @chapter = chapters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chapters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chapter" do
    assert_difference('Chapter.count') do
      post :create, chapter: { book_edition: @chapter.book_edition, book_name: @chapter.book_name, chapter_title: @chapter.chapter_title, page_range_end: @chapter.page_range_end, page_range_start: @chapter.page_range_start, publication_year: @chapter.publication_year, publisher_city: @chapter.publisher_city, publisher_name: @chapter.publisher_name }
    end

    assert_redirected_to chapter_path(assigns(:chapter))
  end

  test "should show chapter" do
    get :show, id: @chapter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chapter
    assert_response :success
  end

  test "should update chapter" do
    patch :update, id: @chapter, chapter: { book_edition: @chapter.book_edition, book_name: @chapter.book_name, chapter_title: @chapter.chapter_title, page_range_end: @chapter.page_range_end, page_range_start: @chapter.page_range_start, publication_year: @chapter.publication_year, publisher_city: @chapter.publisher_city, publisher_name: @chapter.publisher_name }
    assert_redirected_to chapter_path(assigns(:chapter))
  end

  test "should destroy chapter" do
    assert_difference('Chapter.count', -1) do
      delete :destroy, id: @chapter
    end

    assert_redirected_to chapters_path
  end
end
