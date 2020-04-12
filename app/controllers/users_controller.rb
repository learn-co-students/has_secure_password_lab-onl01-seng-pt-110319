class UsersController < ApplicationController

    def new 

    end

    def create 
        user = User.new(user_params)
        user.save
        redirect_to new_user_path unless user.authenticate(params[:password])
        session[:user_id] = user.id
    end

    private

    def user_params 
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
