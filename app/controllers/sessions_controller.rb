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
            redirect_to user_path(@user)
        else
            redirect_to login_path, alert: "User not found"
        end
    end

    def omniauth
        @user = User.find_or_create_by(uid: request.env['omniauth.auth']['uid']) do |user|
            user.email = ['omniauth.auth']['info']['email']
            user.first_name = ['omniauth.auth']['info']['first_name']
            user.last_name = ['omniauth.auth']['info']['last_name']
        end
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to login_path
        end
    end

    def destroy
        session.clear
        redirect_to root_path
    end
end