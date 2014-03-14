class BooksController < ApplicationController
  before_action :authorize, only: [:create,:new]
  def show
    @book = Book.find(params[:id])
  end

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(books_params)
    if @book.save
      redirect_to '/books'
    else
      render 'new'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(books_params)
      redirect_to '/books'
    else
      render action: 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_url
  end

  private
  def books_params
    params.require(:book).permit(:title, :isbn, :label_id,
     :publisher_id, :tag_ids => [], :author_ids => [])
  end

end
