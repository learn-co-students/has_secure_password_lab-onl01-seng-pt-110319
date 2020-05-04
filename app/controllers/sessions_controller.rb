class SessionsController < ApplicationController

    def create
        @user = User.find_by(name: params[:user][:name])
        authenticated = @user.try(:authenticate, params[:user][:password])
        return redirect_to controller: 'sessions', action: 'new' unless authenticated
        session[:user_id] = @user.id
    end

    private

end
