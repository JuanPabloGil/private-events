class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end


  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def is_attend?
    @event = Event.find(params[:user_event][:event_id])
    if current_user.user_events.find_by(event_id: @event.id)
      true
    else
      false
    end
  end

end
