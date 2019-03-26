class LikesController < ApplicationController

  def create
    @like = Like.create(like_params)
    @user = params[:like][:liker_id]
    redirect_to "/users/#{@user}/random"
  end

  def index
    @likes = Like.all
  end

  private

  def like_params
    params.require(:like).permit(:liker_id, :likee_id)
  end

end
