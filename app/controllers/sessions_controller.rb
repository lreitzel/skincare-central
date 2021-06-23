class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(email: params[:user][:email])
        @user = user.try(:authenticate, params[:user][:password])
        if @user
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to login_path, alert: "User not found"
        end
    end

    def destroy
    end
end