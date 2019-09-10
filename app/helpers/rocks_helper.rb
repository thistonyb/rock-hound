module RocksHelper


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
                rock_list << "A #{rock.name}, found by #{rock_user[rock.user_id]}"  
            end
        end 
        return display_list(rock_list)
    end

    def display_list(list)
        list.each do |ele|
            "#{ele}<br></br>".html_safe
        end
    end
end