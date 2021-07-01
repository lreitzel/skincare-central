class UsersController < ApplicationController
    helper_method :set_current_user
    before_action :set_current_user, only: [:edit, :update, :show, :destroy]


    def new #signup
        @user = User.new
    end
    
    def create
        @user = User.create(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(current_user)
        else
            flash[:alert] = "Sign-Up Unsuccessful, Please Try Again"
            render :new
        end
    end

    def show #profile page
        if @user != nil
            render :show
        else
            redirect_to root_path, alert: "User not found"
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
        @user.delete
        redirect_to root_path, alert: "Your account has been deleted"
    end
    
    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :age, :skin_type)
    end

    
end
