module EventsHelper
  def author_user
    @author_user ||= User.find_by(id: @creator[:id])
  end

  def attendees_list(event_obj = nil)
    list = ' '
    event_obj ||= @event
    event_obj.attendees.each do |attendee|
      list = "#{list}#{attendee.name}, "
    end
    list
  end

  def register_btn
    (return unless logged_in? && (@event.date >= Date.today))
    button_to 'Register', registrations_path(event_id: @event.id, user_id: current_user.id), method: :post
  end

   end
