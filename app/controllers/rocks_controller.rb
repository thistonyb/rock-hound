class RocksController < ApplicationController

#If not authenticated send back to welcome/home page. Otherwise on to rocks/new view.
    def new 
        return if user_not_authenticated?
        @rock = Rock.new
    end
#If not authenticated send back to welcome/home page. Otherwise, create the rock and on to rock/show view.
    def create
        return if user_not_authenticated?
        @rock = Rock.new(rock_params)
        if @rock.valid? && @rock.save
            redirect_to rock_path(@rock)
        else
            render :new
        end
    end
#If not authenticated send back to welcome/home page. Otherwise on to rocks/index view.
    def index
        return if user_not_authenticated?
        @rocks = Rock.all
    end
#If not authenticated send back to welcome/home page. Otherwised on to rocks/show view.
    def show
        return if user_not_authenticated?
        @rock = Rock.find(params[:id])
    end

#Set up strong params for rock.
    private
    def rock_params
        params.require(:rock).permit(:name, :description, :location)
    end


end