class UsersController < ApplicationController

#Basic action for new
    def new
    end
#Create a new user and redirect if not saved, set session id and go to home
    def create
        @user = User.create(user_params)
        return redirect_to controller: 'users', action: 'new' unless @user.save
        session[:user_id] = @user.id
        redirect_to controller: 'welcome', action: 'home'
    end
#Set up strong params for User
    private
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end