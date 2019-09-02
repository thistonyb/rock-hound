class SessionsController < ApplicationController

#Basic action for login(new) - check if already logged in, if so send to users/home, otherwised on to 
#session/create.
    def login
        return if already_logged_in?
        @user = User.new
    end
#Create a new session - authenticate password, set session user_id and go to user/home, otherwise render
#login again.
    def create
        @user = User.find_by(name: params[:user][:name])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to home_path(@user)
        else
            render :login
        end
    end
#Log out of session by deleting user id
    def destroy
        session[:user_id] = nil
        redirect_to root_path
    end
end