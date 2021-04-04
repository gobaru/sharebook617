class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    unless @book.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.update(book_params)
      redirect_to @book
    else
      render :edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:image, :title, :author, :publisher, :price, :genre_id).merge(user_id: current_user.id)
  end

end
