class BooksController < ApplicationController
  
  
  def new
    @book = Book.new  
  end
  
  def create
    @book = Book.new(book_params)
    if @book.valid?
      @book.save
    return redirect_to book_path(book.id) , notice: '投稿に成功しました'
    else
      render :new
    end
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)  
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
