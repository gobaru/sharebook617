class BooksController < ApplicationController
  before_action :authenticate_user!, only:[:new, :edit, :destroy]
  before_action :set_item, only:[:show, :edit, :update, :destroy]

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
  end

  def edit
    unless @book.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    @book.update(book_params)
    if @book.update(book_params)
      redirect_to @book
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    if @book.destroy
      redirect_to @book
    end
  end

  private

  def book_params
    params.require(:book).permit(:image, :title, :author, :publisher, :price, :genre_id).merge(user_id: current_user.id)
  end

  def set_item
    @book = Book.find(params[:id])
  end

end
