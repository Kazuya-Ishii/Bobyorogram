class FavoritesController < ApplicationController
  def index
    @favorite_topics = current_user.favorite_topics
  end

  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.topic_id = params[:topic_id]
#binding.pry
    if favorite.save
      redirect_to topics_path, success: 'あなたのParadiseに認定したよ＾＾'
    else
      redirect_to topics_path
    end
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id ,topic_id: params[:topic_id])
    favorite.destroy
    redirect_to topics_path, danger: 'あなたのParadiseには及ばないよ：（'
  end
end
