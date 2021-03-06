
class RocksController < ApplicationController
    before_action :to_user_not_authenticated?, except: [:index, :show, :new]

#Make a new rock and on to rocks/new view.
    def new    
        @rock = Rock.new
    end
#If not authenticated, send back to welcome/home page (Keep user from filling out form and coming back to 
#page later and submitting if they get logged out). Otherwise, create the rock and on to rock/show view.
    def create
        @rock = current_user.rocks.build(rock_params)
        if @rock.valid? && @rock.save                 
            redirect_to rock_path(@rock)
        else
            render :new
        end
    end
#Grab all rocks and on to rocks/index view.
    def index
        @rocks = Rock.all
    end
#Find rock and on to rocks/show view. Also,
#access all the comment user_ids, put them in a hash, and send them in via @commnet_user.
    def show
        @rock = Rock.find(params[:id])
        @comment_user = {}
        @rock.comments.each do |comment|
            if @comment_user[comment.user_id] == nil
               user = User.find_by_id(comment.user_id)
               @comment_user[user.id] = user.name
            end
        end
    end
#If not authenticated, send back to welcome/home page. Otherwise, find all of current users rocks.
    def collection
        @rocks = current_user.rocks.all
    end
#If not authenticated, send back to welcome/home page. Otherwise, find rock make sure the user is the 
#owner of the rock - if not redirect to welcome, if so - on to edit view.
    def edit
        @rock = Rock.find(params[:id])
        if @rock.user != current_user
            redirect_to root_path
        end
    end
#If not authenticated, send back to welcome/home page. Otherwise, find rock, make sure the user is the 
#owner of the rock, rock updates and on to rocks/show view.
    def update
        @rock = Rock.find(params[:id])
        if @rock.user == current_user && @rock.valid? && @rock.update(rock_params)
            redirect_to rock_path(@rock)
        else
            render :edit
        end
    end
#If not authenticated, send back to welcome/home page. Otherwise, delete the rock and head to rocks/index view.
    def destroy
        @rock = Rock.find(params[:id])
        if @rock.user == current_user
            @rock.delete
            redirect_to collection_path(@rock.user)
        end
    end
#Set up strong params for rock.
    private
    def rock_params
        params.require(:rock).permit(:name, :description, :location, :user_id)
    end
end