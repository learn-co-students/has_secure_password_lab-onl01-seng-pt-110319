class SessionsController < ApplicationController

  def create
#    binding.pry
    @user = User.find_by(name: user_params[:name])
    if @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:message] = "Wrong Username or password"
      redirect_to login_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to login_path
  end
end
