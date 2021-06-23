class UsersController < ApplicationController

    def index #needs view showing all users?
    end

    def new #signup
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

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :age, :skin_type)
    end
    
end
