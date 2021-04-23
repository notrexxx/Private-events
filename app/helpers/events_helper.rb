module EventsHelper
  def author_user
    @author_user ||= User.find_by(id: @creator[:id])
  end
end
