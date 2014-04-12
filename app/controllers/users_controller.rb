class UsersController < ApplicationController

  before_filter :authorize_owner, only: [:new, :index, :create, :edit, :update, :delete]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User created"
      redirect_to users_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :role)
  end

end
