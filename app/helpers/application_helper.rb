module ApplicationHelper

    # def full_name
    #     @user.first_name + @user.last_name
    # end

    def current_user
        User.find_by(id: session[:user_id])
    end

    def set_current_user
        @user = current_user
    end

    def skin_types
        ["Normal", "Dry", "Oily", "Combination"]
    end
end
