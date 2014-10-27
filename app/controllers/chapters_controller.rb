class ChaptersController < ApplicationController
  before_action :set_chapter, only: [:show, :edit, :update, :destroy]

  # GET /chapters
  # GET /chapters.json
  def index
    @chapters = Chapter.all
  end

  # GET /chapters/1
  # GET /chapters/1.json
  def show
    #author_string
    author_count = @chapter.chapter_authors.count
    author_map = @chapter.chapter_authors.each_with_index.map{|a, i|
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
    
    if (@chapter.page_range_end.to_i - @chapter.page_range_start.to_i) < 100
      top = @chapter.page_range_end
    else
      top = @chapter.page_range_end
    end

    @be = "in #{@chapter.book_edition},&nbsp;" unless @chapter.book_edition.blank?

    #@first = "#{@author_string} #{@chapter.publication_year.strftime('%Y')}, '#{@chapter.chapter_title}', in #{@chapter.book_edition},"
    #@ital = "#{@chapter.book_name},"
    #@rest = "#{@chapter.publisher_name}, #{@chapter.publisher_city}, pp. #{@chapter.page_range_start}-#{top}."
    @ref = "#{@author_string} #{@chapter.publication_year.strftime('%Y')}, '#{@chapter.chapter_title}', #{@be}<i>#{@chapter.book_name}</i>, #{@chapter.publisher_name}, #{@chapter.publisher_city}, pp. #{@chapter.page_range_start}-#{top}."
  end

  # GET /chapters/new
  def new
    @chapter = Chapter.new
    @chapter.chapter_authors.build
  end

  # GET /chapters/1/edit
  def edit
  end

  # POST /chapters
  # POST /chapters.json
  def create
    @chapter = Chapter.new(chapter_params)

    respond_to do |format|
      if @chapter.save
        format.html { redirect_to @chapter }
        format.json { render action: 'show', status: :created, location: @chapter }
      else
        format.html { render action: 'new' }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chapters/1
  # PATCH/PUT /chapters/1.json
  def update
    respond_to do |format|
      if @chapter.update(chapter_params)
        format.html { redirect_to @chapter, notice: 'Chapter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chapters/1
  # DELETE /chapters/1.json
  def destroy
    @chapter.destroy
    respond_to do |format|
      format.html { redirect_to chapters_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chapter
      @chapter = Chapter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chapter_params
      params.require(:chapter).permit(:publication_year, :book_name, :book_edition, :chapter_title, :publisher_name, :publisher_city, :page_range_start, :page_range_end, chapter_authors_attributes: [:id, :first_name, :_destroy, :last_name, :chapter_id])
    end
end
