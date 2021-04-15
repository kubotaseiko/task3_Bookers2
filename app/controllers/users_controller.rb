class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.book.all
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
    redirect_to users_path
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
