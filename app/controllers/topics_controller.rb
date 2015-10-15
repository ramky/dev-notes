class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  # GET /topics
  def index
    @topics = Topic.all
  end

  # GET /topics/1
  def show
  end

  # GET /topics/new
  def new
    @topic = Topic.new
  end

  # GET /topics/1/edit
  def edit
    @notes = @topic.notes
  end

  # POST /topics
  def create
    @topic = Topic.new(topic_params)

    respond_to do |format|
      if @topic.save
        format.html { redirect_to root_path, notice: 'Topic was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /topics/1
  def update
    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to edit_topic_path(@topic), notice: 'Topic was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /topics/1
  def destroy
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Topic was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params.require(:topic).permit(:name, :description, :type_id)
    end
end
