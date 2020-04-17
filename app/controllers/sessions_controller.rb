class SessionsController < ApplicationController 
    def create 
        if !params[:user][:name].empty?
            @user = User.find_by(name: params[:user][:name])
            # binding.pry
            return head(:forbidden) unless @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
        else 
            render :new
        end
            
    end
    
    def new 
        @user = User.new
    end

    private
 
    def session_params
        params.require(:user).permit(:name, :password)
      end
end