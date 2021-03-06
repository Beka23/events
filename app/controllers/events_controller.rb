class EventsController < ApplicationController
    skip_before_action :authorized, only: [:index, :show]
    
    def index
        @events = Event.all
    end

    def show
        @event = Event.find(params[:id])
    end


    def new
        @event = Event.new
    end

    def create
        event = Event.create(event_params)
    end

    

    private
    def event_params
        params.require(:event).permit(:title, :description, :max_people)
    end
    
end
