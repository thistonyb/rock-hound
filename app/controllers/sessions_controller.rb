class SessionsController < ApplicationController

#Basic action for new
    def login
        @user = User.new
    end
#Create a new session, authenticate password, return to new (login) if false, set session user_id, 
#go to user/home if true
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