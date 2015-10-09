class NotesController < ApplicationController
  before_action :set_topic_note, only: [:show, :edit, :update, :destroy]

  # GET /notes
  # GET /notes.json
  def index
    set_topic
    @notes = @topic.notes
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    set_topic
    @note = @topic.notes.build
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes
  # POST /notes.json
  def create
    set_topic
    @note = @topic.notes.build(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to topic_notes_path(@topic), notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: topic_notes_path(@topic) }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to topic_notes_path(@topic), notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: topic_notes_path(@topic) }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to topic_notes_path(@topic), notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_topic_note
      set_topic
      @note = Note.find(params[:id])
    end

    def set_topic
      @topic = Topic.find(params[:topic_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:title, :text, :type_id, :topic_attributes => [:id])
    end
end
