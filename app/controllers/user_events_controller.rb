class UserEventsController < ApplicationController
  def create
    @event= Event.find(params[:user_event][:event_id])
  end
end
