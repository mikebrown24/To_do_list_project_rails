class UsersController < ApplicationController
  def index
  end

  def create
    user = User.new(registration_params)
    if user.valid?
      user.save
      session[:user_id] = user.id
      redirect_to "/tasks/show"
    else 
      flash[:errors] = user.errors.full_messages  
    end
  end

  def authenticate
    user = User.find_by(username: login_params[:username])
    if user.nil?
      flash[:errors] = ['User not found']
      redirect_to '/'
    elsif user.authenticate(login_params[:password])
      session[:user_id] = user.id
      redirect_to "/tasks/show"
    else
      flash[:errors] = ['Incorrect Password']
      redirect_to '/'
    end
  end

  def logout
    reset_session
    redirect_to '/'
  end

  private
    def registration_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end

    def login_params
      params.require(:user).permit(:username, :password)
    end
end