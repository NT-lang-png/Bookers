class BooksController < ApplicationController
  
  def new
    @book = Book.new
    @books = Book.all
  end
  
  def create
    book = Book.new(book_params)
    book.save
    redirect_to '/books/:id'  #idに変える必要あり
  end 

  def index
    @books = Book.all
  end

  def show
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(:id)
  end 
  
  private
  def book_params
    params.require(:book).permit(:title,:body)
  end
  
end
