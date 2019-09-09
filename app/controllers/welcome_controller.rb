class WelcomeController < ApplicationController

 #Checks if logged_in already, scopes recent rocks, find user
    def home
        already_logged_in?
        @recent_rocks = Rock.most_recent(3)
        @rock_user = {}
        @recent_rocks.each do |rock|
            if @rock_user[rock.user_id] == nil
               user = User.find_by_id(rock.user_id)
               @rock_user[user.id] = user.name
            end
        end
    end
end