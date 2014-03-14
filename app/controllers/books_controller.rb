class BooksController < ApplicationController
  def show

  end

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(books_params)
    @book.save
    redirect_to '/books'
  end

  private
  def books_params
    params.require(:book).permit(:title, :isbn, :label_id)
  end

end
