class JournalAuthorsController < ApplicationController
  before_action :set_journal_author, only: [:show, :edit, :update, :destroy]

  # GET /journal_authors
  # GET /journal_authors.json
  def index
    @journal_authors = JournalAuthor.all
  end

  # GET /journal_authors/1
  # GET /journal_authors/1.json
  def show
  end

  # GET /journal_authors/new
  def new
    @journal_author = JournalAuthor.new
  end

  # GET /journal_authors/1/edit
  def edit
  end

  # POST /journal_authors
  # POST /journal_authors.json
  def create
    @journal_author = JournalAuthor.new(journal_author_params)

    respond_to do |format|
      if @journal_author.save
        format.html { redirect_to @journal_author, notice: 'Journal author was successfully created.' }
        format.json { render action: 'show', status: :created, location: @journal_author }
      else
        format.html { render action: 'new' }
        format.json { render json: @journal_author.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /journal_authors/1
  # PATCH/PUT /journal_authors/1.json
  def update
    respond_to do |format|
      if @journal_author.update(journal_author_params)
        format.html { redirect_to @journal_author, notice: 'Journal author was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @journal_author.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /journal_authors/1
  # DELETE /journal_authors/1.json
  def destroy
    @journal_author.destroy
    respond_to do |format|
      format.html { redirect_to journal_authors_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_journal_author
      @journal_author = JournalAuthor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def journal_author_params
      params.require(:journal_author).permit(:journal_id, :first_name, :last_name)
    end
end
