class UserEventsController < ApplicationController
  def create
    @event = Event.find(params[:user_event][:event_id])
    current_user.user_events.create!(event_id: @event.id)
    flash[:success] = "You will attend"
    redirect_to event_path(@event)
  end
end
#Object.create(:foo => 'bar')
