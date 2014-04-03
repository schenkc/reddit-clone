class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username],
    params[:user][:password])

    if !@user.nil?
      sign_in!(@user)
      flash[:notices] = ["Signed in!"]
      redirect_to subs_url
    else
      flash.now[:notices] = ["Invalid credentials. Please try again."]
      @user = User.new(user_params)
      render :new
    end
  end

  def destroy
    sign_out!
    flash[:notices] = ["Signed out!"]
    redirect_to new_session_url
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

end
