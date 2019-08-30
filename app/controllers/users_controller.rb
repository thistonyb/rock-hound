require 'pry'
class UsersController < ApplicationController
    before_action :require_logged_in, only: [:home]
#Basic action for home
    def home
    end
#Basic action for new
    def new
        if logged_in? 
            redirect_to home_path(current_user) 
        else 
            @user = User.new
            render :new 
        end 
    end
#Create a new user and redirect if not saved, set session id and go to users/home
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to home_path
        else
            render :new
        end  
    end

#Set up strong params for User
    private
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end