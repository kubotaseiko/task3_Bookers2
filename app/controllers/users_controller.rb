class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.all
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if
      @user == current_user
    else
     redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render :edit
    end
  end
  
  def followings
    @user = User.find(params[:id])
  end

  def followers
    @user = User.find(params[:id])
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
