class EventsController < ApplicationController

  def index
    @event = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(events_params)

    if @event.save
      flash[:success] = "Event created succesfully"
      redirect_to @event
    else
      render 'new'
    end
  end

  private
    def events_params
      params.require(:event).permit(:event_date, :desc)
    end
end
