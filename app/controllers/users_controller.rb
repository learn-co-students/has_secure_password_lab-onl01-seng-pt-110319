class UsersController < ApplicationController
    def new
    end

    def create
        @user = User.create(user_params)
        return redirect_to new_user_path unless @user.save
        session[:user_id] = @user.id
        redirect_to root_path
        # if @user.save
        #     session[:user_id] = @user.id
        #  elsif !@user.save
        #      redirect_to new_user_path
        #  else
        #     redirect_to controller: 'welcome', action: 'home'
        #  end
    end

    private
    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
