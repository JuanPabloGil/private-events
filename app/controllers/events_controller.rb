class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(events_params)
  end

  private
    def events_params
      params.require(:event).permit(:event_date, :description)
    end
end
