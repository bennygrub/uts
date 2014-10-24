require 'test_helper'

class JournalAuthorsControllerTest < ActionController::TestCase
  setup do
    @journal_author = journal_authors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:journal_authors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create journal_author" do
    assert_difference('JournalAuthor.count') do
      post :create, journal_author: { first_name: @journal_author.first_name, journal_id: @journal_author.journal_id, last_name: @journal_author.last_name }
    end

    assert_redirected_to journal_author_path(assigns(:journal_author))
  end

  test "should show journal_author" do
    get :show, id: @journal_author
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @journal_author
    assert_response :success
  end

  test "should update journal_author" do
    patch :update, id: @journal_author, journal_author: { first_name: @journal_author.first_name, journal_id: @journal_author.journal_id, last_name: @journal_author.last_name }
    assert_redirected_to journal_author_path(assigns(:journal_author))
  end

  test "should destroy journal_author" do
    assert_difference('JournalAuthor.count', -1) do
      delete :destroy, id: @journal_author
    end

    assert_redirected_to journal_authors_path
  end
end
