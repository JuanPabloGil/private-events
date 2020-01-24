class ApplicationController < ActionController::Base
  helper_method :log_in, :current_user, :log_out, :logged_in?

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
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

end
