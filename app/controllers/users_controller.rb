class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      Calendar.create(user_id: @user.id)
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
    cookies[:hello] = "hello"
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password)
  end

end
