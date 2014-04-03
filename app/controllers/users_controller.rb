class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in!(@user)
      flash[:notices] = ["Signed up!"]
      redirect_to subs_url
    else
      flash.now[:notices] = @user.error.full_messages
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.nil?
      flash[:notices] = ["We misplaced your id, sorry, try again"]
    else
      @user.destroy
    end
    redirect_to new_user_url
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
