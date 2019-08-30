class SessionsController < ApplicationController

#Basic action for new
    def new
    end
#Create a new session, authenticate password, return to new (login) if false, set session user_id, 
#go to home if true
    def create
        user = User.find_by(name: params[:user][:name])
        user = user.try(:authenticate, params[:user][:password])
        return redirect_to(controller: 'sessions', action: 'new') unless user
        session[:user_id] = user.id
        @user = user
        redirect_to controller: 'users', action: 'home'
    end
#Log out of session by deleting user id
    def destroy
        session.delete :user_id
        redirect_to '/'
    end
end