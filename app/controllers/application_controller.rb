class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user, :logged_in?, :user_authenticated

#If current user is nil it is assigned the User found by session if there is a session id
    def current_user
        @user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
#Is there a current user - true/false
    def logged_in?
        !!current_user
    end
#Redirect to welcome/home if we dont have a user logged in
    def user_not_authenticated?
        if !logged_in?
            redirect_to root_path
            return true
        end
        return false
    end
#If already logged in send them to their home page
    def already_logged_in?
        if logged_in?
            redirect_to home_path(current_user)
            return true
        end
        return false
    end
end
