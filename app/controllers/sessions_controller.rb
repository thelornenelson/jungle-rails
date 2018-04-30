class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if user = User.authenticate_with_credentials(params[:session][:email], params[:session][:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      render 'new'
    end
  end

  # def create
  #   @user = User.find_by_email(params[:session][:email])
  #   if @user && @user.authenticate(params[:session][:password])
  #     session[:user_id] = @user.id
  #     redirect_to '/'
  #   else
  #     render 'new'
  #   end
  # end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
