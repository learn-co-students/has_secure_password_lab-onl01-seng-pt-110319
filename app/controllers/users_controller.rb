class UsersController < ApplicationController
  before_action :new_user, only: [:new, :login]
  def new
    @user=User.new
  end

  def create
    if params[:user][:password]==params[:user][:password_confirmation]
      @user = User.create(user_params)
      session[:user_id] = @user.id
      redirect_to login_path
    else
      flash[:message] = "Password doesn't match"
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(session[:user_id])
  end

  def login
  end

  private
    def new_user
      @user=User.new
    end
end
