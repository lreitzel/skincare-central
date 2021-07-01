module ApplicationHelper
    
    
    def current_user
        User.find_by(id: session[:user_id])
    end

    def set_current_user
        @user = current_user
    end

    def logged_in
        !!session[:user_id]
    end

    def skin_types
        ["Normal", "Dry", "Oily", "Combination"]
    end

    def set_product
        @product = Product.find_by(id: params[:id])
    end

end
