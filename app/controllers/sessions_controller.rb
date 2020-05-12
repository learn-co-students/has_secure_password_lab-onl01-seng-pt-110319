class SessionsController < ApplicationController
    def new
    end
    
    def create
        user = User.find_by(name: params[:user][:name])
        user_is_authenticated = user.try(:authenticate, params[:user][:password])
        
        if user_is_authenticated
            session[:user_id] = user.id
        else
            redirect_to :new
        end
    end
end