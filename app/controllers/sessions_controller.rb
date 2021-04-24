class SessionsController < ApplicationController
  def new; end

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
    redirect_to root_path
  end
end
