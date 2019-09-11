module RocksHelper


    
#Create array of most recent rocks (last 3) as a string with name of rock and user name and returns it.
    def recent_rocks
        recent_rocks = Rock.most_recent(3)
        rock_user = {}
        recent_rocks.each do |rock|
            if rock_user[rock.user_id] == nil
                user = User.find_by_id(rock.user_id)
                rock_user[user.id] = user.name
            end
        end
        rock_list = []
        recent_rocks.each do |rock| 
            if rock.id != nil 
                rock_list << "#{rock.name}, found by #{rock_user[rock.user_id]}"  
            end
        end 
        return rock_list
    end
end