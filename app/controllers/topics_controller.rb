class TopicsController < ApplicationController
  def index
    @topics = Topic.all.includes(:users)
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.new(topic_params)

    if @topic.save
      redirect_to topics_path, success: 'Paradiseな画像だね！'
    else
      flash.now[:danger] = 'この画像には、Paradiseが足りないないぞ！'
      render :new
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:image, :description)
  end
end
