class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :random,
    :likes, :dislikes, :matches, :profile, :new_match, :no_matches]
  before_action :already_logged_in, only: [:new, :create]
  skip_before_action :authenticate_user, only: [:new, :create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}/profile"
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to "/users/#{@user.id}/profile"
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
      redirect_to "/users/#{@user.id}/no_matches"
    end
  end

  def new_match
    @likee = User.find(params[:likee_id])
  end

  def destroy
    @user.delete
    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :email, :location, :pet_name, :pet_age, :pet_bio, pet_pic: [])
  end

  def set_user
    @user = User.find(params[:id])
  end

end
