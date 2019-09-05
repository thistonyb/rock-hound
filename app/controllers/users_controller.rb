class UsersController < ApplicationController
    before_action :to_already_logged_in?, except: [:home, :show]

#New session is checked if user is logged in, if they are sent to users/home(show). If not create new user
#and send them on to users/new
    def new
        @user = User.new
    end
#Check if already logged in so they dont create a user while logged in. Create a new user and check if 
#valid and saves. Set session id (log user in) and go to users/home. Redirects back to new if not.
    def create
        @user = User.new(user_params)
        if @user.valid? && @user.save
            session[:user_id] = @user.id
            redirect_to home_path(@user)
        else
            render :new
        end  
    end
#If we dont have a user send them to root view. Otherwise, set @user if found and render users/home.
    def home
        user_not_authenticated?
        current_user
    end
#Set up strong params for User.
    private
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end