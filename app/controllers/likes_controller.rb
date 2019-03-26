class LikesController < ApplicationController

  def create
    @like = Like.create(like_params)
    @user = params[:like][:user_id]
    redirect_to "/users/#{@user}/random"
  end

  def index
    @likes = Like.all
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :likee_id)
  end

end
