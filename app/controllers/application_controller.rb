class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :current_user
#Get the current user by session user_id or a new user that's created
    def current_user
        @user = (User.find_by(id: session[:user_id]) || User.new)
    end
#Make sure we have a user id
    def logged_in?
        current_user.id != nil
    end
#Redirect if we dont have an user id
    def require_logged_in
        return redirect_to(controller 'sessions', action: 'new') unless logged_in?
    end
end
