class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :random, :likes]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.pet_pic.attach(params[:user][:pet_pic])

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
    @random_user = User.all_except(@user).sample
    
    if
      @random_user = User.all_except(@user).sample
      @like = Like.new
    else
      redirect_to @user
    end

  end

  def likes
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :location, :pet_name, :pet_age, :pet_bio, :pet_pic)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def get_likee_id
    @user.likes.each do |likes|
      likee_id = likes.likee_id
    end
  end

end
