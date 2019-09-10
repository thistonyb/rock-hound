class WelcomeController < ApplicationController

 #Checks if logged_in already
    def home
        already_logged_in?
    end
end