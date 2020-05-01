class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        user = User.new(user_params)

        if user.validate
            user.save

            session[:user_id] = user.id

            redirect_to hello_path
        else
            redirect_to signup_path
        end
    end

    def hello
    end

    private

    def user_params
        params.require(:user).permit(
            [
            :name,
            :password,
            :password_confirmation
            ]
        )
    end
end 