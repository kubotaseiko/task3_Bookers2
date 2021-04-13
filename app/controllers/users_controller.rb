class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = Book.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
