class SessionsController < ApplicationController

#Basic action for login(new) - check if already logged in, if so send to users/home, otherwised on to 
#session/create.
    def login
        already_logged_in?
        @user = User.new
    end
#Find user and create a new session - authenticate password, set session user_id and go to user/home, 
#otherwise render login again.
    def create
        @user = User.find_by(name: params[:user][:name])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to home_path(@user)
        else
            render :login
        end
    end

    def facebook_create
        @new_user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.image = auth['info']['image']
            u.password = User.generic_password
        end
        @new_user.save
        session[:user_id] = @new_user.id  
        redirect_to home_path(@new_user)
    end
#Log out of session by deleting user id
    def destroy
        session[:user_id] = nil
        redirect_to root_path
    end

    private
    def auth
        request.env['omniauth.auth']
    end
end