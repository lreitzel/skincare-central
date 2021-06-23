class UsersController < ApplicationController
    before_action :current_user, only: [:edit, :update]

    def index #needs view showing all users?
        @users = User.all
    end

    def new #signup
        @user = User.new
    end
    
    def create
    end

    def show #profile page
    end

    def edit
    end

    def update
    end

    def destroy
    end
    
    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :age, :skin_type)
    end

    def current_user
        @user = User.find_by(id: session[:user_id])
    end
    
end
