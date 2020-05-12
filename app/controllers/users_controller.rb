class UsersController < ApplicationController
    def new
    end
    
    def create
        user = User.new(post_params)
        if user.save
            session[:user_id] = user.id
        else
            redirect_to :new
        end
    end

    private

    def post_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end