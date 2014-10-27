class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    @books = Book.all
  end

  # GET /books/1
  # GET /books/1.json
  def show
    #author_string
    author_count = @book.book_authors.count
    author_map = @book.book_authors.each_with_index.map{|a, i|
      if i < author_count -1
        if a.first_name.blank?
          "#{a.last_name} & "
        else
          "#{a.last_name}, #{a.first_name.first}. & "
        end
      else
        if a.first_name.blank?
          "#{a.last_name}"
        else
          "#{a.last_name}, #{a.first_name.first}."
        end
      end
    }.compact
    @author_string = author_map.join("")
    @be = "#{@book.book_edition}," unless @book.book_edition.blank?
    #@first = "#{@author_string} #{@book.publication_year.strftime('%Y')},"
    #@ital = @book.book_title#Applied solid mechanics
    #@rest = ", #{@book.book_edition}, #{@book.publisher_name}, #{@book.publisher_city}."
    @ref = "#{@author_string} #{@book.publication_year.strftime('%Y')}, <i>#{@book.book_title}</i>, #{@be} #{@book.publisher_name}, #{@book.publisher_city}."
  end

  # GET /books/new
  def new
    @book = Book.new
    @book.book_authors.build
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book}
        format.json { render action: 'show', status: :created, location: @book }
      else
        format.html { render action: 'new' }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:publication_year, :book_title, :book_edition, :publisher_name, :publisher_city,book_authors_attributes: [:id, :first_name, :_destroy, :last_name, :book_id])
    end
end
