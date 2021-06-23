module ApplicationHelper

    def full_name
        @user.first_name + @user.last_name
    end

    def skin_types
        ["Normal", "Dry", "Oily", "Combination"]
    end
end
