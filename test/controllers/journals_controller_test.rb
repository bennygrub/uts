require 'test_helper'

class JournalsControllerTest < ActionController::TestCase
  setup do
    @journal = journals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:journals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create journal" do
    assert_difference('Journal.count') do
      post :create, journal: { article_title: @journal.article_title, journal_number: @journal.journal_number, journal_title: @journal.journal_title, journal_volume: @journal.journal_volume, page_range_end: @journal.page_range_end, page_range_start: @journal.page_range_start, publication_year: @journal.publication_year }
    end

    assert_redirected_to journal_path(assigns(:journal))
  end

  test "should show journal" do
    get :show, id: @journal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @journal
    assert_response :success
  end

  test "should update journal" do
    patch :update, id: @journal, journal: { article_title: @journal.article_title, journal_number: @journal.journal_number, journal_title: @journal.journal_title, journal_volume: @journal.journal_volume, page_range_end: @journal.page_range_end, page_range_start: @journal.page_range_start, publication_year: @journal.publication_year }
    assert_redirected_to journal_path(assigns(:journal))
  end

  test "should destroy journal" do
    assert_difference('Journal.count', -1) do
      delete :destroy, id: @journal
    end

    assert_redirected_to journals_path
  end
end
