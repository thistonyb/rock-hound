class RocksController < ApplicationController

#If not authenticated, send back to welcome/home page. Otherwise, make a new rock and on to rocks/new view.
    def new 
        return if user_not_authenticated?
        @rock = Rock.new
    end
#If not authenticated, send back to welcome/home page (Keep user from filling out form and coming back to 
#page later and submitting if they get logged out). Otherwise, create the rock and on to rock/show view.
    def create
        return if user_not_authenticated?
        @rock = Rock.new(rock_params)
        if @rock.valid? && @rock.save
            redirect_to rock_path(@rock)
        else
            render :new
        end
    end
#If not authenticated, send back to welcome/home page. Otherwise, grab all rocks and on to rocks/index view.
    def index
        return if user_not_authenticated?
        @rocks = Rock.all
    end
#If not authenticated, send back to welcome/home page. Otherwise, find rock and on to rocks/show view.
    def show
        return if user_not_authenticated?
        @rock = Rock.find(params[:id])
    end
#If not authenticated, send back to welcome/home page. Otherwise, find rock and on to rocks/edit view.
    def edit
        return if user_not_authenticated?
        @rock = Rock.find(params[:id])
    end
#If not authenticated, send back to welcome/home page. Otherwise, update rock and on to rocks/show view.
    def update
        return if user_not_authenticated?
        @rock = Rock.find(params[:id])
        if @rock.valid? && @rock.update(rock_params)
            redirect_to rock_path(@rock)
        else
            render :edit
        end
    end
#Set up strong params for rock.
    private
    def rock_params
        params.require(:rock).permit(:name, :description, :location)
    end


end