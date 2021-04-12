class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
    @user = User.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path(@book.id)
  end

  def destroy
  end

  def update
  end

  private
    def book_params
      params.require(:book).permit(:title, :body, :user_id)
    end

end
