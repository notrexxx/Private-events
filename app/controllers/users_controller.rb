class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login @user
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @created_events = current_user.events
    @past_events = current_user.attended_events.past_event
    @upcoming_events = current_user.attended_events.future
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
