class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :random]

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
    @random_user = User.where.not(id: @user.id).sample
    @like = Like.new
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :location, :pet_name, :pet_age, :pet_bio, :pet_pic)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
