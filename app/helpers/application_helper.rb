module ApplicationHelper
  def logout_link
    if logged_in?
      (link_to 'Logout', logout_path, class: 'btn btn-outline-danger')

    end
  end

  def nav_link_events
    link_to 'My Events', current_user, class: 'btn btn-outline-primary' if logged_in?
  end

  def nav_link_new_event
    link_to 'Create Event', new_event_path, class: 'btn btn-outline-success' if logged_in?
  end

  def login_link
    (link_to 'Login', login_path, class: 'btn btn-outline-success') unless logged_in?
  end

  def signup_link
    (link_to 'Signup', signup_path, class: 'btn btn-outline-primary') unless logged_in?
  end
end
