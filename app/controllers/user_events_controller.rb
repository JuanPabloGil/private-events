# frozen_string_literal: true

class UserEventsController < ApplicationController
  before_action :require_logged_in
  
  def create
    @event = Event.find(params[:user_event][:event_id])
    current_user.user_events.create!(event_id: @event.id)
    flash[:success] = 'You will attend'
    redirect_to event_path(@event)
  end

  def destroy
    @event = Event.find(params[:user_event][:event_id])
    @user_ev = current_user.user_events.find_by(event_id: @event.id)

    if @user_ev
      @user_ev.destroy
      flash[:danger] = 'Not Attend'
      redirect_to event_path(@event)
    else
      flash[:danger] = 'Not destroyed'
    end
  end
end
