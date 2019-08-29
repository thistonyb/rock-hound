class WelcomeController < ApplicationController
    before_action :require_logged_in

 #Basic action for home  
    def home
    end
end