class DislikesController < ApplicationController

  def create
    @dislike = Dislike.create(dislike_params)
    @user = params[:dislike][:user_id]
    redirect_to "/users/#{@user}/random"
  end

  def index
    @dislikes = Dislike.all
  end

  private

  def dislike_params
    params.require(:dislike).permit(:user_id, :dislikee_id)
  end

end
