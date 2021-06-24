class UsersController < ApplicationController
    before_action :current_user, only: [:edit, :update, :show]

    def index #needs view showing all users?
        @users = User.all
    end

    def new #signup
        @user = User.new
    end
    
    def create
        @user = User.create(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(current_user)
        else
            render :new, alert: "Sign-Up Unsuccessful, Please Try Again"
        end
    end

    def show #profile page
        if @user != nil
            render :show
        else
            redirect_to users_path, alert: "User not found"
        end
    end

    def edit
    end

    def update
        @user.update(user_params)
        if @user.valid?
            redirect_to user_path(@user)
        else
            render :edit
        end
    end

    def destroy
        session.clear
        redirect_to users_path
    end
    
    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :age, :skin_type)
    end

    def current_user
        @user = User.find_by(id: session[:user_id])
    end
    
end
