class LikesController < ApplicationController

  def create
    # user clicks like, creates and saves new like instance
    @like = Like.create(like_params)

    # finds user object and likee object
    @user = User.find(params[:like][:user_id])
    @likee = User.find(params[:like][:likee_id])

    # if it's a match, redirect to new match page, else keep going
    if @user.get_matches.include?(@likee)
      redirect_to "/users/#{@user.id}/new_match/#{@likee.id}"
    else
      redirect_to "/users/#{@user.id}/random"
    end

  end

  def index
    @likes = Like.all
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :likee_id)
  end

end
