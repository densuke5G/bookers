class BooksController < ApplicationController
  
  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book posted successfully!"
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end

  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Book deleted successfully!"
    redirect_to '/books'
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book edited successfully!"
      redirect_to book_path(@book.id)
    else
      render :edit
    end

  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
