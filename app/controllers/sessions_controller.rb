class SessionsController < ApplicationController
  before_action :logged_in, only: :new
    def new

    end
  
    def create
      user = User.find_by(name: params[:session][:name])
      if user
        login user
        redirect_to root_path
      else
        render :new
      end
    end
  
    def destroy
      @current_user = nil
      session[:id] = nil
    end

  private
  def logged_in
    redirect_to root_path if logged_in?
  end
end
