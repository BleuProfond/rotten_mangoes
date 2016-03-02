class Admin::UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @users = User.all.page(params[:page]).per(2)
  end

  def create
    @user = User.new(user_params)
      if @user.save
      redirect_to movies_path
    else
      render :new
    end
  end

  protected

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, :admin)
  end

end