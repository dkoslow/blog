class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      sign_in(@user)
      redirect_to signin_url
    else
      flash.now[:error] = 'Email/Password combination not recognized'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
