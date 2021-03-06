class SessionsController < ApplicationController

    def homepage
    end

    def new
    end

    def create
        user = User.find_by(email: params[:user][:email])
        @user = user.try(:authenticate, params[:user][:password])
        if @user
            session[:user_id] = @user.id
            redirect_to user_path(@user), alert: "Login Successful!"
        else
            redirect_to login_path, alert: "Login Unsuccessful, Try Again"
        end
    end

    def omniauth
        @user = User.from_omniauth(request.env['omniauth.auth'])
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to login_path
        end
    end

    def destroy
        session.clear
        redirect_to root_path, alert: "You have logged out!"
    end
end