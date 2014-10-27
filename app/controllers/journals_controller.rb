class JournalsController < ApplicationController
  before_action :set_journal, only: [:show, :edit, :update, :destroy]

  # GET /journals
  # GET /journals.json
  def index
    @journals = Journal.all
  end

  # GET /journals/1
  # GET /journals/1.json
  def show
    author_count = @journal.journal_authors.count
    author_map = @journal.journal_authors.each_with_index.map{|a, i|
      if i == 0
        if a.first_name.blank?
          "#{a.last_name}"
        else
          "#{a.last_name}, #{a.first_name.first}."
        end
      elsif i < author_count -2
        if a.first_name.blank?
          ", #{a.last_name}"
        else
          ", #{a.last_name}, #{a.first_name.first}."
        end
      else
        if a.first_name.blank?
          "&nbsp;& #{a.last_name},"
        else
          "&nbsp;& #{a.last_name}, #{a.first_name.first}. "
        end
      end
    }.compact
    @author_string = author_map.join("")
    top = @journal.page_range_end
    #@first = "#{@author_string} #{@journal.publication_year.strftime('%Y')}, '#{@journal.article_title}',"
    #@ital = "#{@journal.journal_title},"
    #@rest = "vol. #{@journal.journal_volume}, no. #{@journal.journal_number}, pp. #{@journal.page_range_start}-#{top}."
    @ref = "#{@author_string} #{@journal.publication_year.strftime('%Y')}, '#{@journal.article_title}', <i>#{@journal.journal_title}</i>, vol. #{@journal.journal_volume}, no. #{@journal.journal_number}, pp. #{@journal.page_range_start}-#{top}."
  end

  # GET /journals/new
  def new
    @journal = Journal.new
    @journal.journal_authors.build
  end

  # GET /journals/1/edit
  def edit
  end

  # POST /journals
  # POST /journals.json
  def create
    @journal = Journal.new(journal_params)

    respond_to do |format|
      if @journal.save
        format.html { redirect_to @journal }
        format.json { render action: 'show', status: :created, location: @journal }
      else
        format.html { render action: 'new' }
        format.json { render json: @journal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /journals/1
  # PATCH/PUT /journals/1.json
  def update
    respond_to do |format|
      if @journal.update(journal_params)
        format.html { redirect_to @journal, notice: 'Journal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @journal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /journals/1
  # DELETE /journals/1.json
  def destroy
    @journal.destroy
    respond_to do |format|
      format.html { redirect_to journals_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_journal
      @journal = Journal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def journal_params
      params.require(:journal).permit(:publication_year, :article_title, :journal_title, :journal_volume, :journal_number, :page_range_start, :page_range_end, journal_authors_attributes: [:id, :first_name, :_destroy, :last_name, :journal_id])
    end
end
