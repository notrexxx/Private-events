module UsersHelper

  def attended
    event =  Event.find(params[:id])
    if event.date <= Date.today
      raw( "<td>#{event.id}</td>
        <td>#{link_to event.name, event}</td>
      <td>#{event.date}</td>
        <td>#{event.description}</td>
      <td>#{attendees_list(event)}</td>")
    end
  end

  def future(user)
    user.attended_events.future
  end

  def past_event(user)
    user.attended_events.past_event
  end

end
