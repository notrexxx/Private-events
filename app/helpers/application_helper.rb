module ApplicationHelper

  def logout_link
    if logged_in?
    (link_to 'Logout', logout_path, class: 'btn btn-outline-danger')

    end
  end

  def nav_link_events
    if logged_in?
      link_to 'My Events',current_user, class: 'btn btn-outline-primary'
    end
  end

  def nav_link_new_event
    if logged_in?
      link_to 'Create Event',  new_event_path, class: 'btn btn-outline-success'
    end
  end

  def login_link
    (link_to 'Login', login_path, class: 'btn btn-outline-success') unless logged_in?
  end
  def signup_link
    (link_to 'Signup', signup_path, class: 'btn btn-outline-primary') unless logged_in?
  end

end
