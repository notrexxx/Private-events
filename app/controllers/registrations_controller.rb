class RegistrationsController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    if Registration.where(event_id: event.id, user_id: params[:user_id]).count.positive?
      redirect_to event_path(event)
    else
      registration = Registration.new(event_id: event.id, user_id: params[:user_id])
      if registration.save
        redirect_to event_path(event)

      end
    end
  end
end
