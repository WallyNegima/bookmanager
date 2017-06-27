class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
    @book = Book.find(params[:id])
  end

end
