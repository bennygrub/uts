class ChapterAuthorsController < ApplicationController
  before_action :set_chapter_author, only: [:show, :edit, :update, :destroy]

  # GET /chapter_authors
  # GET /chapter_authors.json
  def index
    @chapter_authors = ChapterAuthor.all
  end

  # GET /chapter_authors/1
  # GET /chapter_authors/1.json
  def show
  end

  # GET /chapter_authors/new
  def new
    @chapter_author = ChapterAuthor.new
  end

  # GET /chapter_authors/1/edit
  def edit
  end

  # POST /chapter_authors
  # POST /chapter_authors.json
  def create
    @chapter_author = ChapterAuthor.new(chapter_author_params)

    respond_to do |format|
      if @chapter_author.save
        format.html { redirect_to @chapter_author, notice: 'Chapter author was successfully created.' }
        format.json { render action: 'show', status: :created, location: @chapter_author }
      else
        format.html { render action: 'new' }
        format.json { render json: @chapter_author.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chapter_authors/1
  # PATCH/PUT /chapter_authors/1.json
  def update
    respond_to do |format|
      if @chapter_author.update(chapter_author_params)
        format.html { redirect_to @chapter_author, notice: 'Chapter author was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @chapter_author.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chapter_authors/1
  # DELETE /chapter_authors/1.json
  def destroy
    @chapter_author.destroy
    respond_to do |format|
      format.html { redirect_to chapter_authors_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chapter_author
      @chapter_author = ChapterAuthor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chapter_author_params
      params.require(:chapter_author).permit(:chapter_id, :first_name, :last_name)
    end
end
