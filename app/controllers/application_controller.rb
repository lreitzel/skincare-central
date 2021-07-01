class ApplicationController < ActionController::Base

    include ApplicationHelper
    helper_method :current_user, :set_current_user, :logged_in, :set_product, :require_login, :set_review

end
