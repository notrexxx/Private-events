class EventsController < ApplicationController
  before_action :logged_in, only: :index

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @creator = Event.find(params[:id]).creator
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to @event
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:user_id, :name, :description, :date)
  end

  def logged_in
    redirect_to '/login' unless logged_in?
  end
end
