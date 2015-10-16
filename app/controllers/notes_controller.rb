class NotesController < ApplicationController
  before_action :set_topic_note, only: [:show, :edit, :update, :destroy]

  # GET /notes
  def index
    set_topic
    @notes = @topic.notes
  end

  # GET /notes/1
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
  def create
    set_topic
    @note = @topic.notes.build(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to edit_topic_path(@topic), notice: 'Note was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /notes/1
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to edit_topic_path(@topic), notice: 'Note was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /notes/1
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to edit_topic_path(@topic), notice: 'Note was successfully destroyed.' }
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
      params.require(:note).permit(:title, :text, :encrypted_text, :type_id, :topic_attributes => [:id])
    end
end
