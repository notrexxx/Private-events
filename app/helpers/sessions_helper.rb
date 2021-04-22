module SessionsHelper

    def login(user)
        session[:user_id] = user.id
      end

      def current_user
        @current_user ||= User.find_by(id: session[:id]) if session[:id]
      end
end
