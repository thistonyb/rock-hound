class WelcomeController < ApplicationController

 #Checks if logged_in already, scopes recent rocks, find user
    def home
        already_logged_in?
    end
end