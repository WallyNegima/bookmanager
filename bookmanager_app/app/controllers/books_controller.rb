class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def edit
  end

  def scan
  end

  def show
    @book = Book.find(params[:id])
  end

end
