# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :log_in, :current_user, :log_out, :logged_in?, :attend?, :require_logged_in

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def upcoming_events
    upcoming = []
    @user.attended_events.each do |event|
      upcoming << event if event.event_date >= Time.zone.now
    end
    upcoming
  end

  def past_events
    past = []
    @user.attended_events.each do |event|
      past << event if event.event_date < Time.zone.now
    end
    past
  end

  def attend?(event)
    if current_user.user_events.find_by(event_id: event.id)
      true
    else
      false
    end
  end

  def require_logged_in
    return if logged_in?

    flash[:danger] = 'You must be logged in first'
    redirect_to login_path
  end
end
