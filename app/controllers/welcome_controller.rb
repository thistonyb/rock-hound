class WelcomeController < ApplicationController

 #Basic action for home  
    def home
        already_logged_in?
    end
end