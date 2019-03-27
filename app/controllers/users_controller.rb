class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :random, :likes, :dislikes, :matches]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def random
    # if there are still users to show, create new dis/like
    # else send them to no matches page
    if @random_user = @user.users_not_seen_yet.sample
      @like = Like.new
      @dislike = Dislike.new
    else
      redirect_to @user
    end
  end

  def matches
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :location, :pet_name, :pet_age, :pet_bio, pet_pic: [])
  end

  def set_user
    @user = User.find(params[:id])
  end

end
