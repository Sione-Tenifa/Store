class TopicsController < ApplicationController
  before_action :set_store
  before_action :set_topics, only: [:show, :edit, :update, :destroy]
  
  def index
    @topics = @store.topics
  end

  def show
  end

  def new
    @topic = @store.topics.new
    render partial: "form"
  end

  def edit
    render partial: "form"
  end

  def create
    @topic = @sstore.topics.new(topic_params)

    if @topic.save
      redirect_to [@store, @topic]
    else
      render :new
    end
  end

  def update
    if @topic.update(topic_params)
      redirect_to [@store, @topic]
    else
      render :edit
    end
  end

  def destroy
    @topic.destroy
    redirect_to store_topics_path
  end

  private
    def set_store
      @store = Store.find(params[:store_id])
    end

    def set_topic
      @topic = Topic.find(params[:id])
    end

    def topic_params
      params.require(:topic).permit(:name, :body)
    end
end
