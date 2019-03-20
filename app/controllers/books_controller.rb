class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all
  end

  def show
  end

  def new
    if params[:back]
      @book = Book.new(book_params)
    else
      @book = Book.new
    end
  end

  def edit
  end

  def create
    @book = current_user.books.new(book_params)
    if @book.save
      redirect_to books_path, notice: "オススメ本を登録しました！"
    else
      render :new
    end
  end

  def update
    if @book.update(book_params)
      redirect_to books_path, notice: "オススメ本を編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path, notice: "オススメ本を削除しました"
  end

  def confirm
    @book = current_user.books.new(book_params)
    render :new if @book.invalid?
  end
end

private

def book_params
  params.require(:book).permit(:name, :description, :image, :image_cache)
end

def set_book
  @book = Book.find(params[:id])
end